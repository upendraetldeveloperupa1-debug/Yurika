using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DAL;
using System.Configuration;

namespace WebKiu
{
    public partial class Orders : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            DataTable dt = new DataTable();

            using (SqlConnection con =
                new SqlConnection(cs))
            {
                using (SqlCommand cmd =
                    new SqlCommand("sp_GetOrders", con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    SqlDataAdapter da =
                        new SqlDataAdapter(cmd);

                    da.Fill(dt);
                }
            }

            gvOrders.DataSource = dt;
            gvOrders.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int orderId = Convert.ToInt32(
        ((Button)sender).CommandArgument);

            GridViewRow row =
                (GridViewRow)((Button)sender).NamingContainer;

            DropDownList ddl =
                (DropDownList)row.FindControl("ddlStatus");

            string status = ddl.SelectedValue;

            UpdateOrderStatus(orderId, status);

            LoadOrders();

            lblMessage.Text =
                "Order status updated successfully.";
        }
        protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int orderId =
                    Convert.ToInt32(e.CommandArgument);

                GridViewRow row =
                    (GridViewRow)((Button)e.CommandSource)
                    .NamingContainer;

                DropDownList ddl =
                    (DropDownList)row.FindControl("ddlStatus");

                string status =
                    ddl.SelectedValue;

                UpdateOrderStatus(orderId, status);

                lblMessage.Text =
                    "Order status updated successfully.";

                LoadOrders();
            }
        }
        private void UpdateOrderStatus(
            int orderId,
            string status)
        {
            using (SqlConnection con =
                new SqlConnection(cs))
            {
                using (SqlCommand cmd =
                    new SqlCommand(
                        "sp_UpdateOrderStatus",
                        con))
                {
                    cmd.CommandType =
                        CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue(
                        "@OrderId",
                        orderId);

                    cmd.Parameters.AddWithValue(
                        "@OrderStatus",
                        status);

                    con.Open();

                    cmd.ExecuteNonQuery();
                }
            }
        }

       
    }
}