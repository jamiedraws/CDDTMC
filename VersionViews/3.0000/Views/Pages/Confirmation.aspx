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

<main aria-label="Confirmation" class="view form main-offer main-offer--present-header-first section">
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
					<div class="form__item form__watchlist">
						<div class="form form--frame">
							<div class="form__frame">
								<h2 class="form__watchlist-title">THANK YOU!</h2>
								<p>Thank you for your interest in Trojan Man Care. You will be notified as soon as we are in stock PLUS receive an exclusive promotional discount for being first in line.</p>
								<p>&ndash; The Trojan Team</p>
							</div>
						</div>
					</div>
					<div class="form__span-item">
						<div class="form__group form__group-section">
							<div id="calltoAction" class="form__action-text form form--frame">
								<div class="form__frame form__copy">
									<div class="form__action">
										<button type="submit" name="createOrder" class="form__submit">
											<span class="button">
												<span>Done</span>
											</span>
										</button>
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