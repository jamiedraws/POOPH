<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>
<%@ Import Namespace="POOPH.Navigation" %>

<%
    var pageControlKey = "BazaarVoiceTracking";
    var completeStatuses = new[] { 3 };
    var hasFiredSale = DtmContext.FiredConversionCodes.Any(p => p.Equals(pageControlKey, StringComparison.InvariantCultureIgnoreCase));
    var firePixelSale = DtmContext.Order != null && !DtmContext.Order.IsPotentiallyFraudulent && !hasFiredSale
      && (completeStatuses.Contains(DtmContext.Order.OrderStatusId))
      && !DtmContext.Page.IsStartPageType;

    if (firePixelSale)
    {
        DtmContext.FiredConversionCodes.Add(pageControlKey);
    }


%>


<%if (firePixelSale && !hasFiredSale)
    {
        var orderTotal = DtmContext.Order.OrderItems.Sum(oi => oi.Price * oi.Quantity);
        var shipping = DtmContext.Order.OrderItems.Sum(oi => oi.Shipping * oi.Quantity);
        decimal taxableAmount = DtmContext.Order.OrderItems.Where(i => i.IsTaxable).Sum(i => i.Quantity * i.Price);

        if (DtmContext.Order.TaxShipping)
        {
            taxableAmount += shipping;
        }
        taxableAmount += DtmContext.Order.OrderItems.Where(i => i.TaxExtendedPrice).Sum(i => i.Quantity * (i.ExtendedPrice ?? 0));
        var fees = DtmContext.Order.OrderItems
                .Where(oi => oi.TaxAmount.HasValue)
                .Sum(oi => Math.Round(oi.TaxAmount.Value, 2, MidpointRounding.AwayFromZero));
        var tax = Math.Round(DtmContext.Order.TaxRate * taxableAmount, 2, MidpointRounding.AwayFromZero);
        %>
<script async type="text/javascript"
    src="https://apps.bazaarvoice.com/deployments/pooph/main_site/production/en_US/bv.js"></script>

<!--load transaction event and parameters-->
<script type="text/javascript">
    let bvFired = false;
    if (!bvFired) {
        window.bvCallback = function (BV) {
            BV.pixel.trackTransaction({
                "currency": "USD",
                "orderId": "<%=DtmContext.OrderId%>",
                "total": "<%=orderTotal.ToString("0.00")%>",
                "tax": "<%=tax.ToString("0.00")%>",
                "shipping": "<%=shipping.ToString("0.00")%>",
                "items": [
   <%foreach (var item in DtmContext.Order.OrderItems)
    {
        var itemCount = DtmContext.Order.OrderItems.Count;
        %>
                    //For each item
                    {
                        "name": "<%=item.Description%>",
                        "price": "<%=item.Price.ToString("0.00")%>",
                        "quantity": "<%=item.Quantity%>",
                        "productId": "POOS-32",
                        "imageURL": "https://www.trypooph.com/shop/500x500-1.jpg",
                    }<%if (itemCount > 1 && item != DtmContext.Order.OrderItems.Last())
    { %>,<%}%>
                    <%}%>
                ],
                "email": "<%=DtmContext.Order.Email%>",
                "locale": "en_US"
            });

            fired = true;
        };
    }
</script>
<%} %>