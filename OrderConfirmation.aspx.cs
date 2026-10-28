using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class OrderConfirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["OrderId"] == null)
                {
                    Response.Redirect("Default.aspx");
                    return;
                }

                lblOrderId.Text =
                    Request.QueryString["OrderId"];
            }
        }
    }
}