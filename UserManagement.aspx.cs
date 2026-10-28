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
    public partial class UserManagement : System.Web.UI.Page
    {
        Class1 obj = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUsers();
                //ClearForm();
            }
        }


        // =========================
        // GET USERS
        // =========================

        private void BindUsers()
        {
            try
            {
                DataTable dt = obj.Get("sp_GetUsers");

                gvUser.DataSource = dt;
                gvUser.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading users: " + ex.Message,System.Drawing.Color.Red);
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtFullName.Text))
                {
                    //ShowMessage("Please enter full name.",System.Drawing.Color.Red);
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtEmail.Text))
                {
                   // ShowMessage("Please enter email.",System.Drawing.Color.Red);
                    return;
                }


                // INSERT

                if (btnSave.Text.Trim().Equals(
                    "Save User",
                    StringComparison.OrdinalIgnoreCase))
                {
                    if (string.IsNullOrWhiteSpace(txtPassword.Text))
                    {
                        //ShowMessage("Please enter password.", System.Drawing.Color.Red);
                        return;
                    }


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
                            "@PasswordHash",
                            txtPassword.Text),

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
                            "@UserRole",
                            ddlRole.SelectedValue),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_InsertUser",
                        param);


                    //ShowMessage("User created successfully.",System.Drawing.Color.Green);
                }

                // UPDATE

                else
                {
                    if (ViewState["UserId"] == null)
                    {
                        //ShowMessage( "User ID is missing.", System.Drawing.Color.Red);
                        return;
                    }

                    int userId =
                        Convert.ToInt32(ViewState["UserId"]);


                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@UserId",
                            userId),

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
                            "@UserRole",
                            ddlRole.SelectedValue),

                        new SqlParameter(
                            "@IsActive",
                            chkActive.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_UpdateUser",
                        param);


                    //ShowMessage("User updated successfully.",System.Drawing.Color.Green);
                }


                //ClearForm();
                BindUsers();
            }
            catch (SqlException ex)
            {
                ShowMessage("Database error: " + ex.Message,System.Drawing.Color.Red);
            }
            catch (Exception ex)
            {
                //ShowMessage("Error: " + ex.Message,System.Drawing.Color.Red);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtMobile.Text = "";
            txtPassword.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtPincode.Text = "";

            ddlRole.SelectedValue =
                "Customer";

            chkActive.Checked = true;

            ViewState["UserId"] = null;

            btnSave.Text =
                "Save User";
        }
        private void ShowMessage(
            string message,
            System.Drawing.Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }

        protected void gvUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int userId =
                    Convert.ToInt32(e.CommandArgument);


                // EDIT

                if (e.CommandName == "EditUser")
                {
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


                        ViewState["UserId"] =
                            userId;


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

                        ddlRole.SelectedValue =
                            row["UserRole"].ToString();

                        chkActive.Checked =
                            Convert.ToBoolean(
                                row["IsActive"]);


                        // Do not load password
                        txtPassword.Text = "";

                        btnSave.Text =
                            "Update User";
                    }
                }


                // DELETE

                else if (e.CommandName == "DeleteUser")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@UserId",
                            userId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_DeleteUser",
                        param);


                    //ShowMessage("User deleted successfully.",System.Drawing.Color.Green);


                    BindUsers();
                }
            }
            catch (Exception ex)
            {
                //ShowMessage("Error: " + ex.Message,System.Drawing.Color.Red);
            }
        }
    }
}