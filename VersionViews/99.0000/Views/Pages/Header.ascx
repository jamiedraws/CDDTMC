<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

	<header class="l-header @print-only-hide">

		<% if (DtmContext.Page.IsStartPageType) { %>
		<div class="banner">
			<div class="l-header__in banner__group">
				<span class="tag">Special Offer</span>
				<span>Free Toiletry Bag + Free Shipping With Purchase</span>
			</div>
		</div>
		<% } %>
		<div class="l-header__in l-header__main">
			<a href="Index<%= Model.Extension %>">
				<img src="/images/logo.png" width="530" height="108" alt="Trojan Man Care&trade;">
			</a>
		</div>

	</header>

