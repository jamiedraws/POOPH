<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="POOPH.Navigation" %>
  
<% 
    var isFrontPage = DtmContext.Page.IsStartPageType;
    var productName = SettingsManager.ContextSettings["Label.ProductName"];
    var ext = DtmContext.ApplicationExtension;

    var year = DateTime.Now.ToString("yyyy");

    var renderSitemap = false;
    var renderSitemapValue = ViewData["renderSitemap"] as string ?? "True";
    Boolean.TryParse(renderSitemapValue, out renderSitemap);
                    
    var labelCategory = ViewData["labelCategory"] as string ?? "Footer";
    var labelId = labelCategory.Replace(" ", "-").ToLower();
                    
    var listClasses = "list";
    if (!renderSitemap) {
        listClasses = "list list--stack";
    }
%>

<% if (isFrontPage) { %>
<div class="section__block">
    <nav aria-label="<%= String.Format("{0} {1}", labelCategory, "Offer information") %>" class="<%= listClasses %>">
    <%
        var sitemap = new Sitemap();
        var entries = sitemap.SitemapList.GetItemsByIdRange(new List<string> { 
            "home", 
            "customer-service",
            "faq",
            "shipping-policy",
            "return-policy",
            "privacy-policy", 
            "security-policy", 
            "sitemap",
            "order-now"
          });

        if (!renderSitemap)
        {
            entries = entries.Where(e => e.Id != "sitemap" && e.Id != "order-now").ToList();
        }

        foreach (var entry in entries)
        {
            %>
            <span>
                   <a id="<%= labelId %>-<%= entry.Id %>" href="<%= entry.Page %>"><%= entry.Name %></a>
              </span>
              <%
          }
    %>
      </nav>
</div>
<% } %>

<% if (renderSitemap) { %>
<address class="section__block">
    <p>&copy;<%= year %> <%= productName %> All Rights Reserved.</p>
    <%
        

        var commonFooter = Html.GetSnippet("COMMON-FOOTER");

        commonFooter = commonFooter.Replace("{{Year}}", year);
   
        Response.Write(commonFooter);    
    %>
</address>
<% } %>