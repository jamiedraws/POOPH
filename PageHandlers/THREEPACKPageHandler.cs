using System.Collections.Generic;
using System.Linq;
using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;

namespace POOPH.PageHandlers
{
    public class THREEPACKPageHandler : PageHandler
    {
        #region " Overrides... "

        public override void PostProcessPageActions()
        {
            OrderManager.UpgradeProduct("MAINB", "3PACK");
            OrderManager.SetProductQuantity("THREEPACKDUPE", Order.Items["3PACK"].Quantity * 3);
        }
        #endregion
    }
}
