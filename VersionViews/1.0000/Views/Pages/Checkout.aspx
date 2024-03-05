<%@ Page Language="C#" MasterPageFile="~/VersionViews/1.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content0" ContentPlaceHolderID="preload" runat="server">
	<link rel="preload" href="/css/site1/form.css" as="style" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="/css/site1/form.css" />
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

					<section aria-label="Offer is only available online, complete order form to finish purchase" class="view form-title section">
						<div class="view__in section__in">
							<span class="form-title__not-available">THIS OFFER IS NOT AVAILABLE IN STORES OR SOLD INDIVIDUALLY!</span>
						</div>
					</section>

					<div class="view form__span-item">
						<div id="vse-errors" class="view__anchor"></div>
						<div role="alert" class="vse" data-vse-scroll>
							<%= Html.ValidationSummary("The following errors have occurred:") %>
						</div>
					</div>

					<div class="form__span-item form form--frame">
						<div class="view form__fieldset">
							<div id="main" class="view__anchor"></div>
							<h2 class="form__title">STEP 1: Select Your Quantity</h2>
							<div class="form__frame">
								<div class="offer-group">
									<div class="offer-group__group">
										<div class="offer-group__content">
											<div class="offer-picture">
												<div class="offer-picture__group">
													<div class="offer-picture__offer">
														<ul class="offer-picture__title">
															<li>Deodorizing Cleanser</li>
															<li>Body Spray</li>
															<li>Ball Deodorant</li>
														</ul>
														<div class="offer-picture__text">
															<p>Plus <b>FREE</b> Toiletry bag*</p>
															<small>*while supplies last</small>
														</div>
														<div class="offer-picture__price">$29.99</div>
														<div class="offer-picture__shipping">FREE SHIPPING</div>
													</div>
													<div class="offer-picture__picture">
														<img src="/images/1.0000/offer.png" alt="3 bottles of Trojan Man Care and 1 toiletry bag" width="463" height="396">
													</div>
												</div>
											</div>
										</div>
										<div class="offer-group__offer">
											<b>How many bundles would you like?</b>
											<div class="form form--inline-combobox-label message">
												<div class="form__field-label">
													<div class="form form--select">
														<div class="form__contain">
															<input type="hidden" name="NoEdit" value="TMJ">
															<select id="quantitySelection" class="form__field" required data-code="TMJ">
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
															</select>
															<span class="form__field form__button">
																<svg class="icon icon--combobox" focusable="false" role="presentation">
																	<use href="#icon-chevron"/>
																</svg>
															</span>
														</div>
													</div>
													<label class="message__group" for="quantitySelection" role="alert">
														<span class="message__label">
															<span class="form__error">* </span>Qty
														</span>
														<span class="message__invalid">
															Please select a quantity
														</span>
													</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="form__span-item form form--frame">
						<div class="form__fieldset">
							<h2 class="form__title">Step 2: Enter Promo Code</h2>
							<div class="form__frame">
								<div class="form__field-label form__field-label-button">
									<label for="promoCode" class="message__label">Promo Code</label>
									<input type="text" name="promoCode" id="promoCode" class="dtm__restyle form__field ddlPromo cartParam">
									<button type="button" class="button ddlPromoButton" id="promoCodeButton">
										<span>Apply Code</span>
									</button>
									<span class="message__group" role="alert">
										<span id="errorMessage" class="message__invalid">
											Please enter a valid promo code.
										</span>
										<span id="successMessage" class="message__valid">
											Thank you! Your promo code was successfully applied.
										</span>
									</span>
								</div>
							</div>
						</div>
					</div>
					<div class="form__span-item form form--frame">
						<div class="form__fieldset">
							<h2 class="form__title reviewOrderTitle">STEP 3: Review Your Order</h2>
							<div class="c-brand--form order-table reviewTable form__frame">
								<% Html.RenderPartial("OrderFormReviewTable"); %>
							</div>
						</div>
					</div>
					<div class="form__span-item form__message"><span class="form__error">*</span> Indicates Required Field</div>
					<div class="form__item">
						<div class="form__group-section">
							<div class="form__item form__section" data-viewport>
								<div class="view__scroll form form--frame">
									<fieldset class="form__fieldset">
										<h2 class="form__title paymentFormTitle">STEP 4: Select Your Payment Method</h2>
										<div class="form__frame">
											<!-- Card Type -->
											<div class="form__span-item form message">
												<div class="form__group">
													<div id="cc" class="form__group form__payment-icons"></div>
												</div>
												<%
													var cardTypeMessage = Html.ValidationMessageFor(m => m.CardType);
													var cardTypeIsInvalid = cardTypeMessage != null;
												%>
												<div id="CardTypeCt" class="form__field-label">
													<div class="form form--select">
														<div class="form__contain">
															<%= Html.DropDownList("CardType", new[]
																{
																	new SelectListItem { Text = "Visa", Value = "V"},
																	new SelectListItem { Text = "Mastercard", Value = "M"},
																	new SelectListItem { Text = "Discover", Value = "D"},
																	new SelectListItem { Text = "American Express", Value= "AX"}
																}, new { @class = "form__field dtm__restyle" })
															%>
															<span class="form__field form__button">
																<svg class="icon icon--combobox">
																	<use href="#icon-chevron"></use>
																</svg>
															</span>
														</div>
													</div>
													<label class="message__group" for="CardType" role="alert">
														<span class="message__label">
															<span class="form__error">* </span>Card Type
														</span>
														<span class="message__invalid">
															<% if (cardTypeIsInvalid)
															{ %>
															<%= cardTypeMessage %>
															<% }
															else
															{ %>
																Please choose a card type.
															<% } %>
														</span>
													</label>
												</div>
											</div>

											<div id="CardNumberCt" class="form__span-item">
												<div class="form__group" id="paymentInformation">
													<div role="alert" id="vse-payment" data-vse-scroll></div>
													<!-- Card Number -->
													<div class="form__span-item form message">
														<%
															var cardNumberMessage = Html.ValidationMessageFor(m => m.CardNumber);
															var cardNumberIsInvalid = cardNumberMessage != null;
														%>
														<div class="form__field-label">
															<input type="tel" name="CardNumber" id="CardNumber" placeholder="Card Number" data-required="true" data-validationtype="card" class="dtm__restyle form__field <%= cardNumberIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardNumber"] %>">
															<label for="CardNumber" class="message__label">
																<span class="form__error">* </span>Card Number
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (cardNumberIsInvalid)
																	{ %>
																	<%= cardNumberMessage %>
																	<% }
																	else
																	{ %>
																		Please enter a valid card number.
																	<% } %>
																</span>
															</span>
														</div>
													</div>

													<!-- Card Expiration Month -->
													<div id="CardExpirationCt" class="form message">
														<%
															var cardExpirationMonthMessage = Html.ValidationMessageFor(m => m.CardExpirationMonth);
															var cardExpirationMonthIsInvalid = cardExpirationMonthMessage != null;
														%>
														<div class="form__field-label">
															<div class="form form--select message__select">
																<div class="form__contain">
																	<%= Html.CardExpirationMonth("CardExpirationMonth", new { @id="CardExpirationMonth", @class = "form__field dtm__restyle", @data_required="true", @data_validationtype="cardExp", @data_parent="CardExpirationCt" }) %>
																	<span class="form__field form__button">
																		<svg class="icon icon--combobox">
																			<use href="#icon-chevron"></use>
																		</svg>
																	</span>
																</div>
															</div>
															<label for="CardExpirationMonth" class="message__label">
																<span class="form__error">* </span>Card Expiration Month
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (cardExpirationMonthIsInvalid)
																	{ %>
																	<%= cardExpirationMonthMessage %>
																	<% }
																	else
																	{ %>
																		Please choose an expiration month.
																	<% } %>
																</span>
															</span>
														</div>
													</div>

													<!-- Card Expiration Year -->
													<div id="CardExpirationYearCt" class="form message">
														<%
															var cardExpirationYearMessage = Html.ValidationMessageFor(m => m.CardExpirationYear);
															var cardExpirationYearIsInvalid = cardExpirationYearMessage != null;
														%>
														<div class="form__field-label">
															<div class="form form--select message__select">
																<div class="form__contain">
																	<%= Html.NumericDropDown("CardExpirationYear", DateTime.Now.Year, DateTime.Now.Year + 10, ViewData["CardExpirationYear"], new { @id="CardExpirationYear", @class = "form__field dtm__restyle" }) %>
																	<span class="form__field form__button">
																		<svg class="icon icon--combobox">
																			<use href="#icon-chevron"></use>
																		</svg>
																	</span>
																</div>
															</div>
															<label for="CardExpirationYear" class="message__label">
																<span class="form__error">* </span>Card Expiration Year
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (cardExpirationYearIsInvalid)
																	{ %>
																	<%= cardExpirationYearMessage %>
																	<% }
																	else
																	{ %>
																		Please enter an expiration year.
																	<% } %>
																</span>
															</span>
														</div>
													</div>

													<!-- Card CVV2 -->
													<div id="CardCVV2Ct" class="form__span-item form message">
														<%
															var cardCVV2Message = Html.ValidationMessageFor(m => m.CardCvv2);
															var cardCVV2IsInvalid = cardCVV2Message != null;
														%>
														<div class="form__field-label form__cvv">
															<input type="text" name="CardCvv2" id="CardCvv2" placeholder="CVV2" data-required="true" data-validationtype="cvv" class="dtm__restyle form__field <%= cardCVV2IsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["CardCvv2"] %>">
															<label for="CardCvv2" class="message__label">
																<span class="form__error">* </span>CVV2
															</label>
															<span class="message__group" role="alert">
																<span class="message__invalid">
																	<% if (cardCVV2IsInvalid)
																	{ %>
																	<%= cardCVV2Message %>
																	<% }
																	else
																	{ %>
																		Please enter a CVV number.
																	<% } %>
																</span>
															</span>
															<a data-fancybox=""  data-options='{ "baseClass" : "fancybox-container--cvv" }' data-type="iframe" href="/shared/cvv.html" title="Learn What is CVV2" id="cvv2" class="form__link">What is CVV2?</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</fieldset>
								</div>
							</div>
							<div class="form__item form__section form__info-accordion view__scroll">
								<div id="billingInformation" class="form__copy">
									<div class="form form--frame">
										<fieldset class="form__fieldset">
											<h2 class="form__title billingTitle">STEP 5: Enter Your Billing Information</h2>

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
													<!-- Street -->
													<div class="form__span-item form message">
														<%
															var billingStreetMessage = Html.ValidationMessageFor(m => m.BillingStreet);
                                                            var billingStreetIsInvalid = billingStreetMessage != null;
                                                            if(!billingStreetIsInvalid && DtmContext.OrderId > 0 && !Model.ShippingIsDifferentThanBilling)
															{
																billingStreetMessage = Html.ValidationMessageFor(m => m.ShippingStreet);
																billingStreetIsInvalid = billingStreetMessage != null;
															}
														%>
														<div class="form__field-label">
															<input type="text" name="BillingStreet" id="BillingStreet" autocomplete="section-bill billing address-line1" placeholder="Address" data-required="true" class="dtm__restyle form__field <%= billingStreetIsInvalid ? "message__is-invalid" : string.Empty %>" value="<%= ViewData["BillingStreet"] %>">
															<label for="BillingStreet" class="message__label">
																<span class="form__error">* </span>Address (PO Boxes not accepted)
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
															<div class="form form--select message__select">
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

													<div class="form__span-item form message" id="ShippingIsSameDiv">
														<div class="form__checkbox-label form__copy">
															<% 
                                                                var shippingIsDifferentThanBilling = DtmContext.OrderId > 0 && Model.ShippingIsDifferentThanBilling;
															%>
															<input type="checkbox" id="ShippingIsDifferentThanBilling" name="ShippingIsDifferentThanBilling" value="true" aria-labelledby="ShippingIsDifferentThanBillingLabel" onclick="if (this.checked) { $('#shippingInformation').show() } else { $('#shippingInformation').hide() }" <%=shippingIsDifferentThanBilling ? "checked" : string.Empty %> />
															<input name="ShippingIsDifferentThanBilling" type="hidden" value="false">
															<label for="ShippingIsDifferentThanBilling" class="form__label">
																<span class="form__checkbox"></span>
																<span id="ShippingIsDifferentThanBillingLabel">Check if your shipping address is different than your billing address.</span>
															</label>
														</div>
													</div>
												</div>
											</div>
										</fieldset>
									</div>

									<div class="form form--frame message shipping" id="shippingInformation">
										<fieldset class="form__fieldset form__expando shipping__required">
											<h2 class="form__title shippingTitle">STEP 6: Enter Your Shipping Information</h2>
											<div class="form__span-item form__frame">
												<div class="form__group">
													<strong class="form__span-item banner">We do not ship to PO Boxes</strong>
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
																<span class="form__error">* </span>Address (PO Boxes not accepted)
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
															<div class="form form--select message__select">
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
								<div class="view form form--frame">
									<div id="additionalInformation" class="view__anchor"></div>
									<div class="form__copy">
										<fieldset class="form__fieldset">
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
							<div class="form__span-item form__offer-details offer-details">
								<% Html.RenderSnippet("OFFERDETAILS"); %>
							</div>
							<div id="calltoAction" class="form__action-text form form--frame">
								<div class="form__frame form__copy">
									<div class="form__action">
										<button type="submit" id="AcceptOfferButton" name="acceptOffer" class="form__submit form_validation_required" data-state="card" data-order-type='{ "PayPalEC" : "Continue with PayPal", "CARD" : "Process Order" }'>
											<span class="button form__button">
												<span>Process Order</span>
											</span>
										</button>
									</div>
									<div id="disclaimerText" class="form__copy">
										<p>By clicking PROCESS ORDER button, you are electronically signing your order, agreeing to the terms and to our general Terms and Conditions, and authorizing us to charge this payment to the credit card you have provided.</p>
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