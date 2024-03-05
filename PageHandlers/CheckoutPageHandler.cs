using Dtm.Framework.ClientSites.Web;
using System.Web.Mvc;

namespace CDDTMC.PageHandlers
{
    public class CheckoutPageHandler : PageHandler
    {
        #region " Overrides... "
        public override void PostSetOrderStatus()
        {
            if (DtmContext.Version >= 4)
            {
                Order.OrderStatusId = 1;
            }
        }



        #endregion
    }
}
