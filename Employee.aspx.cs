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
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection cs = new SqlConnection("server=DESKTOP-IA3TB3G\\SQLEXPRESS;database=EmployeeDB; integrated security =true");
        //string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                LoadEmployee();
                LoadDepartment();
            }
        }

        private void LoadEmployee()
        {
            //using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "sp_Employee_GetAll", cs);

                cmd.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                da.Fill(dt);
                gvEmployee.DataSource = dt;
                gvEmployee.DataBind();
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Department validation

            if (ddlDepartment.SelectedValue == "0")
            {
                Response.Write(
                    "<script>alert('Please select department');</script>");

                return;
            }

            //using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd;

                if (string.IsNullOrEmpty(hdnEmployeeId.Value))
                {
                    cmd = new SqlCommand(
                        "sp_Employee_Insert", cs);

                    cmd.CommandType = CommandType.StoredProcedure;
                }
                else
                {
                    cmd = new SqlCommand("sp_Employee_Update", cs);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@EmployeeId",Convert.ToInt32(hdnEmployeeId.Value));
                }

                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Salary",Convert.ToDecimal(txtSalary.Text));
                cmd.Parameters.AddWithValue("@DepartmentId",Convert.ToInt32(ddlDepartment.SelectedValue));

                cs.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected void gvEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);

            int employeeId = Convert.ToInt32(
                gvEmployee.DataKeys[rowIndex].Value);

            if (e.CommandName == "EditEmployee")
            {
                EditEmployee(employeeId);
            }

            if (e.CommandName == "DeleteEmployee")
            {
                DeleteEmployee(employeeId);
            }
        }

        private void EditEmployee(int id)
        {
            //using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT * FROM Employee WHERE EmployeeId=@Id",
                    cs);

                cmd.Parameters.AddWithValue("@Id", id);

                cs.Open();

                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    hdnEmployeeId.Value =
                        dr["EmployeeId"].ToString();

                    txtName.Text =
                        dr["Name"].ToString();

                    txtEmail.Text =
                        dr["Email"].ToString();

                    txtSalary.Text =
                        dr["Salary"].ToString();
                    ddlDepartment.SelectedValue =
                       dr["DepartmentId"].ToString();

                    btnSave.Text = "Update";
                }
            }
        }

        // DELETE
        private void DeleteEmployee(int id)
        {
            //using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "sp_Employee_Delete", cs);

                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@EmployeeId", id);

                cs.Open();
                cmd.ExecuteNonQuery();
            }

            //LoadEmployee();
        }
        private void LoadDepartment()
        {
            //using (SqlConnection con =
            //       new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand(
                    "sp_Department_GetAll",
                    cs);

                cmd.CommandType =
                    CommandType.StoredProcedure;

                SqlDataAdapter da =
                    new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();

                da.Fill(dt);

                ddlDepartment.DataSource = dt;

                ddlDepartment.DataTextField =
                    "DepartmentName";

                ddlDepartment.DataValueField =
                    "DepartmentId";

                ddlDepartment.DataBind();

                // Add default item
                ddlDepartment.Items.Insert(
                    0,
                    new System.Web.UI.WebControls.ListItem(
                        "-- Select Department --",
                        "0"
                    ));
            }
        }

        private void ClearForm()
        {
            hdnEmployeeId.Value = "";

            txtName.Text = "";
            txtEmail.Text = "";
            txtSalary.Text = "";
            ddlDepartment.SelectedIndex = 0;
            btnSave.Text = "Save";
        }
    }
}
