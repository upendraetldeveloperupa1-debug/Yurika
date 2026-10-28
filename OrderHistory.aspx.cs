using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        Class1 obj = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadOrders();
            }
        }


        private void LoadOrders()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserId"]);

                SqlParameter[] param =
                {
                    new SqlParameter("@UserId", userId)
                };

                DataTable dt =
                    obj.GetOne("sp_GetUserOrderHistory", param);

                if (dt.Rows.Count > 0)
                {
                    rptOrders.DataSource = dt;
                    rptOrders.DataBind();

                    pnlNoOrders.Visible = false;
                }
                else
                {
                    rptOrders.DataSource = null;
                    rptOrders.DataBind();

                    pnlNoOrders.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
        }


        protected void rptOrders_ItemCommand(
            object source,
            System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                int orderId =
                    Convert.ToInt32(e.CommandArgument);

                Response.Redirect(
                    "OrderDetails.aspx?OrderId=" + orderId);
            }
        }


        public string GetStatusClass(object status)
        {
            if (status == null)
                return "pending";

            string value =
                status.ToString().ToLower();

            switch (value)
            {
                case "confirmed":
                    return "confirmed";

                case "shipped":
                    return "shipped";

                case "delivered":
                    return "delivered";

                case "cancelled":
                    return "cancelled";

                default:
                    return "pending";
            }
        }
    }
}