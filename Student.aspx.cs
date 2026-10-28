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
    public partial class Student : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection("server=DESKTOP-IA3TB3G\\SQLEXPRESS;database=EmployeeDB; integrated security =true");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bindgrid();
            }
        }
        public void bindgrid()
        {
            Class1 obj = new Class1();
            DataTable dt1 = new DataTable();
            dt1=obj.Get("sp_GetStudent");
            gvstudent.DataSource = dt1;
            gvstudent.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Class1 obj = new Class1();
            if(btnSave.Text=="save")
            { 
            SqlParameter[] param1 ={
                 new SqlParameter("@Name",txtName.Text),
                 new SqlParameter("@Email",Textemail.Text),
                 new SqlParameter("@Mobile",Textmob.Text),
                 new SqlParameter("@Address",Textaddress.Text),
            };
            obj.ExecuteNonQuery("sp_InsertStudent", param1);
                bindgrid();
             }
            else
            {
                SqlParameter[] param1 ={
                 new SqlParameter("@stid",ViewState["IDD"]),
                 new SqlParameter("@Name",txtName.Text),
                 new SqlParameter("@Email",Textemail.Text),
                 new SqlParameter("@Mobile",Textmob.Text),
                 new SqlParameter("@Address",Textaddress.Text),
            };
                obj.ExecuteNonQuery("sp_UpdateStudent", param1);
                bindgrid();

            }

        }

        protected void gvstudent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                Class1 obj = new Class1();
                SqlParameter[] param1 ={
                 new SqlParameter("@stid",e.CommandArgument),

            };
                obj.ExecuteNonQuery("sp_student_delete", param1);
                bindgrid();
            }
            else if (e.CommandName == "B")
            {
                Class1 obj = new Class1();
                SqlParameter[] param1 ={
                 new SqlParameter("@stid",e.CommandArgument)
                };
                
                DataTable dt1 = new DataTable();
                dt1 = obj.GetOne("sp_student_edit",param1);
                txtName.Text = dt1.Rows[0]["Name"].ToString();
                Textemail.Text = dt1.Rows[0]["Email"].ToString();
                Textmob.Text = dt1.Rows[0]["Mobile"].ToString();
                Textaddress.Text = dt1.Rows[0]["Address"].ToString();
                btnSave.Text = "update";
                ViewState["IDD"]=e.CommandName;
            }
        }
    }
}