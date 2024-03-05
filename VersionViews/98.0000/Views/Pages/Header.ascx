<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDTMC.Navigation" %>

<%
	var isIndex = DtmContext.PageCode == "Index";
	var isCheckout = DtmContext.PageCode == "Checkout";
	var isUpsell = DtmContext.Page.PageType.Equals("upsell", StringComparison.InvariantCultureIgnoreCase);
	var isStartPage = DtmContext.Page.IsStartPageType;

	var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
	var productName = productAttributeName;

	var sitemap = new Sitemap();
	var sitemapList = sitemap.SitemapList;
	var homeLink = sitemapList.GetItemById("home");

	var logoLink = isStartPage ? homeLink.Page : "#main";
	var logoTemplate = @"
	<a href=""{0}"" class=""logo-text__group"" aria-label=""{1}"">
		<svg class=""logo-text__logo""><use href=""#logo"" /></svg>
	</a>";
	var logo = string.Format(logoTemplate, logoLink, productName);

	var skipLink = "#main";

	if (isUpsell)
	{
		skipLink = "#upsellTxt";
	} else if (!isStartPage)
	{
		skipLink = "#content_top";
	}

	var orderLink = sitemapList.GetItemById("order-now");
%>

<svg class="svg-symbols">
	<symbol id="logo" x="0px" y="0px" viewBox="0 0 54.2 69.1">
		<style type="text/css">
		#logo path {
			fill: currentColor;
		}
		</style>
		<path id="XMLID_00000108998375155322450420000002417827461112792254_" class="st0" d="M14.9,14.3c-2.5,0.8-4.9,2.1-7.1,3.8
			L0.3,5.4c0,0,3.6-2.9,9.6-4.2C10,1.2,14.9,14.3,14.9,14.3z M24.1,0.1c-4.1-0.2-7.3,0-10.9,0.6l3.4,13.1c2.2-0.5,4.4-0.8,6.9-0.7
			L24.1,0.1z M36.7,3.5c-3-1.5-6.3-2.5-9.5-3l-1.9,12.9c2.2,0.2,4.2,0.8,6.2,1.6L36.7,3.5z M46.1,11c-2-2.5-4.3-4.5-6.8-6.1
			L33,15.6c1.8,0.9,3.4,1.9,4.9,3.2L46.1,11z M51,20.3c-0.8-2.6-2-5-3.3-7.1L39,19.9c1.3,1.3,2.5,2.8,3.5,4.5L51,20.3z M52.7,29.8
			c-0.1-2.6-0.5-4.9-1-7.1l-8.5,3c0.8,1.6,1.4,3.3,1.8,5.1L52.7,29.8z M45.5,36.9l6.9,0.3c0.2-1.7,0.3-3.5,0.3-5.4c0,0,0,0,0,0
			l-7.4,0.3C45.5,33.3,45.6,35.4,45.5,36.9z M51.3,43.9c0.4-1.6,0.7-3.2,0.9-4.9l-6.7-0.7c-0.1,1.6-0.3,3.1-0.5,4.4L51.3,43.9z
				M49.7,49.7c0.4-1.4,0.8-2.7,1.1-4.2l-6.1-1.4c-0.3,1.5-0.7,2.9-1,4.2L49.7,49.7z M48.6,54.5c0.2-1,0.4-2,0.7-3.1l-6-1.4
			c-0.3,1.2-0.6,2.5-0.8,3.8L48.6,54.5z M48.2,58.5c0-0.8,0-1.7,0.1-2.7l-6-0.5c-0.1,1.3,0,2.6,0.2,3.9L48.2,58.5z M48.9,62.1
			c-0.2-0.7-0.4-1.4-0.5-2.1l-5.4,0.9c0.3,1.3,0.8,2.5,1.4,3.6L48.9,62.1z M40.3,54.6c0.7-6.2,3.1-10.2,3.1-18.8
			c0-11.4-9.3-19.8-20.6-19.8c-6.3,0-11.3,2.6-15,6.4c1,1.8,3,3.3,4.9,4.2c3.1,1.4,5.7,2.3,7.6,3.1c3.2,1.3,4.3,2.3,4.8,3.4
			c0.2,0.5-0.1,0.7-0.6,0.3c-1.2-0.8-5.4-2.3-8.7-3.4c-5.8-2-8.5-3.8-10.1-6.8c-0.2-0.4-0.6-0.4-0.7,0C3.6,26.6,2,31.9,1.4,36
			c-0.2,1,0,1.2,0.7,1.5c0.8,0.3,1.9,0.6,3.2,1c-0.5,1.4-3.4,9.8-3.7,10.7c-0.3,1-0.1,1.6,0.8,1.8c0.9,0.2,1.5,0.4,2,0.4
			c0.6,0.1,0.8,0.5,0.7,1.1c-0.1,0.6-0.3,1.1-0.4,1.7c-0.2,0.6,0.2,0.9,0.5,2.6c0.1,0.7-0.7,2.3-0.6,3.7c0.1,1.9,1.6,2.6,5.6,2.6
			c2.5,0,5.5-0.6,6.7-1.1c0,0,0,5.7,0,6.1c0,0.6,0.3,0.8,0.8,0.9c1.1,0.1,2.9,0.1,4.1,0c0.6-0.1,0.8-0.4,0.8-1.1
			c0-0.7,0-9.7,0-10.2c0-0.5-0.1-1-0.7-0.7c-0.6,0.3-3.5,1.9-6.1,2.5c-2.8,0.8-4.7,0.4-5.1,0c-0.3-0.3-0.4-0.6-0.4-1.2
			c0-0.6,0-5.8,0-6.8c0-1.5,0.2-2.5,1.3-3.7c0.8-1,1.6-1.6,1.6-2.8c0-1.2-0.8-1.7-1.6-2.5c-0.7-0.7-3.3-2.6-4.4-3.5
			c3.7,0.9,8.3,1.8,11.6,2.3c0,0-2.2,11.5-2.3,12.1c-0.1,0.4,0.1,0.6,0.4,0.6c3.8,0.8,7.5-0.2,9.6-3.8c0.9,7,6.7,10.6,14,11.9
			c0.6,0.1,0.7,0,0.5-0.5C40.4,59.7,40,57.2,40.3,54.6z"/>
	</symbol>
