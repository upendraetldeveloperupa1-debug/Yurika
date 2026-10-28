using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebKiu
{
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("server=DESKTOP-IA3TB3G\\SQLEXPRESS;database=EmployeeDB; integrated security =true");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into employee(Name,Email,Salary)values('"+ txtName.Text+ "','"+ txtEmail.Text+ "','"+ txtSalary.Text+ "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}