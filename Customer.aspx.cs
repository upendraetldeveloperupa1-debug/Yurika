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
    public partial class Customer : System.Web.UI.Page
    {
        Class1 obj = new Class1();


        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin security

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
                BindCustomers();
            }
        }

        private void BindCustomers()
        {
            DataTable dt =
                obj.Get(
                    "sp_GetCustomers");


            gvCustomer.DataSource = dt;

            gvCustomer.DataBind();
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(
                    txtFullName.Text))
                {
                    ShowMessage("Please enter customer name.",Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    txtEmail.Text))
                {
                    ShowMessage("Please enter email.",Color.Red);

                    return;
                }


                if (string.IsNullOrWhiteSpace(
                    hfCustomerId.Value))
                {
                    // ==========================
                    // INSERT
                    // ==========================

                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@FullName",
                            txtFullName.Text.Trim()),

                        new SqlParameter(
                            "@Email",
                            txtEmail.Text.Trim()),

                        new SqlParameter(
                            "@Mobile",
                            txtMobile.Text.Trim()),

                        new SqlParameter(
                            "@Address",
                            txtAddress.Text.Trim()),

                        new SqlParameter(
                            "@City",
                            txtCity.Text.Trim()),

                        new SqlParameter(
                            "@State",
                            txtState.Text.Trim()),

                        new SqlParameter(
                            "@Pincode",
                            txtPincode.Text.Trim()),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_InsertCustomer",
                        param);


                    ShowMessage("Customer saved successfully.",Color.Green);
                }
                else
                {
                    // ==========================
                    // UPDATE
                    // ==========================

                    int customerId =
                        Convert.ToInt32(
                            hfCustomerId.Value);


                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@CustomerId",
                            customerId),

                        new SqlParameter(
                            "@FullName",
                            txtFullName.Text.Trim()),

                        new SqlParameter(
                            "@Email",
                            txtEmail.Text.Trim()),

                        new SqlParameter(
                            "@Mobile",
                            txtMobile.Text.Trim()),

                        new SqlParameter(
                            "@Address",
                            txtAddress.Text.Trim()),

                        new SqlParameter(
                            "@City",
                            txtCity.Text.Trim()),

                        new SqlParameter(
                            "@State",
                            txtState.Text.Trim()),

                        new SqlParameter(
                            "@Pincode",
                            txtPincode.Text.Trim()),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_UpdateCustomer",
                        param);


                    ShowMessage("Customer updated successfully.",Color.Green);
                }


                ClearForm();

                BindCustomers();
            }
            catch (SqlException ex)
            {
                ShowMessage("Database error: " + ex.Message,Color.Red);
            }
            catch (Exception ex)
            {
                ShowMessage( "Error: " + ex.Message, Color.Red);
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();

            lblMessage.Text = "";
        }

        private void ClearForm()
        {
            hfCustomerId.Value = "";

            txtFullName.Text = "";

            txtEmail.Text = "";

            txtMobile.Text = "";

            txtAddress.Text = "";

            txtCity.Text = "";

            txtState.Text = "";

            txtPincode.Text = "";

            chkActive.Checked = true;

            btnSave.Text = "Save Customer";
        }


        // ========================================
        // MESSAGE
        // ========================================

        private void ShowMessage(
            string message,
            Color color)
        {
            lblMessage.Text = message;

            lblMessage.ForeColor = color;
        }

        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string search =
                    txtSearch.Text.Trim();


                if (string.IsNullOrEmpty(search))
                {
                    BindCustomers();
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
                        "sp_SearchCustomer",
                        param);


                gvCustomer.DataSource = dt;

                gvCustomer.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Search error: " + ex.Message,Color.Red);
            }
        }

        protected void gvCustomer_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int customerId =
                    Convert.ToInt32(
                        e.CommandArgument);


                // ==========================
                // EDIT
                // ==========================

                if (e.CommandName ==
                    "EditCustomer")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@CustomerId",
                            customerId)
                    };


                    DataTable dt =
                        obj.GetOne(
                            "sp_GetCustomerById",
                            param);


                    if (dt.Rows.Count > 0)
                    {
                        DataRow row =
                            dt.Rows[0];


                        hfCustomerId.Value =
                            row["CustomerId"].ToString();


                        txtFullName.Text =
                            row["FullName"].ToString();


                        txtEmail.Text =
                            row["Email"].ToString();


                        txtMobile.Text =
                            row["Mobile"].ToString();


                        txtAddress.Text =
                            row["Address"].ToString();


                        txtCity.Text =
                            row["City"].ToString();


                        txtState.Text =
                            row["State"].ToString();


                        txtPincode.Text =
                            row["Pincode"].ToString();


                        chkActive.Checked =
                            Convert.ToBoolean(
                                row["IsActive"]);


                        btnSave.Text =
                            "Update Customer";


                        lblMessage.Text =
                            "Customer loaded for editing.";

                        lblMessage.ForeColor =
                            Color.Blue;
                    }
                }


                // ==========================
                // DELETE
                // ==========================

                else if (e.CommandName ==
                         "DeleteCustomer")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@CustomerId",
                            customerId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_DeleteCustomer",
                        param);


                    ShowMessage("Customer deleted successfully.",Color.Green);


                    BindCustomers();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error: " + ex.Message,Color.Red);
            }
        }
    }
}