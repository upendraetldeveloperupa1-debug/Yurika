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
    public partial class AddressManagement : System.Web.UI.Page
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
                LoadAddresses();
            }
        }


        // LOAD ADDRESSES

        private void LoadAddresses()
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
                        "sp_GetUserAddresses",
                        param);


                rptAddresses.DataSource = dt;

                rptAddresses.DataBind();
            }
            catch (Exception ex)
            {
                ShowMessage(ex.Message, Color.Red);
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                if (!ValidateAddress())
                    return;


                int addressId = 0;

                int.TryParse(
                    hdnAddressId.Value,
                    out addressId);


                if (addressId == 0)
                {
                    // INSERT

                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@UserId",
                            userId),

                        new SqlParameter(
                            "@AddressType",
                            ddlAddressType.SelectedValue),

                        new SqlParameter(
                            "@FullName",
                            txtFullName.Text.Trim()),

                        new SqlParameter(
                            "@Mobile",
                            txtMobile.Text.Trim()),

                        new SqlParameter(
                            "@AddressLine",
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
                            "@IsDefault",
                            chkDefault.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_InsertUserAddress",
                        param);


                    ShowMessage(
                        "Address saved successfully.",
                        Color.Green);
                }
                else
                {
                    // UPDATE

                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@AddressId",
                            addressId),

                        new SqlParameter(
                            "@UserId",
                            userId),

                        new SqlParameter(
                            "@AddressType",
                            ddlAddressType.SelectedValue),

                        new SqlParameter(
                            "@FullName",
                            txtFullName.Text.Trim()),

                        new SqlParameter(
                            "@Mobile",
                            txtMobile.Text.Trim()),

                        new SqlParameter(
                            "@AddressLine",
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
                            "@IsDefault",
                            chkDefault.Checked)
                    };


                    obj.ExecuteNonQuery(
                        "sp_UpdateUserAddress",
                        param);


                    ShowMessage(
                        "Address updated successfully.",
                        Color.Green);
                }


                ClearForm();

                LoadAddresses();
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }
            protected void btnClear_Click(object sender, EventArgs e)
            {
                ClearForm();
            }

        private void ShowMessage(
           string message,
           Color color)
        {
            lblMessage.Text =
                message;

            lblMessage.ForeColor =
                color;
        }

        private void ClearForm()
        {
            hdnAddressId.Value = "";

            ddlAddressType.SelectedValue =
                "Home";

            txtFullName.Text = "";

            txtMobile.Text = "";

            txtAddress.Text = "";

            txtCity.Text = "";

            txtState.Text = "";

            txtPincode.Text = "";

            chkDefault.Checked = false;


            lblFormTitle.Text =
                "Add New Address";

            btnSave.Text =
                "Save Address";
        }

        private bool ValidateAddress()
        {
            if (string.IsNullOrWhiteSpace(
                txtFullName.Text))
            {
                ShowMessage(
                    "Please enter full name.",
                    Color.Red);

                return false;
            }


            if (string.IsNullOrWhiteSpace(
                txtMobile.Text))
            {
                ShowMessage(
                    "Please enter mobile number.",
                    Color.Red);

                return false;
            }


            if (string.IsNullOrWhiteSpace(
                txtAddress.Text))
            {
                ShowMessage(
                    "Please enter address.",
                    Color.Red);

                return false;
            }


            if (string.IsNullOrWhiteSpace(
                txtCity.Text))
            {
                ShowMessage(
                    "Please enter city.",
                    Color.Red);

                return false;
            }


            if (string.IsNullOrWhiteSpace(
                txtState.Text))
            {
                ShowMessage(
                    "Please enter state.",
                    Color.Red);

                return false;
            }


            if (string.IsNullOrWhiteSpace(
                txtPincode.Text))
            {
                ShowMessage(
                    "Please enter pincode.",
                    Color.Red);

                return false;
            }


            return true;
        }

        private void LoadAddressById(
            int addressId,
            int userId)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@AddressId",
                    addressId),

                new SqlParameter(
                    "@UserId",
                    userId)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_GetUserAddressById",
                    param);


            if (dt.Rows.Count == 0)
            {
                ShowMessage(
                    "Address not found.",
                    Color.Red);

                return;
            }


            DataRow row = dt.Rows[0];


            hdnAddressId.Value =
                row["AddressId"].ToString();


            ddlAddressType.SelectedValue =
                row["AddressType"].ToString();


            txtFullName.Text =
                row["FullName"].ToString();


            txtMobile.Text =
                row["Mobile"].ToString();


            txtAddress.Text =
                row["AddressLine"].ToString();


            txtCity.Text =
                row["City"].ToString();


            txtState.Text =
                row["State"].ToString();


            txtPincode.Text =
                row["Pincode"].ToString();


            chkDefault.Checked =
                Convert.ToBoolean(
                    row["IsDefault"]);


            lblFormTitle.Text =
                "Edit Address";


            btnSave.Text =
                "Update Address";
        }
        protected void rptAddresses_ItemCommand(
             object source,
             RepeaterCommandEventArgs e)
        {
            try
            {
                int userId =
                    Convert.ToInt32(
                        Session["UserId"]);


                int addressId =
                    Convert.ToInt32(
                        e.CommandArgument);


                // EDIT

                if (e.CommandName ==
                    "EditAddress")
                {
                    LoadAddressById(
                        addressId,
                        userId);
                }


                // DELETE

                else if (e.CommandName ==
                         "DeleteAddress")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@AddressId",
                            addressId),

                        new SqlParameter(
                            "@UserId",
                            userId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_DeleteUserAddress",
                        param);


                    ShowMessage(
                        "Address deleted successfully.",
                        Color.Green);


                    LoadAddresses();
                }


                // SET DEFAULT

                else if (e.CommandName ==
                         "SetDefault")
                {
                    SqlParameter[] param =
                    {
                        new SqlParameter(
                            "@AddressId",
                            addressId),

                        new SqlParameter(
                            "@UserId",
                            userId)
                    };


                    obj.ExecuteNonQuery(
                        "sp_SetDefaultAddress",
                        param);


                    ShowMessage(
                        "Default address updated.",
                        Color.Green);


                    LoadAddresses();
                }
            }
            catch (Exception ex)
            {
                ShowMessage(
                    ex.Message,
                    Color.Red);
            }
        }




    }
}