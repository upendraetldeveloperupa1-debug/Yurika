using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class Product_Image : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProducts();
                BindGrid();
            }
        }


        // =========================
        // LOAD PRODUCTS
        // =========================

        private void LoadProducts()
        {
            try
            {
                Class1 obj = new Class1();

                DataTable dt =
                    obj.Get("sp_GetProduct");

                ddlProduct.DataSource = dt;

                ddlProduct.DataTextField =
                    "ProductName";

                ddlProduct.DataValueField =
                    "ProductId";

                ddlProduct.DataBind();

                ddlProduct.Items.Insert(
                    0,
                    new ListItem(
                        "-- Select Product --",
                        "0"));
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading products: " +ex.Message,false);
            }
        }

        private void BindGrid()
        {
            try
            {
                Class1 obj = new Class1();

                DataTable dt =
                    obj.Get(
                        "sp_GetAllProductImages");

                gvProductImage.DataSource = dt;

                gvProductImage.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading images: " +ex.Message,false);
            }
        }




        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Class1 obj = new Class1();


                // Product validation

                if (ddlProduct.SelectedValue == "0")
                {
                    ShowMessage("Please select a product.",false);

                    return;
                }


                // File validation

                if (!fuProductImage.HasFile)
                {
                    ShowMessage("Please select an image.",false);

                    return;
                }


                string extension =
                    Path.GetExtension(
                        fuProductImage.FileName)
                    .ToLower();


                string[] allowedExtensions =
                {
                    ".jpg",
                    ".jpeg",
                    ".png",
                    ".webp"
                };


                if (!Array.Exists(
                    allowedExtensions,
                    x => x == extension))
                {
                    ShowMessage("Only JPG, JPEG, PNG and WEBP images are allowed.",false);

                    return;
                }


                // Maximum 2 MB

                if (fuProductImage.PostedFile.ContentLength > 2 * 1024 * 1024)
                {
                    ShowMessage("Image size must be less than 2 MB.",false);

                    return;
                }


                // Create folder

                string folder =
                    Server.MapPath(
                        "~/Images/Products/");


                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }


                // Unique file name

                string fileName =
                    Guid.NewGuid().ToString("N")
                    + extension;


                string physicalPath =
                    Path.Combine(
                        folder,
                        fileName);


                fuProductImage.SaveAs(
                    physicalPath);


                string imageUrl =
                    "~/Images/Products/"
                    + fileName;


                // =========================
                // INSERT DATABASE
                // =========================

                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@ProductId",
                        Convert.ToInt32(
                            ddlProduct.SelectedValue)),

                    new SqlParameter(
                        "@ImageUrl",
                        imageUrl),

                    new SqlParameter(
                        "@IsPrimary",
                        chkPrimary.Checked),

                    new SqlParameter(
                        "@IsActive",
                        chkActive.Checked)
                };


                obj.ExecuteNonQuery(
                    "sp_InsertProductImage",
                    param);


                ShowMessage("Product image uploaded successfully.",true);


                ClearForm();

                BindGrid();
            }
            catch (SqlException ex)
            {
                ShowMessage("Database error: " +ex.Message,false);
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " +ex.Message,false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }
        private void ClearForm()
        {
            if (ddlProduct.Items.Count > 0)
            {
                ddlProduct.SelectedIndex = 0;
            }

            chkPrimary.Checked = false;
            chkActive.Checked = true;
        }
        private void ShowMessage(
            string message,
            bool success)
        {
            lblMessage.Text = message;

            lblMessage.ForeColor =
                success
                ? System.Drawing.Color.Green
                : System.Drawing.Color.Red;
        }
        protected void gvProductImage_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                if (e.CommandName ==
                    "DeleteImage")
                {
                    int imageId =
                        Convert.ToInt32(
                            e.CommandArgument);


                    Class1 obj = new Class1();


                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@ProductImageId",
                            imageId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_DeleteProductImage",
                        param);


                    ShowMessage("Product image deleted successfully.",true);


                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Delete error: " +ex.Message,false);
            }
        }


    }
}