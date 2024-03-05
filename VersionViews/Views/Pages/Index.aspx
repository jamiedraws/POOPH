<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<OrderPageViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" href="/css/Site/app.css" />
	<script defer src="/js/Site/app.es5.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<% if ( Model.IsMobile ) { %>
 	<% Html.RenderSnippet("INDEX-MOBILE"); %>
	<% Html.RenderSnippet("INDEX-DESKTOP"); %>

<% } else { %>
	<% Html.RenderSnippet("INDEX-DESKTOP"); %>

<% } %>

<svg class="svg-symbols">
	<symbol id="icon-chevron" x="0px" y="0px" viewBox="0 0 25.228 14.029">
		<g transform="translate(1.414 1.414)">
	  		<path d="M0,11.2,11.2,0m0,22.4L0,11.2" transform="translate(0 11.2) rotate(-90)" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"/>
		</g>
  	</symbol>
</svg>

</asp:Content>


