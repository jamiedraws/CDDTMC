<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<!DOCTYPE html>
<%
    var orderId = Request.QueryString["orderId"] as string ?? string.Empty;
    %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Survey | TROJAN Man Care</title>
    <link rel="preload" href="/css/survey.css" as="style">
    <link rel="stylesheet" href="/css/survey.css" />
</head>
<body>
    <iframe src="https://www.mancaresurvey.com/CDDTMCSURV/1.0000/Index.dtm?orderId=<%=orderId%>" title="Survey"></iframe>
</body>
</html>