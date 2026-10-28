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
    public partial class OrderDetails : System.Web.UI.Page
    {
        Class1 obj = new Class1();


        protected void Page_Load(
            object sender,
            EventArgs e)
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
                LoadOrder();
                LoadOrderDetails();
            }
        }

        private void LoadOrder()
        {
            if (!int.TryParse(
                Request.QueryString["OrderId"],
                out int orderId))
            {
                Response.Redirect(
                    "OrderManagement.aspx");
                return;
            }


            SqlParameter[] param =
            {
                new SqlParameter(
                    "@OrderId",
                    orderId)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_GetOrderById",
                    param);


            if (dt.Rows.Count == 0)
            {
                Response.Redirect(
                    "OrderManagement.aspx");
                return;
            }


            DataRow row = dt.Rows[0];


            lblOrderId.Text =
                "Order #" + orderId;

            lblName.Text =
                row["FullName"].ToString();

            lblEmail.Text =
                row["Email"].ToString();

            lblDate.Text =
                Convert.ToDateTime(
                    row["OrderDate"])
                    .ToString("dd-MM-yyyy HH:mm");

            lblShippingName.Text =
                row["ShippingName"].ToString();

            lblMobile.Text =
                row["ShippingMobile"].ToString();

            lblAddress.Text =
                row["ShippingAddress"].ToString();

            lblLocation.Text =
                row["ShippingCity"].ToString()
                + ", "
                + row["ShippingState"].ToString()
                + " - "
                + row["ShippingPincode"].ToString();

            lblTotal.Text =
                Convert.ToDecimal(
                    row["TotalAmount"])
                    .ToString("N2");
        }


        // =========================
        // ORDER DETAILS
        // =========================

        private void LoadOrderDetails()
        {
            if (!int.TryParse(
                Request.QueryString["OrderId"],
                out int orderId))
            {
                return;
            }


            SqlParameter[] param =
            {
                new SqlParameter(
                    "@OrderId",
                    orderId)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_GetOrderDetails",
                    param);


            gvOrderDetails.DataSource = dt;
            gvOrderDetails.DataBind();
        }

    }
}