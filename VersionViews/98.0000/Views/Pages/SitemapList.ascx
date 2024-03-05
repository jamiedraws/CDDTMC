<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="CDDTMC.Navigation" %>
  
<% 
    var isFrontPage = DtmContext.Page.IsStartPageType;
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var ext = DtmContext.ApplicationExtension;

    var renderSitemap = false;
    var renderSitemapValue = ViewData["renderSitemap"] as string ?? "True";
    Boolean.TryParse(renderSitemapValue, out renderSitemap);
                    
    var labelCategory = ViewData["labelCategory"] as string ?? "Footer";
    var labelId = labelCategory.Replace(" ", "-").ToLower();

    var sitemap = new Sitemap();
    var sitemapList = sitemap.SitemapList;
                    
    var listClasses = "list";
    if (!renderSitemap) {
        listClasses = "list list--stack";
    }
%>

<% if (isFrontPage) { %>
<div class="section__block">
    <nav aria-label="<%= String.Format("{0} {1}", labelCategory, "Offer information") %>" class="<%= listClasses %>">
    <%
        
        var entries = sitemapList.GetItemsByIdRange(new List<string> { 
            "home", 
            "ingredients",
            "instructions",
            "faq",
            "customer-service", 
            "shipping-return-policy",
            "privacy-policy", 
            "terms",
            "sitemap",
            "order-now"
          });

        if (!renderSitemap)
        {
            entries = entries.Where(e => e.Id != "sitemap" && e.Id != "order-now").ToList();
        }

        foreach (var entry in entries)
        {
            var attributeList = string.Format(@"id=""{0}-{1}"" href=""{2}""", labelId, entry.Id, entry.Page);

            if (entry.IsExternal)
            {
                attributeList = string.Format(@"{0} target=""_blank""", attributeList);
            }
            %>
            <span>
                   <a <%= attributeList %>><%= entry.Name %></a>
              </span>
              <%
          }
        if (renderSitemap)
        {
        %>
            <!-- for dynamically added one trust link -->
            <span class="onetrust-privacy"></span>
        <%
        }
        %>
      </nav>
</div>
<% } %>

<% if (renderSitemap) { %>
<address class="section__block">
    <%
        var year = DateTime.Now.ToString("yyyy");

        var commonFooter = Html.GetSnippet("COMMON-FOOTER");

        commonFooter = commonFooter.Replace("{{Year}}", year);
   
        Response.Write(commonFooter);

        var facebookLink = sitemapList.GetItemById("facebook");
        var instagramLink = sitemapList.GetItemById("instagram");
        var youtubeLink = sitemapList.GetItemById("youtube");
    %>
</address>
<% } %>