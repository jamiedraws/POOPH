using Dtm.Framework.ClientSites.Web;
using Dtm.Framework.Models;

namespace POOPH
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart() 
        {
            DtmContext.PromoCodeRules.Add(new PromoCodeRule("SALE", PromoCodeRuleType.AddDiscountValue, "SALE", -3M, 1));

            base.OnAppStart();
        }
    }
}