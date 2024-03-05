<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<footer aria-label="Copyright and Policies" class="view footer section @print-only-hide">
    <div id="footer" class="view__anchor"></div>
    <div class="view__in section__in">
        <% 
            Html.RenderPartial("SitemapList");
	%>
    </div>
</footer>

<% 
    if (DtmContext.Page.IsStartPageType)
    {
        Html.RenderPartial("Scripts");
        Html.RenderSnippet("ORDERFORMSCRIPT");
    }
    if (string.Equals(DtmContext.PageCode, "CONFIRMATION", StringComparison.InvariantCultureIgnoreCase))
    {
        Html.RenderPartial("BazaarVoiceTrackingPixel",Model);
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
