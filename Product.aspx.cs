using DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategory();
                LoadBrand();
                bindgrid();
            }
        }


        // =========================
        // LOAD CATEGORY
        // =========================

        private void LoadCategory()
        {
            Class1 obj = new Class1();

            DataTable dt =
                obj.Get("sp_GetCategory");

            ddlCategory.DataSource = dt;

            ddlCategory.DataTextField =
                "CategoryName";

            ddlCategory.DataValueField =
                "CategoryId";

            ddlCategory.DataBind();

            ddlCategory.Items.Insert(
                0,
                new ListItem(
                    "-- Select Category --",
                    "0"));
        }


        // =========================
        // LOAD BRAND
        // =========================

        private void LoadBrand()
        {
            Class1 obj = new Class1();

            DataTable dt =
                obj.Get("sp_GetBrand");

            ddlBrand.DataSource = dt;

            ddlBrand.DataTextField =
                "BrandName";

            ddlBrand.DataValueField =
                "BrandId";

            ddlBrand.DataBind();

            ddlBrand.Items.Insert(
                0,
                new ListItem(
                    "-- Select Brand --",
                    "0"));
        }


        // =========================
        // LOAD PRODUCT GRID
        // =========================

        private void bindgrid()
        {
            try
            {
                Class1 obj = new Class1();

                DataTable dt =
                    obj.Get("sp_GetProduct");

                gvProduct.DataSource = dt;

                gvProduct.DataBind();
            }
            catch (Exception ex)
            {
                //ShowMessage("Error loading products: " + ex.Message, false);
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Class1 obj = new Class1();


                // Validation

                if (string.IsNullOrWhiteSpace(
                    txtProductName.Text))
                {
                    //ShowMessage(
                    //    "Please enter product name.",
                    //    false);

                    return;
                }


                if (ddlCategory.SelectedValue == "0")
                {
                    //ShowMessage("Please select category.",false);

                    return;
                }


                if (ddlBrand.SelectedValue == "0")
                {
                    //ShowMessage("Please select brand.",false);

                    return;
                }


                if (!decimal.TryParse(
                    txtPrice.Text,
                    out decimal price))
                {
                    //ShowMessage("Please enter valid price.",false);

                    return;
                }


                if (!int.TryParse(
                    txtStock.Text,
                    out int stock))
                {
                   // ShowMessage("Please enter valid stock.",false);

                    return;
                }


                // =========================
                // INSERT
                // =========================

                if (btnSave.Text.Trim()
                    .Equals(
                        "Save",
                        StringComparison.OrdinalIgnoreCase))
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@ProductName",
                            txtProductName.Text.Trim()),

                        new SqlParameter(
                            "@CategoryId",
                            Convert.ToInt32(
                                ddlCategory.SelectedValue)),

                        new SqlParameter(
                            "@BrandId",
                            Convert.ToInt32(
                                ddlBrand.SelectedValue)),

                        new SqlParameter(
                            "@Description",
                            txtDescription.Text.Trim()),

                        new SqlParameter(
                            "@Price",
                            price),

                        new SqlParameter(
                            "@Stock",
                            stock),

                        new SqlParameter(
                            "@ImageUrl",
                            txtImageUrl.Text.Trim()),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_InsertProduct",
                        param);


                    //ShowMessage("Product saved successfully.",true);
                }

                // =========================
                // UPDATE
                // =========================

                else
                {
                    if (ViewState["ProductId"] == null)
                    {
                        //ShowMessage("Product ID is missing.",false);

                        return;
                    }


                    int productId =
                        Convert.ToInt32(
                            ViewState["ProductId"]);


                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@ProductId",
                            productId),

                        new SqlParameter(
                            "@ProductName",
                            txtProductName.Text.Trim()),

                        new SqlParameter(
                            "@CategoryId",
                            Convert.ToInt32(
                                ddlCategory.SelectedValue)),

                        new SqlParameter(
                            "@BrandId",
                            Convert.ToInt32(
                                ddlBrand.SelectedValue)),

                        new SqlParameter(
                            "@Description",
                            txtDescription.Text.Trim()),

                        new SqlParameter(
                            "@Price",
                            price),

                        new SqlParameter(
                            "@Stock",
                            stock),

                        new SqlParameter(
                            "@ImageUrl",
                            txtImageUrl.Text.Trim()),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_UpdateProduct",
                        param);


                    //ShowMessage("Product updated successfully.",true);
                }


                ClearForm();

                bindgrid();
            }
            catch (SqlException ex)
            {
                //ShowMessage("Database error: " + ex.Message,false);
            }
            catch (Exception ex)
            {
                //ShowMessage("Error: " + ex.Message,false);
            }
        }

        protected void gvProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int productId =
                    Convert.ToInt32(
                        e.CommandArgument);


                Class1 obj = new Class1();


                // =========================
                // EDIT
                // =========================

                if (e.CommandName ==
                    "EditProduct")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@ProductId",
                            productId)
                    };


                    DataTable dt =
                        obj.GetOne(
                            "sp_GetProductById",
                            param);


                    if (dt.Rows.Count > 0)
                    {
                        ViewState["ProductId"] =
                            productId;


                        txtProductName.Text =
                            dt.Rows[0]
                            ["ProductName"]
                            .ToString();


                        ddlCategory.SelectedValue =
                            dt.Rows[0]
                            ["CategoryId"]
                            .ToString();


                        ddlBrand.SelectedValue =
                            dt.Rows[0]
                            ["BrandId"]
                            .ToString();


                        txtDescription.Text =
                            dt.Rows[0]
                            ["Description"]
                            .ToString();


                        txtPrice.Text =
                            dt.Rows[0]
                            ["Price"]
                            .ToString();


                        txtStock.Text =
                            dt.Rows[0]
                            ["Stock"]
                            .ToString();


                        txtImageUrl.Text =
                            dt.Rows[0]
                            ["ImageUrl"]
                            .ToString();


                        chkActive.Checked =
                            Convert.ToBoolean(
                                dt.Rows[0]
                                ["IsActive"]);


                        btnSave.Text =
                            "Update";
                    }
                }
                else if (
                        e.CommandName ==
                        "DeleteProduct")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@ProductId",
                            productId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_DeleteProduct",
                        param);


                   // ShowMessage("Product deleted successfully.",true);

                    ClearForm();
                    bindgrid();
                }
            }
            catch (SqlException ex)
            {
                //ShowMessage("Database error: " + ex.Message,false);
            }
            catch (Exception ex)
            {
                //ShowMessage("Error: " + ex.Message,false);
            }
        }
        private void ClearForm()
        {
            txtProductName.Text = "";

            txtDescription.Text = "";

            txtPrice.Text = "";

            txtStock.Text = "";

            txtImageUrl.Text = "";

            chkActive.Checked = true;

            if (ddlCategory.Items.Count > 0)
                ddlCategory.SelectedIndex = 0;

            if (ddlBrand.Items.Count > 0)
                ddlBrand.SelectedIndex = 0;


            ViewState["ProductId"] = null;

            btnSave.Text = "Save";
        }
        private void ShowMessage(
            string message,
            Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }
    }
}

            
            
    



    
    
    



    

