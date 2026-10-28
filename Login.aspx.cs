using DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebKiu
{
    public partial class Login : System.Web.UI.Page
    {
        Class1 obj = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMessage.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string email =
                    txtEmail.Text.Trim();

                string password =
                    txtPassword.Text;


                // Validation

                if (string.IsNullOrWhiteSpace(email))
                {
                    lblMessage.Text =
                        "Please enter email.";

                    return;
                }

                if (string.IsNullOrWhiteSpace(password))
                {
                    lblMessage.Text =
                        "Please enter password.";

                    return;
                }


                // Parameters

                SqlParameter[] param =
                {
                    new SqlParameter(
                        "@Email",
                        email),

                    new SqlParameter(
                        "@PasswordHash",
                        password)
                };


                // Login

                DataTable dt =
                    obj.GetOne(
                        "sp_UserLogin",
                        param);


                if (dt.Rows.Count > 0)
                {
                    DataRow row = dt.Rows[0];


                    // Create Session

                    Session["UserId"] =
                        row["UserId"].ToString();

                    Session["FullName"] =
                        row["FullName"].ToString();

                    Session["Email"] =
                        row["Email"].ToString();

                    Session["UserRole"] =
                        row["UserRole"].ToString();


                    string role =
                        row["UserRole"].ToString();


                    // Redirect based on role

                    if (role.Equals(
                        "Admin",
                        StringComparison.OrdinalIgnoreCase))
                    {
                        Response.Redirect(
                            "AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect(
                            "Home.aspx");
                    }
                }
                else
                {
                    lblMessage.Text =
                        "Invalid email or password.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text =
                    "Login error: " + ex.Message;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Get values from registration modal
            string name = txtName.Text.Trim();
            string email = TextBox1.Text.Trim();
            string mobile = txtMobile.Text.Trim();
            string password = textPassword.Text.Trim();
            string address = txtAddress.Text.Trim();
            string city = txtCity.Text.Trim();
            string state = txtState.Text.Trim();
            string Role = ddlRole.SelectedValue.Trim();
            string pincode = txtPincode.Text.Trim();

            // Password validation
            //if (password != txtPassword)
            //{
            //    ShowRegisterMessage("Password and Confirm Password do not match.");
            //    return;
            //}

            // Basic validation
            if (string.IsNullOrEmpty(name) ||
                string.IsNullOrEmpty(email) ||
                string.IsNullOrEmpty(mobile) ||
                string.IsNullOrEmpty(password))
            {
                ShowRegisterMessage("Please fill all required fields.");
                return;
            }

            try
            {
                string cs = ConfigurationManager
                    .ConnectionStrings["DBCS"]
                    .ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("sp_InsertUser", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@FullName", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Mobile", mobile);
                        cmd.Parameters.AddWithValue("@PasswordHash", password);
                        cmd.Parameters.AddWithValue("@Address", address);
                        cmd.Parameters.AddWithValue("@City", city);
                        cmd.Parameters.AddWithValue("@State", state);
                        cmd.Parameters.AddWithValue("@Pincode", pincode);
                        cmd.Parameters.AddWithValue("@UserRole", ddlRole.SelectedValue);
                        cmd.Parameters.AddWithValue("@IsActive", chkActive.Checked);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Registration successful
                ClientScript.RegisterStartupScript(
                    this.GetType(),
                    "registerSuccess",
                    "alert('Account created successfully!');",
                    true
                );

                // Clear registration fields
                txtName.Text = "";
                TextBox1.Text = "";
                txtMobile.Text = "";
                textPassword.Text = "";
                txtAddress.Text = "";
                txtCity.Text = "";
                txtState.Text = "";
                txtPincode.Text = "";
                chkActive.Checked = false;
            }
            catch (Exception ex)
            {
                ShowRegisterMessage("Registration failed: " + ex.Message);
            }
        }

        private void ShowRegisterMessage(string message)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "registerError",
                "alert('" + message.Replace("'", "\\'") + "');",
                true
            );
        }
    }
}
    
