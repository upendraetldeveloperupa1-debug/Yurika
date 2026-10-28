using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Xml.Linq;

namespace WebKiu
{
    
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindgrid();
            }
        }

        public void bindgrid()
        {
            Class1 obj = new Class1();
            DataTable dt1 = new DataTable();
            dt1 = obj.Get("sp_GetCategory");
            Gvcategory.DataSource = dt1;
            Gvcategory.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Class1 obj = new Class1();
            if (btnSave.Text == "save")
            {
                SqlParameter[] param1 ={
                 //new SqlParameter("@CategoryId", Convert.ToInt32(txtCategoryId.Text)),
                 new SqlParameter("@CategoryName",txtCategoryName.Text),
                 new SqlParameter("@Description",txtDescription.Text),
                 new SqlParameter("@IsActive",chkActive.Checked),
                 

            };
                obj.ExecuteNonQuery("sp_InsertCategory", param1);
                bindgrid();
            }
            else
            {
                SqlParameter[] param1 ={
                 new SqlParameter("@CategoryId",Convert.ToInt32(ViewState["CategoryId"])),
                 new SqlParameter("@CategoryName",txtDescription.Text),
                 new SqlParameter("@Description",txtDescription.Text),
                 new SqlParameter("@IsActive",chkActive.Checked)

                 };
                obj.ExecuteNonQuery("sp_UpdateCategory", param1);
                bindgrid();

            }
        }

        protected void gvcategory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                Class1 obj = new Class1();
                SqlParameter[] param1 ={
                 new SqlParameter("@CategoryId",e.CommandArgument),

            };
                obj.ExecuteNonQuery("sp_DeleteCategory", param1);
                bindgrid();
            }
            else if (e.CommandName == "B")
            {
                Class1 obj = new Class1();
                SqlParameter[] param1 ={
                 new SqlParameter("@CategoryId",e.CommandArgument)
                };

                DataTable dt1 = new DataTable();
                dt1 = obj.GetOne("sp_Category_edit", param1);
                txtCategoryName.Text = dt1.Rows[0]["CategoryName"].ToString();
                txtDescription.Text = dt1.Rows[0]["Description"].ToString();
                chkActive.Text = dt1.Rows[0]["chkActive"].ToString();
                
                btnSave.Text = "update";
                ViewState["CategoryId"] = e.CommandName;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCategoryName.Text = "";
            txtDescription.Text = "";
            chkActive.Checked = true;

            ViewState["CategoryId"] = null;

            btnSave.Text = "Save";
        }
    }


    }
   