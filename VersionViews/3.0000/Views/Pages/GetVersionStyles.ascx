<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
    List<string> includePageCodes = new List<string> { "Waitlist" };
    var isStartPage = DtmContext.Page.IsStartPageType || includePageCodes.Contains(DtmContext.PageCode);
    var v = "?v=5";    
%>

<link rel="stylesheet" href="https://use.typekit.net/qod4wmr.css">
<link rel="stylesheet" href="/css/site3/app.css<%= v %>" />

<% if (!isStartPage) { %>
    <link rel="stylesheet" href="/css/site3/form.css<%= v %>" />
<% } %>

<% if (isStartPage) { %>
    <link rel="stylesheet" href="/css/site3/page.css<%= v %>" />
<% } %>

<style>
/* modal overrides */
.dtm .c-modal__title {
    color: black;
}

.dtm .c-modal * {
    text-transform: capitalize;
}

.dtm .c-modal__group[role="textbox"] .c-modal__list--textarea .c-modal__textarea {
    color: black;
}
</style>

<script defer src="/js/site3/app.es5.js"></script>