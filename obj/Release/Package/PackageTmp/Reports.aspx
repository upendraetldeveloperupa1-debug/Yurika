<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="WebKiu.Reports" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Reports - WebKiu</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>

        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .page-header {
            background: #212529;
            color: white;
            padding: 20px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .page-header h2 {
            margin: 0;
            font-weight: 600;
        }

        .filter-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,.08);
            margin-bottom: 25px;
        }

        .report-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,.08);
            height: 100%;
        }

        .report-card h5 {
            font-weight: 600;
            margin-bottom: 18px;
        }

        .summary-card {
            color: white;
            border-radius: 12px;
            padding: 20px;
            min-height: 120px;
            box-shadow: 0 3px 12px rgba(0,0,0,.08);
        }

        .summary-card h6 {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .summary-card h3 {
            font-weight: bold;
            margin: 0;
        }

        .summary-orders {
            background: #0d6efd;
        }

        .summary-sales {
            background: #198754;
        }

        .summary-delivered {
            background: #6f42c1;
        }

        .summary-pending {
            background: #fd7e14;
        }

        .table thead {
            background: #212529;
            color: white;
        }

        .table {
            margin-bottom: 0;
        }

        .section-title {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .message {
            font-weight: 600;
            margin-bottom: 15px;
        }

        @media print {

            .no-print {
                display: none !important;
            }

            body {
                background: white;
            }

            .report-card,
            .filter-card {
                box-shadow: none;
            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container-fluid p-4">

    <!-- HEADER -->

    <div class="page-header">

        <div class="d-flex justify-content-between align-items-center">

            <div>
                <h2>📊 Reports</h2>
                <small>WebKiu Shopping Management</small>
            </div>

            <div class="no-print">

                <button type="button"
                        class="btn btn-light" onclick="window.print();">
                    🖨 Print
                </button>

            </div>

        </div>

    </div>


    <!-- FILTER -->

    <div class="filter-card no-print">

        <div class="row g-3 align-items-end">

            <div class="col-md-4">

                <label class="form-label">
                    From Date
                </label>

                <asp:TextBox
                    ID="txtFromDate"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Date">
                </asp:TextBox>

            </div>


            <div class="col-md-4">

                <label class="form-label">
                    To Date
                </label>

                <asp:TextBox
                    ID="txtToDate"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Date">
                </asp:TextBox>

            </div>


            <div class="col-md-4">

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="🔍 Generate Report"
                    CssClass="btn btn-primary w-100" OnClick="btnSearch_Click" />

            </div>

        </div>

        <br />

        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="message">
        </asp:Label>

    </div>


    <!-- SUMMARY -->

    <div class="row g-4 mb-4">

        <div class="col-md-3">

            <div class="summary-card summary-orders">

                <h6>Total Orders</h6>

                <h3>
                    <asp:Label
                        ID="lblTotalOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </h3>

            </div>

        </div>


        <div class="col-md-3">

            <div class="summary-card summary-sales">

                <h6>Total Sales</h6>

                <h3>
                    ₹
                    <asp:Label
                        ID="lblTotalSales"
                        runat="server"
                        Text="0.00">
                    </asp:Label>
                </h3>

            </div>

        </div>


        <div class="col-md-3">

            <div class="summary-card summary-delivered">

                <h6>Delivered Orders</h6>

                <h3>
                    <asp:Label
                        ID="lblDeliveredOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </h3>

            </div>

        </div>


        <div class="col-md-3">

            <div class="summary-card summary-pending">

                <h6>Pending Orders</h6>

                <h3>
                    <asp:Label
                        ID="lblPendingOrders"
                        runat="server"
                        Text="0">
                    </asp:Label>
                </h3>

            </div>

        </div>

    </div>


    <!-- ORDER REPORT -->

    <div class="report-card mb-4">

        <div class="section-title">

            <h5>📦 Order Report</h5>

        </div>

        <div class="table-responsive">

            <asp:GridView
                ID="gvOrders"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover">

                <Columns>

                    <asp:BoundField
                        DataField="OrderId"
                        HeaderText="Order ID" />

                    <asp:BoundField
                        DataField="CustomerName"
                        HeaderText="Customer" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="OrderDate"
                        HeaderText="Order Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:BoundField
                        DataField="TotalAmount"
                        HeaderText="Amount"
                        DataFormatString="₹ {0:N2}" />

                    <asp:BoundField
                        DataField="OrderStatus"
                        HeaderText="Order Status" />

                    <asp:BoundField
                        DataField="PaymentStatus"
                        HeaderText="Payment Status" />

                    <asp:BoundField
                        DataField="PaymentMethod"
                        HeaderText="Payment Method" />

                </Columns>

            </asp:GridView>

        </div>

    </div>


    <!-- PRODUCT SALES -->

    <div class="report-card mb-4">

        <div class="section-title">

            <h5>🛍 Product Sales Report</h5>

        </div>

        <div class="table-responsive">

            <asp:GridView
                ID="gvProductSales"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover">

                <Columns>

                    <asp:BoundField
                        DataField="ProductId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="ProductName"
                        HeaderText="Product" />

                    <asp:BoundField
                        DataField="CategoryName"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="BrandName"
                        HeaderText="Brand" />

                    <asp:BoundField
                        DataField="TotalQuantity"
                        HeaderText="Quantity" />

                    <asp:BoundField
                        DataField="TotalSales"
                        HeaderText="Total Sales"
                        DataFormatString="₹ {0:N2}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>


    <!-- CATEGORY SALES -->

    <div class="report-card mb-4">

        <div class="section-title">

            <h5>📁 Category Sales Report</h5>

        </div>

        <div class="table-responsive">

            <asp:GridView
                ID="gvCategorySales"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover">

                <Columns>

                    <asp:BoundField
                        DataField="CategoryId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="CategoryName"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="TotalQuantity"
                        HeaderText="Quantity Sold" />

                    <asp:BoundField
                        DataField="TotalSales"
                        HeaderText="Sales"
                        DataFormatString="₹ {0:N2}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>


    <!-- CUSTOMER SALES -->

    <div class="report-card mb-4">

        <div class="section-title">

            <h5>👥 Customer Sales Report</h5>

        </div>

        <div class="table-responsive">

            <asp:GridView
                ID="gvCustomerSales"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover">

                <Columns>

                    <asp:BoundField
                        DataField="UserId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Customer" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="Mobile"
                        HeaderText="Mobile" />

                    <asp:BoundField
                        DataField="TotalOrders"
                        HeaderText="Orders" />

                    <asp:BoundField
                        DataField="TotalPurchase"
                        HeaderText="Total Purchase"
                        DataFormatString="₹ {0:N2}" />

                </Columns>

            </asp:GridView>

        </div>

    </div>


    <!-- STOCK REPORT -->

    <div class="report-card mb-4">

        <div class="section-title">

            <h5>📦 Stock Report</h5>

        </div>

        <div class="table-responsive">

            <asp:GridView
                ID="gvStock"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover">

                <Columns>

                    <asp:BoundField
                        DataField="ProductId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="ProductName"
                        HeaderText="Product" />

                    <asp:BoundField
                        DataField="CategoryName"
                        HeaderText="Category" />

                    <asp:BoundField
                        DataField="BrandName"
                        HeaderText="Brand" />

                    <asp:BoundField
                        DataField="Price"
                        HeaderText="Price"
                        DataFormatString="₹ {0:N2}" />

                    <asp:BoundField
                        DataField="Stock"
                        HeaderText="Stock" />

                    <asp:BoundField
                        DataField="StockStatus"
                        HeaderText="Status" />

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</form>

</body>

</html>
