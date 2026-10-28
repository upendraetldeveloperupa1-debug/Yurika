using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class Home : System.Web.UI.Page
    {
        Class1 obj = new Class1();

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();

                LoadProducts();
            }
        }


        // =====================================
        // LOAD CATEGORIES
        // =====================================

        private void LoadCategories()
        {
            try
            {
                DataTable dt =
                    obj.Get(
                        "sp_HomeCategories");

                rptCategories.DataSource = dt;

                rptCategories.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Category error: "
                    + ex.Message.Replace("'", "")
                    + "');</script>");
            }
        }


        // =====================================
        // LOAD PRODUCTS
        // =====================================

        private void LoadProducts()
        {
            try
            {
                DataTable dt =
                    obj.Get(
                        "sp_HomeProducts");

                rptProducts.DataSource = dt;

                rptProducts.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(
                    "<script>alert('Product error: "
                    + ex.Message.Replace("'", "")
                    + "');</script>");
            }
        }


        // =====================================
        // IMAGE URL
        // =====================================

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
                image.ToString();


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
    }
}