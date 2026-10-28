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
    public partial class ProductDetails : System.Web.UI.Page
    {
        Class1 obj = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProductDetails();
            }
        }


        // LOAD PRODUCT
        private void LoadProductDetails()
        {
            try
            {
                int productId;

                if (!int.TryParse(
                    Request.QueryString["ProductId"],
                    out productId))
                {
                    Response.Redirect("ProductListing.aspx");
                    return;
                }


                SqlParameter[] param =
                {
                    new SqlParameter("@ProductId", productId)
                };


                DataTable dt =
                    obj.GetOne(
                        "sp_ProductDetails",
                        param);


                if (dt.Rows.Count == 0)
                {
                    Response.Redirect("ProductListing.aspx");
                    return;
                }


                DataRow row = dt.Rows[0];


                // PRODUCT INFORMATION

                lblProductName.Text =
                    row["ProductName"].ToString();

                lblBrand.Text =
                    row["BrandName"].ToString();

                lblCategory.Text =
                    row["CategoryName"].ToString();

                lblDescription.Text =
                    row["Description"].ToString();

                lblPrice.Text =
                    Convert.ToDecimal(
                        row["Price"])
                    .ToString("N2");


                // STOCK

                int stock =
                    Convert.ToInt32(row["Stock"]);


                if (stock > 0)
                {
                    lblStock.Text =
                        "✓ In Stock (" +
                        stock +
                        " available)";

                    lblStock.ForeColor =
                        Color.Green;

                    btnAddToCart.Enabled = true;
                }
                else
                {
                    lblStock.Text =
                        "✕ Out of Stock";

                    lblStock.ForeColor =
                        Color.Red;

                    btnAddToCart.Enabled = false;
                }


                // MAIN IMAGE

                imgProduct.ImageUrl = GetImageUrl(row["ProductImage"]);


                // LOAD ALL IMAGES

                LoadProductImages(productId);
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error: " + ex.Message;

                lblMessage.ForeColor =
                    Color.Red;
            }
        }


        // LOAD PRODUCT IMAGES
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
        private void LoadProductImages(int productId)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@ProductId",
                    productId)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_GetProductImages",
                    param);


            rptImages.DataSource = dt;

            rptImages.DataBind();
        }



        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

            try
            {
                // Check login
                if (Session["UserId"] == null)
                {
                    Response.Redirect("Login.aspx");
                    return;
                }


                // Get UserId
                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                // Get ProductId
                int productId;

                if (!int.TryParse(
                    Request.QueryString["ProductId"],
                    out productId))
                {
                    ShowMessage("Invalid product.",Color.Red);

                    return;
                }


                // Get Quantity
                int quantity;

                if (!int.TryParse(
                    txtQuantity.Text,
                    out quantity))
                {
                    ShowMessage("Please enter a valid quantity.",Color.Red);

                    return;
                }


                if (quantity <= 0)
                {
                    ShowMessage("Quantity must be greater than zero.",Color.Red);

                    return;
                }


                // Add to Cart

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
                quantity)
        };


                obj.ExecuteNonQuery(
                    "sp_AddToCart",
                    param);


                ShowMessage("✓ Product added to cart successfully.",Color.Green);
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message,Color.Red);
            }
        }
            private DataTable CreateCartTable()
            {
                DataTable cart =
                    new DataTable();


                cart.Columns.Add(
                    "ProductId",
                    typeof(int));


                cart.Columns.Add(
                    "ProductName",
                    typeof(string));


                cart.Columns.Add(
                    "Price",
                    typeof(decimal));


                cart.Columns.Add(
                    "Quantity",
                    typeof(int));


                cart.Columns.Add(
                    "ImageUrl",
                    typeof(string));


                cart.Columns.Add(
                    "Total",
                    typeof(decimal));


                return cart;
            }

        private void ShowMessage(string message, Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }

        //protected void btnWishlist_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        // Check login

        //        if (Session["UserId"] == null)
        //        {
        //            Response.Redirect("Login.aspx");
        //            return;
        //        }


        //        int userId =
        //            Convert.ToInt32(
        //                Session["UserId"]);


        //        // Get ProductId

        //        int productId;

        //        if (!int.TryParse(
        //            Request.QueryString["ProductId"],
        //            out productId))
        //        {
        //            ShowMessage("Invalid product.",Color.Red);

        //            return;
        //        }


        //        // Add to Wishlist

        //        SqlParameter[] param =
        //        {
        //    new SqlParameter(
        //        "@UserId",
        //        userId),

        //    new SqlParameter(
        //        "@ProductId",
        //        productId)
        //};


        //        obj.ExecuteNonQuery(
        //            "sp_AddToWishlist",
        //            param);


        //        btnWishlist.Text ="♥ Added to Wishlist";


        //        btnWishlist.CssClass = "btn btn-danger px-4";


        //        ShowMessage("✓ Product added to wishlist.",Color.Green);
        //    }
        //    catch (Exception ex)
        //    {
        //        ShowMessage(ex.Message,Color.Red);
        //    }
        //    }


        // IMAGE URL


    }
    }
