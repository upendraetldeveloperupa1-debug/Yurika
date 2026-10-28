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
    public partial class Brand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }
        }

        private void bindgrid()
        {
            try
            {
                Class1 obj = new Class1();

                DataTable dt = obj.Get("sp_GetBrand");

                gvBrand.DataSource = dt;
                gvBrand.DataBind();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading brands: " + ex.Message;
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Class1 obj = new Class1();

                if (string.IsNullOrWhiteSpace(txtBrandName.Text))
                {
                    lblMessage.Text =
                        "Please enter brand name.";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;

                    return;
                }

                if (btnSave.Text.Trim().Equals(
                    "Save",
                    StringComparison.OrdinalIgnoreCase))
                {
                    // INSERT

                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@BrandName",
                            txtBrandName.Text.Trim()),

                        new SqlParameter(
                            "@Description",
                            txtDescription.Text.Trim()),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };

                    obj.ExecuteNonQuery(
                        "sp_InsertBrand",
                        param);

                    lblMessage.Text =
                        "Brand saved successfully.";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Green;
                }
                else
                {
                    // UPDATE

                    if (ViewState["BrandId"] == null)
                    {
                        lblMessage.Text =
                            "Brand ID is missing.";

                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;

                        return;
                    }

                    int brandId =
                        Convert.ToInt32(
                            ViewState["BrandId"]);

                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@BrandId",
                            brandId),

                        new SqlParameter(
                            "@BrandName",
                            txtBrandName.Text.Trim()),

                        new SqlParameter(
                            "@Description",
                            txtDescription.Text.Trim()),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };

                    obj.ExecuteNonQuery(
                        "sp_UpdateBrand",
                        param);

                    lblMessage.Text =
                        "Brand updated successfully.";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Green;
                }

                //ClearForm();
                bindgrid();
            }
            catch (SqlException ex)
            {
                lblMessage.Text =
                    "Database error: " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error: " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }
       

        protected void gvBrand_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int brandId = Convert.ToInt32(e.CommandArgument);

                Class1 obj = new Class1();

                // EDIT
                if (e.CommandName == "EditBrand")
                {
                    SqlParameter[] param =
                    {
                new SqlParameter("@BrandId", brandId)
            };

                    DataTable dt = obj.GetOne(
                        "sp_GetBrandById",
                        param);

                    if (dt.Rows.Count > 0)
                    {
                        ViewState["BrandId"] = brandId;

                        txtBrandName.Text =
                            dt.Rows[0]["BrandName"].ToString();

                        txtDescription.Text =
                            dt.Rows[0]["Description"].ToString();

                        chkActive.Checked =
                            Convert.ToBoolean(
                                dt.Rows[0]["IsActive"]);

                        btnSave.Text = "Update";
                    }
                }

                // DELETE
                else if (e.CommandName == "DeleteBrand")
                {
                    SqlParameter[] param =
                    {
                new SqlParameter("@BrandId", brandId)
            };

                    obj.ExecuteNonQuery(
                        "sp_DeleteBrand",
                        param);

                    lblMessage.Text =
                        "Brand deleted successfully.";

                    lblMessage.ForeColor =
                        System.Drawing.Color.Green;

                    bindgrid();
                }
            }
            catch (SqlException ex)
            {
                lblMessage.Text =
                    "Database error: " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Error: " + ex.Message;

                lblMessage.ForeColor =
                    System.Drawing.Color.Red;
            }
        }

        //protected void gvBrand_RowDeleted(object sender, GridViewDeletedEventArgs e)
        //{
        //    try
        //    {
        //        int brandId =
        //            Convert.ToInt32(
        //                gvBrand.DataKeys[e.RowIndex].Value);

        //        Class1 obj = new Class1();

        //        SqlParameter[] param =
        //        {
        //            new SqlParameter(
        //                "@BrandId",
        //                brandId)
        //        };

        //        obj.ExecuteNonQuery(
        //            "sp_DeleteBrand",
        //            param);

        //        lblMessage.Text =
        //            "Brand deleted successfully.";

        //        lblMessage.ForeColor =
        //            System.Drawing.Color.Green;

        //        bindgrid();
        //    }
        //    catch (Exception ex)
        //    {
        //        lblMessage.Text =
        //            "Delete error: " + ex.Message;

        //        lblMessage.ForeColor =
        //            System.Drawing.Color.Red;
        //    }
        //}

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            //ClearForm();
        }
    }
}