<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

	<header class="l-header @print-only-hide">

		<div class="l-header__in @mv-u-pad--reset">

			<%  if ( Model.IsMobile ) { %>

				<a title="<%= LabelsManager.Labels["MobileHeaderTitle"] %>" href="?dm=d">

					<% Html.RenderSnippet("MOBILE-HEADER"); %>

				</a>

			<% } else { %>

				<div class="flex width-at-100">

					<% Html.RenderSnippet("HEADER-MAIN"); %>

				</div>

			<% } %>

		</div>

	</header>

