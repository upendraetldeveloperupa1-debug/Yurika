using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class Size : System.Web.UI.Page
    {
        string conString =
             ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSize();
            }
        }


        // ============================
        // BIND SIZE GRID
        // ============================

        private void BindSize()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_GetProductSize", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvSize.DataSource = dt;
                    gvSize.DataBind();
                }
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSizeName.Text))
            {
                lblMessage.Text = "Please enter size name.";
                lblMessage.CssClass = "text-danger fw-bold";
                return;
            }

            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_InsertProductSize", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@SizeName",
                        txtSizeName.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@Description",
                        txtDescription.Text.Trim());

                    cmd.Parameters.AddWithValue(
                        "@IsActive",
                        chkActive.Checked);

                    con.Open();

                    SqlDataReader dr = cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        int result =
                            Convert.ToInt32(dr["Result"]);

                        string message =
                            dr["Message"].ToString();

                        lblMessage.Text = message;

                        if (result == 1)
                        {
                            lblMessage.CssClass =
                                "text-success fw-bold";

                            ClearForm();
                            BindSize();
                        }
                        else
                        {
                            lblMessage.CssClass =
                                "text-danger fw-bold";
                        }
                    }
                }
            }

        }

        private void EditSize(int sizeId)
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(
                        "sp_GetProductSizeById",
                        con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@SizeId",
                        sizeId);

                    con.Open();

                    SqlDataReader dr =
                        cmd.ExecuteReader();

                    if (dr.Read())
                    {
                        hfSizeId.Value =
                            dr["SizeId"].ToString();

                        txtSizeName.Text =
                            dr["SizeName"].ToString();

                        txtDescription.Text =
                            dr["Description"].ToString();

                        chkActive.Checked =
                            Convert.ToBoolean(
                                dr["IsActive"]);


                        btnSave.Visible = false;

                        btnUpdate.Visible = true;
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(
                  txtSizeName.Text))
            {
                lblMessage.Text =
                    "Please enter size name.";

                lblMessage.CssClass =
                    "text-danger fw-bold";

                return;
            }


            int sizeId =
                Convert.ToInt32(hfSizeId.Value);


            using (SqlConnection con =
                new SqlConnection(conString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(
                        "sp_UpdateProductSize",
                        con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue(
                        "@SizeId",
                        sizeId);


                    cmd.Parameters.AddWithValue(
                        "@SizeName",
                        txtSizeName.Text.Trim());


                    cmd.Parameters.AddWithValue(
                        "@Description",
                        txtDescription.Text.Trim());


                    cmd.Parameters.AddWithValue(
                        "@IsActive",
                        chkActive.Checked);


                    con.Open();


                    SqlDataReader dr =
                        cmd.ExecuteReader();


                    if (dr.Read())
                    {
                        int result =
                            Convert.ToInt32(
                                dr["Result"]);


                        string message =
                            dr["Message"].ToString();


                        lblMessage.Text =
                            message;


                        if (result == 1)
                        {
                            lblMessage.CssClass =
                                "text-success fw-bold";

                            ClearForm();

                            BindSize();
                        }
                        else
                        {
                            lblMessage.CssClass =
                                "text-danger fw-bold";
                        }
                    }
                }
            }

        }

        private void DeleteSize(int sizeId)
        {
            using (SqlConnection con =
                new SqlConnection(conString))
            {
                using (SqlCommand cmd =
                    new SqlCommand(
                        "sp_DeleteProductSize",
                        con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;


                    cmd.Parameters.AddWithValue(
                        "@SizeId",
                        sizeId);


                    con.Open();


                    SqlDataReader dr =
                        cmd.ExecuteReader();


                    if (dr.Read())
                    {
                        lblMessage.Text =
                            dr["Message"].ToString();

                        lblMessage.CssClass =
                            "text-success fw-bold";
                    }
                }
            }

            BindSize();
        }


        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }
        private void ClearForm()
        {
            hfSizeId.Value = "";

            txtSizeName.Text = "";

            txtDescription.Text = "";

            chkActive.Checked = true;

            btnSave.Visible = true;

            btnUpdate.Visible = false;

            lblMessage.Text = "";
        }
        protected void gvSize_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int sizeId =
                Convert.ToInt32(e.CommandArgument);


            if (e.CommandName == "EditSize")
            {
                EditSize(sizeId);
            }


            if (e.CommandName == "DeleteSize")
            {
                DeleteSize(sizeId);
            }
        }
    }
}


   
