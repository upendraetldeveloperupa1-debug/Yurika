using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class Checkout : System.Web.UI.Page
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


            if (!IsPostBack)
            {
                LoadUserDetails();
                LoadOrderSummary();
            }
        }


        // LOAD CUSTOMER DETAILS

        private void LoadUserDetails()
        {
            try
            {
                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@UserId",
                        userId)
                };


                DataTable dt =
                    obj.GetOne(
                        "sp_GetUserById",
                        param);


                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];


                    txtShippingName.Text =
                        row["FullName"].ToString();

                    txtShippingMobile.Text =
                        row["Mobile"].ToString();

                    txtShippingAddress.Text =
                        row["Address"].ToString();

                    txtCity.Text =
                        row["City"].ToString();

                    txtState.Text =
                        row["State"].ToString();

                    txtPincode.Text =
                        row["Pincode"].ToString();
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }


        // LOAD CART SUMMARY

        private void LoadOrderSummary()
        {
            try
            {
                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@UserId",
                        userId)
                };


                DataTable dt =
                    obj.GetOne(
                        "sp_GetCart",
                        param);


                if (dt.Rows.Count == 0)
                {
                    Response.Redirect("Cart.aspx");
                    return;
                }


                gvSummary.DataSource = dt;

                gvSummary.DataBind();


                decimal total = 0;


                foreach (DataRow row in dt.Rows)
                {
                    total +=
                        Convert.ToDecimal(
                            row["TotalPrice"]);
                }


                lblTotalAmount.Text =
                    "₹" + total.ToString("N2");
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }


        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate customer

                if (Session["UserId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }


                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                // Validate fields

                if (string.IsNullOrWhiteSpace(
                    txtShippingName.Text))
                {
                    ShowMessage(
                        "Please enter your name.",
                        Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtShippingMobile.Text))
                {
                    ShowMessage(
                        "Please enter your mobile number.",
                        Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtShippingAddress.Text))
                {
                    ShowMessage(
                        "Please enter your address.",
                        Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtCity.Text))
                {
                    ShowMessage(
                        "Please enter your city.",
                        Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtState.Text))
                {
                    ShowMessage(
                        "Please enter your state.",
                        Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtPincode.Text))
                {
                    ShowMessage(
                        "Please enter your pincode.",
                        Color.Red);

                    return;
                }


                // Place Order

                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@UserId",
                        userId),

                    new SqlParameter(
                        "@PaymentMethod",
                        rblPaymentMethod.SelectedValue),

                    new SqlParameter(
                        "@ShippingName",
                        txtShippingName.Text.Trim()),

                    new SqlParameter(
                        "@ShippingMobile",
                        txtShippingMobile.Text.Trim()),

                    new SqlParameter(
                        "@ShippingAddress",
                        txtShippingAddress.Text.Trim()),

                    new SqlParameter(
                        "@ShippingCity",
                        txtCity.Text.Trim()),

                    new SqlParameter(
                        "@ShippingState",
                        txtState.Text.Trim()),

                    new SqlParameter(
                        "@ShippingPincode",
                        txtPincode.Text.Trim())
                };


                DataTable dt =
                    obj.GetOne(
                        "sp_PlaceOrder",
                        param);


                if (dt.Rows.Count > 0)
                {
                    int orderId =
                        Convert.ToInt32(
                            dt.Rows[0]["OrderId"]);


                    Response.Redirect(
                        "OrderConfirmation.aspx?OrderId="
                        + orderId);
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }
        private void ShowMessage(
            string message,
            Color color)
        {
            lblMessage.Text =
                message;

            lblMessage.ForeColor =
                color;
        }
    }
}