<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderManagement.aspx.cs" Inherits="WebKiu.OrderManagement" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Order Management - WebKiu</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .page-header {
            background: #212529;
            color: white;
            padding: 25px;
            border-radius: 15px;
            margin-bottom: 25px;
        }

        .page-header h2 {
            margin: 0;
            font-weight: 700;
        }

        .order-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 18px rgba(0,0,0,.07);
        }

        .table {
            vertical-align: middle;
        }

        .table thead {
            background: #212529;
            color: white;
        }

        .table thead th {
            padding: 14px;
        }

        .table tbody td {
            padding: 12px;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .pending {
            background: #fff3cd;
            color: #856404;
        }

        .confirmed {
            background: #cff4fc;
            color: #055160;
        }

        .shipped {
            background: #cfe2ff;
            color: #084298;
        }

        .delivered {
            background: #d1e7dd;
            color: #0f5132;
        }

        .cancelled {
            background: #f8d7da;
            color: #842029;
        }

        .amount {
            font-weight: 700;
        }

        .search-box {
            max-width: 300px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container-fluid p-4">

    <!-- HEADER -->

    <div class="page-header">

        <div class="d-flex justify-content-between
                    align-items-center">

            <div>

                <h2>Order Management</h2>

                <p class="mb-0 mt-2">
                    Manage customer orders and order status
                </p>

            </div>

            <div>
                <a href="AdminDashboard.aspx"
                   class="btn btn-light">
                    Dashboard
                </a>
            </div>

        </div>

    </div>


    <!-- MESSAGE -->

    <asp:Label ID="lblMessage"
        runat="server"
        CssClass="d-block fw-bold mb-3">
    </asp:Label>


    <!-- ORDERS -->

    <div class="order-card">

        <div class="d-flex justify-content-between
                    align-items-center mb-3">

            <h5 class="mb-0">
                Customer Orders
            </h5>

            <asp:TextBox ID="txtSearch"
                runat="server"
                CssClass="form-control search-box"
                placeholder="Search Order ID..."
                AutoPostBack="true" OnTextChanged="txtSearch_TextChanged">
            </asp:TextBox>

        </div>


        <div class="table-responsive">

            <asp:GridView ID="gvOrder"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover" OnRowCommand="gvOrder_RowCommand"
                EmptyDataText="No orders found.">

                <Columns>

                    <asp:BoundField
                        DataField="OrderId"
                        HeaderText="Order ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Customer" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="OrderDate"
                        HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy}" />

                    <asp:TemplateField
                        HeaderText="Amount">

                        <ItemTemplate>

                            <span class="amount">

                                ₹ <%# Eval("TotalAmount", "{0:N2}") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                    <asp:BoundField
                        DataField="PaymentMethod"
                        HeaderText="Payment" />


                    

                    <asp:TemplateField
                        HeaderText="Order Status">

                        <ItemTemplate>

                            <asp:DropDownList
                                ID="ddlStatus"
                                runat="server"
                                CssClass="form-select form-select-sm"
                                SelectedValue='<%# Eval("OrderStatus") %>'>

                                <asp:ListItem
                                    Text="Pending"
                                    Value="Pending" />

                                <asp:ListItem
                                    Text="Confirmed"
                                    Value="Confirmed" />

                                <asp:ListItem
                                    Text="Packed"
                                    Value="Packed" />

                                <asp:ListItem
                                    Text="Shipped"
                                    Value="Shipped" />

                                <asp:ListItem
                                    Text="Delivered"
                                    Value="Delivered" />

                                <asp:ListItem
                                    Text="Cancelled"
                                    Value="Cancelled" />

                            </asp:DropDownList>

                        </ItemTemplate>

                    </asp:TemplateField>


                    

                    <asp:TemplateField
                        HeaderText="Payment Status">

                        <ItemTemplate>

                            <span class="status">

                                <%# Eval("PaymentStatus") %>

                            </span>

                        </ItemTemplate>

                    </asp:TemplateField>


                    

                    <asp:TemplateField
                        HeaderText="Action">

                        <ItemTemplate>

                            <asp:Button
                                ID="btnUpdate"
                                runat="server"
                                Text="Update"
                                CssClass="btn btn-sm btn-primary me-1"
                                CommandName="UpdateStatus"
                                CommandArgument='<%# Eval("OrderId") %>' />

                            <asp:Button
                                ID="btnView"
                                runat="server"
                                Text="View"
                                CssClass="btn btn-sm btn-dark"
                                CommandName="ViewOrder"
                                CommandArgument='<%# Eval("OrderId") %>' />

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</form>

</body>
</html>