</svg>

<div data-nav-controller></div>
<div class="view view--header-nav">
	<header aria-labelledby="header-title" class="view header section @print-only-hide">
		<span class="skip-link">
			<a href="<%= skipLink %>" class="skip-link__button" id="skip-link">
				<span>Skip To Main Content?</span>
			</a>
		</span>

		<% if (isIndex) { %>
		<nav class="fp-nav" aria-label="Quick shortcut to order online or watch the product video">
			<a href="<%= orderLink.Page %>" class="fp-nav__a fp-nav__a--order">
				<span>Buy <br />Now</span>
			</a>
			<a href="#video" class="fp-nav__a">
				<span>Video</span>
			</a>
		</nav>
		<% } %>
	
		<% if (isStartPage) { %>
		<div class="view__in header__in section__in">
			<div class="header__group">
				<div class="header__callout">
					<div class="text-arrow">Special Offer</div>
				</div>
				<div id="header-title" class="header__title">SAVE 15% On Your Order Today with PROMO CODE: SAVE15</div>
				<div class="header__action">
					<%
						var orderLinkAttributeList = string.Empty;
	
						if (isCheckout)
						{
							orderLinkAttributeList = @"data-button-icon-position=""down""";
						}
					%>
					<a href="<%= orderLink.Page %>" class="button button--arrow">
						<span>Buy Now</span>
						<svg class="icon button__icon" <%= orderLinkAttributeList %>>
							<use href="#icon-chevron"></use>
						</svg>
					</a>
				</div>
			</div>
		</div>
		<% } %>
	</header>

	<%
		var navClassList = 	"view nav section @print-only-hide";

		if (!isStartPage)
		{
			navClassList = String.Format("{0} nav--is-end-page", navClassList);
		}
	%>
	<nav id="nav" aria-label="Website pages links" class="<%= navClassList %>">
		<div class="view__in nav__group nav__in section__in">
			<div class="nav__logo">
				<div class="logo-logo-text logo-text--stack">
					<%= logo %>
				</div>
			</div>
			<% if (isStartPage) { %>
			<button type="button" class="nav__label" aria-label="Toggle Menu">
				<span></span>
			</button>
			<div class="nav__underlay nav__underlay--for-drawer" role="presentation"></div>
			<div class="nav__pane">
				<div class="nav__group">
					<div class="nav__list nav__tier-first">
						<div class="nav__logo">
							<div class="logo-text logo-text--stack">
								<%= logo.Replace("navbar-logo", "navbar-header-logo") %>
							</div>
						</div>
						<%
							var navLinks = sitemapList.GetItemsByIdRange(new List<string> { 
								"home", 
								"faq", 
								"products",
								"customer-reviews",
								"order-now"
							});

							foreach (var navLink in navLinks)
							{
								%>
								<a class="nav__link" href="<%= navLink.Page %>" id="nav-<%= navLink.Id %>">
									<span><%= navLink.Name %></span>
								</a>
								<%
							}
						%>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</nav>
</div>


