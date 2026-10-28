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
    public partial class Cart : System.Web.UI.Page
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
                LoadCart();
            }
        }


        // LOAD CART

        private void LoadCart()
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
                    pnlCart.Visible = false;
                    pnlEmpty.Visible = true;

                    return;
                }


                pnlCart.Visible = true;
                pnlEmpty.Visible = false;


                gvCart.DataSource = dt;
                gvCart.DataBind();


                decimal grandTotal = 0;


                foreach (DataRow row in dt.Rows)
                {
                    grandTotal +=
                        Convert.ToDecimal(
                            row["TotalPrice"]);
                }


                lblGrandTotal.Text =
                    "₹" + grandTotal.ToString("N2");
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    ex.Message;

                lblMessage.ForeColor =
                    Color.Red;
            }
        }


        // UPDATE / REMOVE


        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect( "Checkout.aspx");
        }

        protected string GetImageUrl(object image)
        {
            if (image == null ||
                image == DBNull.Value ||
                string.IsNullOrWhiteSpace(
                    image.ToString()))
            {
                return ResolveUrl(
                    "~/Images/no-image.png");
            }


            string imageUrl =
                image.ToString().Trim();


            if (imageUrl.StartsWith("~/"))
            {
                return ResolveUrl(imageUrl);
            }


            if (imageUrl.StartsWith("/"))
            {
                return imageUrl;
            }


            return ResolveUrl(
                "~/" + imageUrl);
        }
        private void ShowMessage(
           string message,
           Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int cartId =
                    Convert.ToInt32(
                        e.CommandArgument);


                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                if (e.CommandName ==
                    "UpdateCart")
                {
                    GridViewRow row =
                        (GridViewRow)
                        ((Control)e.CommandSource)
                        .NamingContainer;


                    TextBox txtQuantity =
                        (TextBox)
                        row.FindControl(
                            "txtQuantity");


                    int quantity;


                    if (!int.TryParse(
                        txtQuantity.Text,
                        out quantity))
                    {
                        ShowMessage(
                            "Invalid quantity.",
                            Color.Red);

                        return;
                    }


                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@CartId",
                            cartId),

                        new SqlParameter(
                            "@UserId",
                            userId),

                        new SqlParameter(
                            "@Quantity",
                            quantity)
                    };


                    obj.ExecuteNonQuery(
                        "sp_UpdateCart",
                        param);


                    ShowMessage(
                        "Cart updated successfully.",
                        Color.Green);
                }


                if (e.CommandName ==
                    "RemoveCart")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@CartId",
                            cartId),

                        new SqlParameter(
                            "@UserId",
                            userId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_RemoveFromCart",
                        param);


                    ShowMessage(
                        "Product removed from cart.",
                        Color.Green);
                }


                LoadCart();
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }
    }
}