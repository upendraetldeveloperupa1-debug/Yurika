using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class OrderManagement : System.Web.UI.Page
    {
        Class1 obj = new Class1();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (Session["UserRole"] == null ||
                Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Default.aspx");
                return;
            }


            if (!IsPostBack)
            {
                BindOrders();
            }
        }


        // =========================
        // GET ORDERS
        // =========================

        private void BindOrders()
        {
            try
            {
                DataTable dt =
                    obj.Get("sp_GetOrders");

                gvOrder.DataSource = dt;
                gvOrder.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading orders: " + ex.Message,System.Drawing.Color.Red);
            }
        }


        protected void gvOrder_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                int orderId =
                    Convert.ToInt32(e.CommandArgument);


                // UPDATE STATUS

                if (e.CommandName == "UpdateStatus")
                {
                    GridViewRow row =
                        (GridViewRow)
                        ((Control)e.CommandSource).NamingContainer;


                    DropDownList ddlStatus =
                        (DropDownList)
                        row.FindControl("ddlStatus");


                    if (ddlStatus == null)
                    {
                        ShowMessage("Status control not found.",System.Drawing.Color.Red);
                        return;
                    }


                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@OrderId",
                            orderId),

                        new SqlParameter(
                            "@OrderStatus",
                            ddlStatus.SelectedValue)
                    };


                    obj.ExecuteNonQuery(
                        "sp_UpdateOrderStatus",
                        param);


                   ShowMessage( "Order status updated successfully.",System.Drawing.Color.Green);


                    BindOrders();
                }


                // VIEW ORDER

                else if (e.CommandName == "ViewOrder")
                {
                    Response.Redirect(
                        "OrderDetails.aspx?OrderId="
                        + orderId);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message,System.Drawing.Color.Red);
            }
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            string search =
                           txtSearch.Text.Trim();


            if (string.IsNullOrEmpty(search))
            {
                BindOrders();
                return;
            }


            DataTable dt =
                obj.Get("sp_GetOrders");


            DataView dv =
                dt.DefaultView;


            dv.RowFilter =
                "Convert(OrderId, 'System.String') LIKE '%"
                + search.Replace("'", "''")
                + "%'";


            gvOrder.DataSource = dv;
            gvOrder.DataBind();
        }
        private void ShowMessage(
            string message,
            System.Drawing.Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }
    }
}