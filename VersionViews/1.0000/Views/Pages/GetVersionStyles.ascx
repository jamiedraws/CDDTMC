<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>

<%
    var isStartPage = DtmContext.Page.IsStartPageType;
    var v = "?v=3";    
%>

<link rel="stylesheet" href="https://use.typekit.net/qod4wmr.css">
<link rel="stylesheet" href="/css/site1/app.css<%= v %>" />

<% if (!isStartPage) { %>
    <link rel="stylesheet" href="/css/site1/form.css<%= v %>" />
<% } %>

<% if (isStartPage) { %>
    <link rel="stylesheet" href="/css/site1/page.css<%= v %>" />
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

<script defer src="/js/site1/app.es5.js"></script>