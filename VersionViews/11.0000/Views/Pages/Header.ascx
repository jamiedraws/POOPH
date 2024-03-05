<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="POOPH.Navigation" %>
	
<%
	var isStartPage = DtmContext.Page.IsStartPageType;
	var isIndex = DtmContext.PageCode == "Index";

	var productAttributeName = SettingsManager.ContextSettings["Label.ProductName"];
	var productName = productAttributeName;

	var sitemap = new Sitemap();
	var sitemapList = sitemap.SitemapList;
	var homeLink = sitemapList.GetItemById("home");

	var skipLink = "#main";

	if (DtmContext.Page.PageType.Equals("upsell", StringComparison.InvariantCultureIgnoreCase))
	{
		skipLink = "#upsellTxt";
	} else if (!isStartPage)
	{
		skipLink = "#content_top";
	}

	var logoLink = isStartPage ? homeLink.Page : skipLink;

	var logoTemplate = @"<a href=""{0}"" aria-label=""{1}"" class=""logo-text__group"">
		<img class=""logo-text__logo"" src=""/images/Site6/logo.svg"" alt=""{1}"" width=""154"" height=""150"">
	</a>";
	var logo = string.Format(logoTemplate, logoLink, productName);
%>
	
<header aria-labelledby="header-title" class="view header section @print-only-hide">
	<span class="skip-link">
		<a href="<%= skipLink %>" class="skip-link__button" id="skip-link">
			<span>Skip To Main Content?</span>
		</a>
	</span>

	<% if (isIndex) { %>
	<nav class="fp-nav" aria-label="Quick shortcut to order online or watch the product video">
		<a href="#order" class="fp-nav__a fp-nav__a--order">
			<span>Order <br />Now</span>
		</a>
		<a href="#video" class="fp-nav__a">
			<span>Watch The Show</span>
		</a>
	</nav>
	<% } %>

	<div class="view__in header__in section__in">
		<div class="header__group">
			<div class="header__logo">
				<div class="logo-text">
					<%= logo %>
				</div>
			</div>
			<div id="header-title" class="header__title">The Pet Odor Remover That Takes STINK Out of the Equation</div>
		</div>
	</div>
</header>