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
    public partial class Reports : System.Web.UI.Page
    {
        Class1 obj = new Class1();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Admin security
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (Session["UserRole"] == null ||
                Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                txtFromDate.Text =
                    DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");

                txtToDate.Text =
                    DateTime.Now.ToString("yyyy-MM-dd");

                LoadReports();
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadReports();
        }
        private void LoadReports()
        {
            try
            {
                DateTime fromDate;
                DateTime toDate;

                if (!DateTime.TryParse(
                    txtFromDate.Text,
                    out fromDate))
                {
                    ShowMessage(
                        "Please select From Date.",
                        Color.Red);

                    return;
                }


                if (!DateTime.TryParse(
                    txtToDate.Text,
                    out toDate))
                {
                    ShowMessage(
                        "Please select To Date.",
                        Color.Red);

                    return;
                }


                if (fromDate > toDate)
                {
                    ShowMessage(
                        "From Date cannot be greater than To Date.",
                        Color.Red);

                    return;
                }


                LoadSalesSummary(fromDate, toDate);

                LoadOrders(fromDate, toDate);

                LoadProductSales(fromDate, toDate);

                LoadCategorySales(fromDate, toDate);

                LoadCustomerSales(fromDate, toDate);

                LoadStock();

                ShowMessage(
                    "Reports generated successfully.",
                    Color.Green);
            }
            catch (Exception ex)
            {
                ShowMessage(
                    "Error loading reports: " + ex.Message,
                    Color.Red);
            }
        }


        // ================================
        // SALES SUMMARY
        // ================================

        private void LoadSalesSummary(
            DateTime fromDate,
            DateTime toDate)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@FromDate",
                    fromDate.Date),

                new SqlParameter(
                    "@ToDate",
                    toDate.Date)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_ReportSalesSummary",
                    param);


            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];


                lblTotalOrders.Text =
                    row["TotalOrders"].ToString();


                lblTotalSales.Text =
                    Convert.ToDecimal(
                        row["TotalSales"])
                    .ToString("N2");


                lblDeliveredOrders.Text =
                    row["DeliveredOrders"].ToString();


                lblPendingOrders.Text =
                    row["PendingOrders"].ToString();
            }
            else
            {
                lblTotalOrders.Text = "0";
                lblTotalSales.Text = "0.00";
                lblDeliveredOrders.Text = "0";
                lblPendingOrders.Text = "0";
            }
        }


        // ================================
        // ORDER REPORT
        // ================================

        private void LoadOrders(
            DateTime fromDate,
            DateTime toDate)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@FromDate",
                    fromDate.Date),

                new SqlParameter(
                    "@ToDate",
                    toDate.Date)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_ReportOrders",
                    param);


            gvOrders.DataSource = dt;
            gvOrders.DataBind();
        }


        // ================================
        // PRODUCT SALES
        // ================================

        private void LoadProductSales(
            DateTime fromDate,
            DateTime toDate)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@FromDate",
                    fromDate.Date),

                new SqlParameter(
                    "@ToDate",
                    toDate.Date)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_ReportProductSales",
                    param);


            gvProductSales.DataSource = dt;
            gvProductSales.DataBind();
        }


        // ================================
        // CATEGORY SALES
        // ================================

        private void LoadCategorySales(
            DateTime fromDate,
            DateTime toDate)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@FromDate",
                    fromDate.Date),

                new SqlParameter(
                    "@ToDate",
                    toDate.Date)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_ReportCategorySales",
                    param);


            gvCategorySales.DataSource = dt;
            gvCategorySales.DataBind();
        }


        // ================================
        // CUSTOMER SALES
        // ================================

        private void LoadCustomerSales(
            DateTime fromDate,
            DateTime toDate)
        {
            SqlParameter[] param =
            {
                new SqlParameter(
                    "@FromDate",
                    fromDate.Date),

                new SqlParameter(
                    "@ToDate",
                    toDate.Date)
            };


            DataTable dt =
                obj.GetOne(
                    "sp_ReportCustomerSales",
                    param);


            gvCustomerSales.DataSource = dt;
            gvCustomerSales.DataBind();
        }


        // ================================
        // STOCK REPORT
        // ================================

        private void LoadStock()
        {
            DataTable dt =
                obj.Get("sp_ReportStock");


            gvStock.DataSource = dt;
            gvStock.DataBind();
        }


        // ================================
        // MESSAGE
        // ================================

        private void ShowMessage(string message,Color color)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = color;
        }
    }
}