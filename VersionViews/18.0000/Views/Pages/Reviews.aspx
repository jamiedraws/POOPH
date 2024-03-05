<%@ Page Language="C#" MasterPageFile="~/VersionViews/16.0000/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="application/ld+json">
        {
        "@context": "https://schema.org",
        "@type": "Product",
        "@id": "https://www.pooph.com/",
        "name": "Pooph",
        "image": "https://www.pooph.com/shop/500x500.jpg",
        "description": "Pooph&trade; takes &ldquo;stink&rdquo; out of the equation &ndash; completely and permanently dismantling odors on a molecular level. It works instantly to eliminate odors at the source &ndash; so there is no stink OR fragrance... when you use Pooph&trade;, it&rsquo;s as if the odor was never there! Pooph&trade; is safe for people, pets and the planet!",
        "sku": "POOS-32",
        "brand": "Pooph&trade;"
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main aria-labelledby="main-title" class="view content content--sub-page section">
    <div id="main" class="view__anchor"></div>
    <article class="view__in content__in section__in">
        <div class="section__block content__text">
            <h1 id="main-title" class="content__title">Reviews</h1>
            <div 
			    data-bv-show="reviews"
			    data-bv-product-id="POOS-32">
		    </div>
        </div>
    </article>
</main>

</asp:Content>