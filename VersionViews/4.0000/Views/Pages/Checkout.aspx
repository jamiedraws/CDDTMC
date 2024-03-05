<%@ Page Language="C#" MasterPageFile="~/VersionViews/1.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
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

					<section aria-label="Offer is only available online, complete order form to finish purchase" class="view form-title section">
						<div class="view__in section__in">
							<span class="form-title__not-available">THIS OFFER IS NOT AVAILABLE IN STORES!</span>
						</div>
					</section>
					
					<div class="view form__span-item">
						<div id="vse-errors" class="view__anchor"></div>
						<div role="alert" class="vse" data-vse-scroll>
							<%= Html.ValidationSummary("The following errors have occurred:") %>
						</div>
					</div>
					<input type="hidden" name="OrderType" id="OrderType" value="None"/>
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
								<div class="form__field-label form__field-label-button" data-validate-form="promocode">
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
											Promo code SAVE15 has been applied.
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

					<div class="form__span-item form__continue">
						<button type="submit" class="button">
							<span>Continue</span>
						</button>
					</div>

					<div class="form__span-item form__offer-details offer-details">
						<% Html.RenderSnippet("OFFERDETAILS"); %>
					</div>
					
				</div>
			</div>
		</div>
	</form>
</main>
		
</asp:Content>