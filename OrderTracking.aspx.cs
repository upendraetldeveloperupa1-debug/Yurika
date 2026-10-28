using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;

namespace WebKiu
{
    public partial class OrderTracking : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        Class1 obj = new Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtOrderId.Text))
            {
                lblMessage.Text = "Please enter Order ID.";
                return;
            }

            int orderId;

            if (!int.TryParse(txtOrderId.Text, out orderId))
            {
                lblMessage.Text = "Please enter a valid Order ID.";
                return;
            }

            GetTracking(orderId);
        }
        private void GetTracking(int orderId)
        {
            DataTable dt = new DataTable();

            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_GetOrderTracking", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@OrderId", orderId);

                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    da.Fill(dt);
                }
            }

            if (dt.Rows.Count > 0)
            {
                rptTracking.DataSource = dt;
                rptTracking.DataBind();

                lblMessage.Text = "";
            }
            else
            {
                rptTracking.DataSource = null;
                rptTracking.DataBind();

                lblMessage.Text = "Order tracking information not found.";
            }
        }
    }
}