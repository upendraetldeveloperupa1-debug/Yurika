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
    public partial class Wishlist : System.Web.UI.Page
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
                LoadWishlist();
            }
        }


        // LOAD WISHLIST

        private void LoadWishlist()
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
                        "sp_GetWishlist",
                        param);


                if (dt.Rows.Count == 0)
                {
                    pnlWishlist.Visible = false;
                    pnlEmpty.Visible = true;

                    return;
                }


                pnlWishlist.Visible = true;
                pnlEmpty.Visible = false;


                rptWishlist.DataSource = dt;

                rptWishlist.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }

        protected void rptWishlist_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                int id =
                    Convert.ToInt32(
                        e.CommandArgument);


                // REMOVE WISHLIST

                if (e.CommandName ==
                    "RemoveWishlist")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@WishlistId",
                            id),

                        new SqlParameter(
                            "@UserId",
                            userId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_RemoveFromWishlist",
                        param);


                    ShowMessage(
                        "Product removed from wishlist.",
                        Color.Green);


                    LoadWishlist();
                }


                // ADD TO CART

                if (e.CommandName ==
                    "AddCart")
                {
                    int productId = id;


                    AddProductToCart(
                        userId,
                        productId);
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }


        // ADD WISHLIST PRODUCT TO CART

        private void AddProductToCart(
            int userId,
            int productId)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@UserId",
                    userId),

                new SqlParameter(
                    "@ProductId",
                    productId),

                new SqlParameter(
                    "@Quantity",
                    1)
            };


            obj.ExecuteNonQuery(
                "sp_AddToCart",
                param);


            ShowMessage(
                "✓ Product added to cart.",
                Color.Green);
        }


        // IMAGE

        protected string GetImageUrl(
            object image)
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


        // MESSAGE

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
