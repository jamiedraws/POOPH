using System.Collections.Generic;
using System.Linq;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;

namespace POOPH.PageHandlers
{
    public class OrderSummaryWithEditPageHandler : PageHandler
    {
        #region " Overrides... "

        public override void PostProcessPageActions()
        {
            var threePackQty = Order.ContextOrderItems.
                FirstOrDefault(x => x.CachedProductInfo.ProductCode == "3PACK") != null 
                ? Order.ContextOrderItems.
                FirstOrDefault(x => x.CachedProductInfo.ProductCode == "3PACK").Quantity : 0 ;

            OrderManager.SetProductQuantity("THREEPACKDUPE", threePackQty * 3);
        }
        #endregion
    }
}
