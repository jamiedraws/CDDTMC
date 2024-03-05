<%@ Page Language="C#" MasterPageFile="~/VersionViews/3.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content0" ContentPlaceHolderID="preload" runat="server">
	<link rel="preload" href="/css/site3/form.css" as="style" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="/css/site3/form.css" />
	<script defer src="/js/app.expando.js"></script>
	<script defer src="/js/express-checkout.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<%
	var productName = SettingsManager.ContextSettings["Label.ProductName"];
%>
	    <script>    
			var emailOptVD = '<%=ViewData["EmailOptInCbx"]%>';
		</script>

<main aria-label="Checkout" class="view form main-offer main-offer--present-header-first section">
	<div class="view__in main-offer__in section__in">
		<div class="main-offer__group">
			<div class="main-offer__header">
				<img src="/images/1.0000/man-care-for-your-man-parts.svg" alt="Man Care for your Man Parts&trade;" width="600" height="224">
			</div>
		</div>
	</div>

	<form autcomplete="on" action="/<%=DtmContext.OfferCode %>/<%=DtmContext.Version %>/<%=DtmContext.PageCode %><%=DtmContext.ApplicationExtension %>" method="post">
		<div class="view__in section__in">
			<div class="form">
				<div class="form__group form__group-section">
					<div class="view form__span-item">
						<div id="vse-errors" class="view__anchor"></div>
						<div role="alert" class="vse" data-vse-scroll>
							<%= Html.ValidationSummary("The following errors have occurred:") %>
						</div>
					</div>
					<input type="hidden" name="OrderType" id="OrderType" value="None"/>

					<div class="form__item form__watchlist">
						<div class="form form--frame">
							<div class="form__frame">
								<h2 class="form__watchlist-title">JOIN THE WAITLIST</h2>
								<p>Trojan Man Care will be available very soon. We apologize for any inconvenience. To join the waitlist, please enter your name, phone number, mailing address and email address below. You will be notified as soon as we are in stock PLUS receive an exclusive promotional discount for being first in line.</p>
								<p>As a thank you, we would like to mail you a coupon for a FREE Trojan product (up to $19.99*). Just take it into your local store for purchase.</p>
                                <p>*FREE Trojan product up to $19.99. Any one (1) Trojan<sup>&reg;</sup>, Trojan<sup>&reg;</sup> Magnum&trade;, Trojan<sup>&reg;</sup> Supra&trade; Bareskin&trade; or NaturaLamb&trade; Brand Condoms or Trojan<sup>&reg;</sup> Lubricants or Trojan<sup>&reg;</sup> Vibrations** Product 
                                    (**Trojan<sup>&reg;</sup> Vibrations Products are not available for sale in AL or VA.)</p>
                                <p>&ndash; The Trojan Team</p>
							</div>
						</div>
					</div>

					<div class="form__span-item form__message"><span class="form__error">*</span> Indicates Required Field</div>

					<div class="form__item">
						<div class="form__group-section">
							<div class="form__item form__section form__info-accordion view__scroll">
								<div id="billingInformation" class="form__copy">
									<div class="form form--frame">
										<fieldset class="form__fieldset form__fieldset--billing">
											<h2 class="form__title billingTitle">STEP 4: Enter Your Information</h2>
	
											<div class="form__span-item form__frame">
												<div class="form__group">
	
													<!-- Full Name -->
													<div class="form message">
														<%
															var billingFullNameMessage = Html.ValidationMessageFor(m => m.BillingFullName);
															var billingFullNameIsInvalid = billingFullNameMessage != null;
														%>
														<div class="form__field-label">
															<input type="text" name="BillingFullName" id="BillingFullName" autocomplete="section-bill billing name" placeholder="Full Name" data-required="true" data-pattern="^[A-z]+([A-z .,'-]*)?$" class="dtm__restyle form__field <%= billingFullNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingFullName"] %>">
															<label for="BillingFullName" class="message__label">
																<span class="form__error">* </span>Full Name
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (billingFullNameIsInvalid)
																		{ %>
																	<%= billingFullNameMessage %>
																	<% }
																		else
																		{ %>
																	Please enter Full name.
																<% } %>
																</span>
															</span>
														</div>
													</div>
	
													<!-- Phone -->
													<div class="form message">
														<%
															var phoneMessage = Html.ValidationMessageFor(m => m.Phone);
															var phoneIsInvalid = phoneMessage != null;
														%>
														<div class="form__field-label">
															<input type="tel" name="Phone" id="Phone" autocomplete="section-bill billing tel" placeholder="Phone" data-required="true" data-validationtype="phone" class="dtm__restyle form__field <%= phoneIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Phone"] %>">
															<label for="Phone" class="message__label">
																<span class="form__error">* </span>Phone
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (phoneIsInvalid)
																		{ %>
																	<%= phoneMessage %>
																	<% }
																		else
																		{ %>
																	Please enter a phone number.
																<% } %>
																</span>
															</span>
														</div>
													</div>
	
													<!-- Email -->
													<div class="form__span-item form message">
														<%
															var emailMessage = Html.ValidationMessageFor(m => m.Email);
															var emailIsInvalid = emailMessage != null;
														%>
														<div class="form__field-label">
															<input type="email" name="Email" id="Email" autocomplete="section-bill billing email" title="Format example: someone@someplace.com" data-required="true" data-pattern="^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$" placeholder="Email" class="dtm__restyle form__field <%= emailIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["Email"] %>">
															<label for="Email" class="message__label">
																<span class="form__error">* </span>Email
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (emailIsInvalid)
																		{ %>
																	<%= emailMessage %>
																	<% }
																		else
																		{ %>
																	Please enter an email address.
																<% } %>
																</span>
															</span>
														</div>
													</div>

                                                    <!-- Street -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var billingStreetMessage = Html.ValidationMessageFor(m => m.BillingStreet);
                                                            var billingStreetIsInvalid = billingStreetMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingStreet" id="BillingStreet" autocomplete="section-bill billing address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field <%= billingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet"] %>">
                                                            <label for="BillingStreet" class="message__label">
                                                                <span class="form__error">* </span>Address
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingStreetIsInvalid)
                                                                        { %>
                                                                    <%= billingStreetMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter an address.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Street 2 -->
                                                    <div class="form__span-item form message">
                                                        <%
                                                            var billingStreet2Message = Html.ValidationMessageFor(m => m.BillingStreet2);
                                                            var billingStreet2IsInvalid = billingStreet2Message != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingStreet2" id="BillingStreet2" autocomplete="section-bill billing address-line2" placeholder="Address 2" class="dtm__restyle form__field <%= billingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet2"] %>">
                                                            <label for="BillingStreet2" class="message__label">
                                                                Address 2
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingStreet2IsInvalid)
                                                                        { %>
                                                                    <%= billingStreet2Message %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter an address.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- City -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var billingCityMessage = Html.ValidationMessageFor(m => m.BillingCity);
                                                            var billingCityIsInvalid = billingCityMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingCity" id="BillingCity" placeholder="City" autocomplete="section-bill billing address-level2" data-required="true" class="dtm__restyle form__field <%= billingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingCity"] %>">
                                                            <label for="BillingCity" class="message__label">
                                                                <span class="form__error">* </span>City
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingCityIsInvalid)
                                                                        { %>
                                                                    <%= billingCityMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter a city.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- State -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var billingStateMessage = Html.ValidationMessageFor(m => m.BillingState);
                                                            var billingStateIsInvalid = billingStateMessage != null;
                                                        %>
                                                        <div class="form__field-label" id="billStateParent">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                               <%= Html.DropDownListFor(m => m.BillingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Labels["StatePlaceholder"], new { @class="dtm__restyle form__field", @data_required="true", @data_parent="billStateParent", @autocomplete="section-bill billing address-level1" }) %>
                                                                    
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="BillingState" class="message__label">
                                                                <span class="form__error">* </span>State
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingStateIsInvalid)
                                                                        { %>
                                                                    <%= billingStateMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please choose a state.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Zip Code -->
                                                    <div class="form__take-some form message">
                                                        <%
                                                            var billingZipMessage = Html.ValidationMessageFor(m => m.BillingZip);
                                                            var billingZipIsInvalid = billingZipMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <input type="text" name="BillingZip" id="BillingZip" placeholder="Zip Code" autocomplete="section-bill billing postal-code" data-required="true" class="ui-autocomplete-input dtm__restyle form__field <%= billingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingZip"] %>">
                                                            <label for="BillingZip" class="message__label">
                                                                <span class="form__error">* </span>Zip Code
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingZipIsInvalid)
                                                                        { %>
                                                                    <%= billingZipMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please enter a zip code.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>

                                                    <!-- Country -->
                                                    <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                        <%
                                                            var billingCountryMessage = Html.ValidationMessageFor(m => m.BillingCountry);
                                                            var billingCountryIsInvalid = billingCountryMessage != null;
                                                        %>
                                                        <div class="form__field-label">
                                                            <div class="form form--select">
                                                                <div class="form__contain">
                                                                    <%= Html.DropDownListFor(m => m.BillingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["BillingCountry"]), new { @class="dtm__restyle form__field" }) %>
                                                                    <span class="form__field form__button">
                                                                        <svg class="icon icon--combobox">
                                                                            <use href="#icon-chevron"></use>
                                                                        </svg>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <label for="BillingCountry" class="message__label">
                                                                <span class="form__error">* </span>Country
                                                            </label>
                                                            <span class="message__group" role="alert">
                                                                <span class="message__invalid">
                                                                    <% if (billingCountryIsInvalid)
                                                                        { %>
                                                                    <%= billingCountryMessage %>
                                                                    <% }
                                                                        else
                                                                        { %>
                                                                    Please choose a country.
                                                                <% } %>
                                                                </span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="form form__take-all message shipping" id="ShippingIsSameDiv">
													<input name="ShippingIsDifferentThanBilling" type="hidden" value="false">
                                                    </div>
													<div class="form form--frame message shipping" style="display:none"  id="shippingInformation">
                                                        <fieldset class="form__fieldset form__expando shipping__required">
                                                        <h2 class="form__title shippingTitle"><strong>STEP <span id="shipStepNumber">5</span>:</strong> Enter your shipping information:</h2>
                                                        <div class="form__span-item form__frame">
                                                            <div class="form__group">
                                                                <!-- Full Name -->
                                                                <div class="form message">
                                                                    <%
                                                                        var shippingFullNameMessage = Html.ValidationMessageFor(m => m.ShippingFullName);
                                                                        var shippingFullNameIsInvalid = shippingFullNameMessage != null;
                                                                    %>
                                                                    <div class="form__field-label">
                                                                        <input type="text" title="Name can only contain letters" autocomplete="section-ship shipping name" data-required="true" data-pattern="^[A-z]+([A-z .,'-]*)?$" name="ShippingFullName" id="ShippingFullName" placeholder="Full Name" class="dtm__restyle form__field shipping__required shipping__field <%= shippingFullNameIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingFullName"] %>">
                                                                        <label for="ShippingFullName" class="message__label">
                                                                            <span class="form__error">* </span>Full Name
                                                                        </label>
                                                                        <span class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingFullNameIsInvalid)
                                                                                { %>
                                                                                <%= shippingFullNameMessage %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please enter a Full name.
                                                                                <% } %>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <!-- Street -->
                                                                <div class="form__span-item form message">
                                                                    <%
                                                                        var shippingStreetMessage = Html.ValidationMessageFor(m => m.ShippingStreet);
                                                                        var shippingStreetIsInvalid = shippingStreetMessage != null;
                                                                    %>
                                                                    <div class="form__field-label">
                                                                        <input type="text" name="ShippingStreet" id="ShippingStreet"  autocomplete="section-ship shipping address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet"] %>">
                                                                        <label for="ShippingStreet" class="message__label">
                                                                            <span class="form__error">* </span>Address
                                                                        </label>
                                                                        <span class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingStreetIsInvalid)
                                                                                { %>
                                                                                <%= shippingStreetMessage %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please enter an address.
                                                                                <% } %>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <!-- Street 2 -->
                                                                <div class="form__span-item form message">
                                                                    <%
                                                                        var shippingStreet2Message = Html.ValidationMessageFor(m => m.ShippingStreet2);
                                                                        var shippingStreet2IsInvalid = shippingStreet2Message != null;
                                                                    %>
                                                                    <div class="form__field-label">
                                                                        <input type="text" name="ShippingStreet2" id="ShippingStreet2" autocomplete="section-ship shipping address-line2" placeholder="Address 2" class="dtm__restyle form__field shipping__field <%= shippingStreet2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingStreet2"] %>">
                                                                        <label for="ShippingStreet2" class="message__label">
                                                                            Address 2
                                                                        </label>
                                                                        <span class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingStreet2IsInvalid)
                                                                                { %>
                                                                                <%= shippingStreet2Message %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please enter an address.
                                                                                <% } %>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <!-- City -->
                                                                <div class="form__take-some form message">
                                                                    <%
                                                                        var shippingCityMessage = Html.ValidationMessageFor(m => m.ShippingCity);
                                                                        var shippingCityIsInvalid = shippingCityMessage != null;
                                                                    %>
                                                                    <div class="form__field-label">
                                                                        <input type="text" name="ShippingCity" id="ShippingCity" autocomplete="section-ship shipping address-level2" placeholder="City" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingCityIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingCity"] %>">
                                                                        <label for="ShippingCity" class="message__label">
                                                                            <span class="form__error">* </span>City
                                                                        </label>
                                                                        <span class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingCityIsInvalid)
                                                                                { %>
                                                                                <%= shippingCityMessage %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please enter a city.
                                                                                <% } %>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <!-- State -->
                                                                <div class="form__take-some form message">
                                                                    <%
                                                                        var shippingStateMessage = Html.ValidationMessageFor(m => m.ShippingState);
                                                                        var shippingStateIsInvalid = shippingStateMessage != null;
                                                                    %>
                                                                    <div class="form__field-label" id="billStateParent">
                                                                        <div class="form form--select">
                                                                            <div class="form__contain">
                                                                                <%= Html.DropDownListFor(m => m.ShippingState, new SelectList(Model.States, "StateCode", "StateName"), LabelsManager.Context["StatePlaceholder"], new { @class="dtm__restyle form__field shipping__required shipping__field", @autocomplete="section-ship shipping address-level1" }) %>
                                                                                <span class="form__field form__button">
                                                                                    <svg class="icon icon--combobox">
                                                                                        <use href="#icon-chevron"></use>
                                                                                    </svg>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <label for="ShippingState" class="message__label">
                                                                            <span class="form__error">* </span>State
                                                                        </label>
                                                                        <span class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingStateIsInvalid)
                                                                                { %>
                                                                                <%= shippingStateMessage %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please choose a state.
                                                                                <% } %>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <!-- Zip Code -->
                                                                <div class="form__take-some form message">
                                                                    <%
                                                                        var shippingZipMessage = Html.ValidationMessageFor(m => m.ShippingZip);
                                                                        var shippingZipIsInvalid = shippingZipMessage != null;
                                                                    %>
                                                                    <div class="form__field-label">
                                                                        <input type="text" name="ShippingZip" id="ShippingZip" autocomplete="section-ship shipping postal-code" placeholder="Zip Code" data-required="true" class="dtm__restyle form__field shipping__required shipping__field <%= shippingZipIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["ShippingZip"] %>">
                                                                        <label for="ShippingZip" class="message__label">
                                                                            <span class="form__error">* </span>Zip Code
                                                                        </label>
                                                                        <span class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingZipIsInvalid)
                                                                                { %>
                                                                                <%= shippingZipMessage %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please enter a zip code.
                                                                                <% } %>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                </div>

                                                                <!-- Country -->
                                                                <div class="form message" <%=Model.Countries.Count() > 1 ? string.Empty :"style='display:none'" %>>
                                                                    <%
                                                                        var shippingCountryMessage = Html.ValidationMessageFor(m => m.ShippingCountry);
                                                                        var shippingCountryIsInvalid = shippingCountryMessage != null;
                                                                    %>
                                                                    <div class="form__field-label">
                                                                        <div class="form form--select">
                                                                            <div class="form__contain">
                                                                                <%= Html.DropDownListFor(m => m.ShippingCountry, new SelectList(Model.Countries, "CountryCode", "CountryName", ViewData["ShippingCountry"]), new { @class="dtm__restyle form__field" }) %>
                                                                                <span class="form__field form__button">
                                                                                    <svg class="icon icon--combobox">
                                                                                        <use href="#icon-chevron"></use>
                                                                                    </svg>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                        <label for="ShippingCountry" class="message__label">
                                                                            <span class="form__error">* </span>Country
                                                                        </label>
                                                                        <label class="message__group" role="alert">
                                                                            <span class="message__invalid">
                                                                                <% if (shippingCountryIsInvalid)
                                                                                { %>
                                                                                <%= shippingCountryMessage %>
                                                                                <% }
                                                                                else
                                                                                { %>
                                                                                    Please choose a country.
                                                                                <% } %>
                                                                            </span>
                                                                        </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </fieldset>
                                                    </div>

												</div>
											</div>
										</fieldset>
									</div>
								</div>
								<div class="view form form--frame">
									<div id="additionalInformation" class="view__anchor"></div>
									<div class="form__copy">
										<fieldset class="form__fieldset form__fieldset--additional">
											<h2 class="form__title">Additional Information</h2>
	
											<div class="form__copy form__frame">
												<div class="form__span-item form message">
													<div class="form__checkbox-label">
														<input type="hidden" name="EmailOptIn" id="EmailOptIn" value="False" />
														<input
															type="checkbox"
															id="EmailOptInCbx"
															name="EmailOptInCbx"
															aria-labelledby="EmailOptInCbxLabel" />
														<label for="EmailOptInCbx" class="form__label">
															<span class="form__checkbox"></span>
															<span id="EmailOptInCbxLabel">Yes, I'd like to receive promotional communications from Trojan. Please review Church & Dwight's <a id="emailoptin-privacy-policy" href="https://churchdwight.com/privacy-policy.aspx" target="_blank">Privacy Policy</a> to understand how Church & Dwight collects and uses personal information.</span>
														</label>
													</div>
												</div>
											</div>
										</fieldset>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form__span-item">
						<div class="form__group form__group-section">
							<div id="calltoAction" class="form__action-text form form--frame">
								<div class="form__frame form__copy">
									<div class="form__action">
										<button type="submit" id="AcceptOfferButton" name="acceptOffer" class="form__submit form_validation_required" data-state="card" data-order-type='{ "PayPalEC" : "Continue with PayPal", "CARD" : "Submit" }'>
											<span class="button">
												<span>Submit</span>
											</span>
										</button>
									</div>
									<div id="disclaimerText" class="form__copy">
										<div class="form__ssl">
											<img src="/shared/images/PositiveSSL_tl_trans.png" alt="Secure Site SSL Encryption" width="100" height="100" loading="lazy">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</form>
</main>
		
</asp:Content>