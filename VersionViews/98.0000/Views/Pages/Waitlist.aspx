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
								<p>Trojan Man Care will be available very soon. We apologize for any inconvenience. To join the waitlist, please enter your name, phone number, and email address below. You will be notified as soon as we are in stock PLUS receive an exclusive promotional discount for being first in line.</p>
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