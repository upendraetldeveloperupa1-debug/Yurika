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
    public partial class ProductListing : System.Web.UI.Page
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


        // ==========================================
        // LOAD CATEGORIES
        // ==========================================

        private void LoadCategories()
        {
            try
            {
                DataTable dt =
                    obj.Get(
                        "sp_ProductListingCategories");


                ddlCategory.DataSource = dt;

                ddlCategory.DataTextField =
                    "CategoryName";

                ddlCategory.DataValueField =
                    "CategoryId";

                ddlCategory.DataBind();


                ddlCategory.Items.Insert(
                    0,
                    new System.Web.UI.WebControls
                        .ListItem(
                            "All Categories",
                            "0"));
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Category error: "
                    + ex.Message;
            }
        }


        // ==========================================
        // LOAD ALL PRODUCTS
        // ==========================================

        private void LoadProducts()
        {
            try
            {
                DataTable dt =
                    obj.Get(
                        "sp_ProductListing");


                BindProducts(dt);
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Product error: "
                    + ex.Message;
            }
        }


        // ==========================================
        // BIND PRODUCTS
        // ==========================================

        private void BindProducts(
            DataTable dt)
        {
            rptProducts.DataSource = dt;

            rptProducts.DataBind();


            if (dt.Rows.Count == 0)
            {
                pnlNoProducts.Visible = true;
            }
            else
            {
                pnlNoProducts.Visible = false;
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtSearch.Text = "";

            ddlCategory.SelectedIndex = 0;

            lblMessage.Text = "";

            LoadProducts();
        }

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

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                int categoryId =
                    Convert.ToInt32(
                        ddlCategory.SelectedValue);


                if (categoryId == 0)
                {
                    LoadProducts();

                    return;
                }


                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@CategoryId",
                        categoryId)
                };


                DataTable dt =
                    obj.GetOne(
                        "sp_ProductByCategory",
                        param);


                BindProducts(dt);
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Filter error: "
                    + ex.Message;
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string search =
                    txtSearch.Text.Trim();


                if (string.IsNullOrEmpty(search))
                {
                    LoadProducts();

                    return;
                }


                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@Search",
                        search)
                };


                DataTable dt =
                    obj.GetOne(
                        "sp_SearchProducts",
                        param);


                BindProducts(dt);
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Search error: "
                    + ex.Message;
            }
        }
    }
}