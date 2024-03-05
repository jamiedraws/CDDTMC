<%@ Import Namespace="Dtm.Framework.Base.Models" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="Dtm.Framework.ClientSites.Web.Models" %>
<%@ Import Namespace="Newtonsoft.Json" %>
<%@ Import Namespace="Newtonsoft.Json.Linq" %>
<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<BaseClientViewData>" %>
<%

    // Load Group Code
    var groupCode = (ViewData["GroupCode"] as string ?? ViewData["QuestionGroupCode"] as string ?? "SURVEY");

    //Get title text
    var title = ViewData["TitleText"] as string ?? string.Empty;

    //Get survey load type
    var loadType = (ViewData["LoadType"] as string ?? "OnLoad");

    //Get close popup automatically load type
    var closePopAuto = (ViewData["ClosePopAuto"] as string ?? "false");

    //Get Override Css
    var overrideCss = (ViewData["OverrideCss"] as string ?? string.Empty);

    //Get Custom Js Implementation
    var overrideJs = (ViewData["OverrideJs"] as string ?? string.Empty);

    //Get Mustache Template layout
    var questionsLayout = (ViewData["QuestionLayout"] as string ?? "11");

    int questionsLayoutId;
    int.TryParse(questionsLayout, out questionsLayoutId);

    CampaignOfferQuestionGroupViewData surveyGroup = Model.QuestionGroups
            .FirstOrDefault(q => q.Code.Equals(groupCode, StringComparison.InvariantCultureIgnoreCase)) ?? new CampaignOfferQuestionGroupViewData();

    bool hasSurveyGroup = surveyGroup.Id != 0;

    if (hasSurveyGroup)
    {
        int idleThreshold;
        int.TryParse(ViewData["IdleThreshold"] as string ?? string.Empty, out idleThreshold);

        %>
        <link rel="stylesheet" href="/Shared/css/template/controls/survey-popup/modal-dialog-survey.css"/>
        <script 
            defer 
            src="/Shared/js/template/controls/survey-popup/modal-dialog-survey.es5.js" 
            data-context='{ "loadType": "<%= loadType %>", "groupCode": "<%= groupCode %>", "idleThreshold": <%= idleThreshold %>, "visitorSessionId": "<%= DtmContext.VisitorSessionId.ToString() %>" }'
        ></script>

        <template id="survey-group-template" data-modal-dialog-template>
        <form id="survey-group" data-modal-dialog-container data-modal-dialog-title="Customer Survey" aria-labelledby="survey-group-title" class="view survey-group element-controller section">
            <div class="view__in section__contain">
            <h2 tabindex="-1" id="survey-group-title" class="survey-group__title">Complete this short survey about your shopping experience</h2>
            <%
            surveyGroup.Questions.ForEach(question =>
            {
                int questionIndex = surveyGroup.Questions.IndexOf(question) + 1;
                
                string fieldsetAttributeList = string.Format(@"id=""survey-fieldset-{0}"" class=""survey-fieldset element-controller__element""", questionIndex);

                if (questionIndex.Equals(1))
                {
                    fieldsetAttributeList = string.Format(@"{0} data-element-controller-name", fieldsetAttributeList);
                }

                List<CampaignOfferAnswerViewData> answers = question.Answers.OrderBy(a => a.DisplayRank).ToList(); 
                %>
                <fieldset <%= fieldsetAttributeList %>>
                    <legend class="survey-fieldset__legend"><%= question.Text %></legend>
                    <div class="survey-fieldset__group">
                        <div class="survey-fieldset__fields">
                        <% 
                            switch(question.InputTypeCode)
                            {
                                case "RADIO":
                                    %>
                                    <div class="radio-group message element-controller">
                                        <div class="radio-group__group message__select">
                                        <%
                                        string controllerIdRef = string.Format("element-controller-question-{0}", question.Code);

                                        answers.ForEach(answer =>
                                        {
                                            string inputId = answer.Code + question.Code;

                                            string labelId = string.Format("Label-{0}", inputId);

                                            bool controlsTextArea = answer.Code.Contains("OTHER");

                                            if (controlsTextArea)
                                            {
                                                controllerIdRef = string.Format("element-controller-answer-{0}", answer.Code);
                                            }

                                            string inputAttributeList = string.Format(@"type=""radio"" required id=""{0}"" name=""{1}"" value=""{2}"" aria-labelledby=""{3}"" aria-controls=""{4}""", 
                                                inputId, 
                                                question.Details, 
                                                answer.Text, 
                                                labelId,
                                                controllerIdRef);

                                            string textareaId = string.Format("{0}-{1}", answer.Code, question.Details);
                                            %>
                                            <div class="survey-fieldset__field form form--radio">
		                                        <div class="form__radio-label">
			                                        <input <%= inputAttributeList %> />
			                                        <label for="<%= inputId %>" class="form__label">
				                                        <span class="form__radio"></span>
				                                        <span id="<%= labelId %>"><%= answer.Text %></span>
			                                        </label>
		                                        </div>
		                                    </div>
                                            <%
                                            if (controlsTextArea)
                                            {
                                                %>
                                                <div class="survey-fieldset__field form message element-controller__element" id="<%= controllerIdRef %>">
                                                    <div class="form__field-label message__select">
                                                        <textarea name="<%= textareaId %>" id="<%= textareaId %>" placeholder="Write in answer please" class="form__field"></textarea>
                                                        <label for="<%= textareaId %>" class="message__label">
                                                            <span class="form__error">* </span>Answer
                                                        </label>
                                                    </div>
                                                    <span class="message__group" role="alert">
                                                        <span class="message__invalid">
                                                            Please enter an answer.
                                                        </span>
                                                    </span>
                                                </div>
                                                <%
                                            }
                                        });
                                        %>
                                            <div class="element-element-controller__element" id="element-controller-question-<%= question.Code %>"></div>
                                        </div>
                                        <div class="message__group" role="alert">
				                            <span id="action-code-error-message" class="message__invalid">Please choose an answer.</span>
			                            </div>
                                    </div>
                                    <%
                                    break;
                                case "TEXTBOX":
                                    string textboxId = question.Details;
                                    %>
                                    <div class="survey-fieldset__field form message">
                                        <div class="form__field-label message__select">
                                            <textarea name="<%= textboxId %>" id="<%= textboxId %>" placeholder="Write in answer please" class="form__field"></textarea>
                                            <label for="<%= textboxId %>" class="message__label">
                                                Answer
                                            </label>
                                        </div>
                                        <span class="message__group" role="alert">
                                            <span class="message__invalid">
                                                Please enter an answer.
                                            </span>
                                        </span>
                                    </div>
                                    <%
                                    break;
                            }
                        %>
                        </div>
                        <%
                            int questionsAmount = surveyGroup.Questions.Count();
                            if (questionsAmount > 1)
                            {
                                string questionLocation = string.Format("Question {0} of {1}", 
                                    questionIndex, 
                                    questionsAmount);
                                %>
                                <span class="survey-fieldset__location"><%= questionLocation %></span>
                                <%

                                int previousQuestionIndex = questionIndex - 1;
                                if (previousQuestionIndex > 0)
                                {
                                    %>
                                    <a href="#survey-fieldset-<%= previousQuestionIndex %>" aria-controls="survey-fieldset-<%= previousQuestionIndex %>" data-fieldset-navigator="prev" class="survey-fieldset__link button">
                                        <span>Back</span>
                                    </a>
                                    <%
                                }

                                int nextQuestionIndex = questionIndex + 1;
                                if (nextQuestionIndex <= questionsAmount)
                                {
                                    %>
                                    <a href="#survey-fieldset-<%= nextQuestionIndex %>" aria-controls="survey-fieldset-<%= nextQuestionIndex %>" data-fieldset-navigator="next" class="survey-fieldset__link button">
                                        <span>Continue</span>
                                    </a>
                                    <%
                                }
                            } 

                            if (questionIndex == questionsAmount)
                            {
                                %>
                                <button type="button" id="surveySubmit" class="survey-fieldset__button button">
                                    <span>Submit</span>
                                </button>
                                <%
                            }
                        %>
                    </div>
                </fieldset>
                <%
            });
            %>
            </div>
        </form>    
        </template>
        <%
    }
    else
    {
        new SiteExceptionHandler("No SurveyGroup found");
    }
%>