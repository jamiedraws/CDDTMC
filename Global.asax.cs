using System.Web.Routing;
using System.Web.Mvc;
using Dtm.Framework.ClientSites.Web;
using System.Collections.Generic;
using Dtm.Framework.Models;

namespace CDDTMC
{
    public class MvcApplication : ClientSiteApplication
    {
        protected override void OnAppStart()
        {
            var discountPercentpromoCodes = new Dictionary<string, decimal>()
            {
                { "SAVE15", 0.15M },
                { "SAVE25", 0.25M },
                { "SAVE30", 0.30M }
            };

            foreach (var discountPercentPromoCode in discountPercentpromoCodes)
            {
                DtmContext.PromoCodeRules.Add(new PromoCodeRule(discountPercentPromoCode.Key, PromoCodeRuleType.AddDiscountPercent, discountPercentPromoCode.Key, discountPercentPromoCode.Value, 1));
            }


            base.OnAppStart();
        }
        protected override void ConfigureAdditionalRoutes(RouteCollection routes)
        {
            routes.MapRoute("ReferAFriend", "Refer", new { controller = "ReferAFriend", action = "SendReferral" });

            base.ConfigureAdditionalRoutes(routes);
        }
    }
}