<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<footer aria-label="Copyright and Policies" class="view footer section @print-only-hide">
	<div id="footer" class="view__anchor"></div>
	<div class="view__in section__in">
		<div class="section__block">
			<div class="logo-text">
				<svg class="logo-text__logo">
					<use href="#logo"></use>
				</svg>
			</div>
		</div>
		<% 
			Html.RenderPartial("SitemapList");
		%>
	</div>
</footer>

<% 
	List<string> includePageCodes = new List<string> { "Waitlist" };
	bool isStartPage = DtmContext.Page.IsStartPageType || includePageCodes.Contains(DtmContext.PageCode);

	Html.RenderPartial("Scripts");
	
	if ( isStartPage ) 
	{ 

		Html.RenderSnippet("ORDERFORMSCRIPT");
		%>
		<script>
            const setBraintreeHostedFieldsStyles = function () {
                return {
                    'font-size': '1em',
                    'font-family': 'Helvetica, Arial, sans-serif',
                    'font-weight': 'normal',
                    'line-height': 'normal',
                    'color': '#333',
                };
			};

            (function () {
                const emailOptIn = document.getElementById("EmailOptIn");
				if (!emailOptIn) return;

				const emailOptInCbx = document.getElementById("EmailOptInCbx");
				if (!emailOptInCbx) return;

                emailOptInCbx.addEventListener("click", function () {
					emailOptIn.value = this.checked ? "True" : "False";
                });
            })();
        </script>
		<%
	}
%>

<%= Model.FrameworkVersion %>

<div class="l-controls" aria-hidden="true" role="none">
  <% 
	  Html.RenderSiteControls(SiteControlLocation.ContentTop);
	  Html.RenderSiteControls(SiteControlLocation.ContentBottom);
	  Html.RenderSiteControls(SiteControlLocation.PageBottom);
  %>
</div>