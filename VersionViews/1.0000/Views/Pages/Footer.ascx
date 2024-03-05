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
	Html.RenderPartial("Scripts");
	if ( DtmContext.Page.IsStartPageType ) 
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
                let emailOptIn = document.getElementById("EmailOptIn");
                document.getElementById("EmailOptInCbx").addEventListener("click", function () {
                    if (this.checked) {
                        emailOptIn.value = "True";
                    } else {
                        emailOptIn.value = "False";
                    }
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