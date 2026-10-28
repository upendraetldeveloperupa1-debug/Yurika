<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="WebKiu.Orders" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Order Management</title>

    <style>

        body {
            font-family: Arial;
            background: #f5f6fa;
            margin: 0;
        }

        .container {
            width: 95%;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
        }

        h2 {
            margin-bottom: 25px;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th {
            background: #111827;
            color: white;
            padding: 12px;
        }

        .grid td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        .status {
            padding: 8px;
            border-radius: 5px;
        }

        .btn {
            background: #111827;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <div class="card">

        <h2>Order Management</h2>

        <asp:GridView
            ID="gvOrders"
            runat="server"
            AutoGenerateColumns="False"
            CssClass="grid"
            DataKeyNames="OrderId" OnRowCommand="gvOrders_RowCommand">

            <Columns>

                <asp:BoundField
                    DataField="OrderId"
                    HeaderText="Order ID" />

                <asp:BoundField
                    DataField="ShippingName"
                    HeaderText="Customer" />

                <asp:BoundField
                    DataField="ShippingMobile"
                    HeaderText="Mobile" />

                <asp:BoundField
                    DataField="TotalAmount"
                    HeaderText="Amount" />

                <asp:BoundField
                    DataField="OrderDate"
                    HeaderText="Order Date" />

                <asp:TemplateField HeaderText="Status">

                    <ItemTemplate>

                        <asp:DropDownList
                            ID="ddlStatus"
                            runat="server"
                            CssClass="status"
                            SelectedValue='<%# Eval("OrderStatus") %>'>

                            <asp:ListItem>
                                Order Placed
                            </asp:ListItem>

                            <asp:ListItem>
                                Confirmed
                            </asp:ListItem>

                            <asp:ListItem>
                                Packed
                            </asp:ListItem>

                            <asp:ListItem>
                                Shipped
                            </asp:ListItem>

                            <asp:ListItem>
                                Out for Delivery
                            </asp:ListItem>

                            <asp:ListItem>
                                Delivered
                            </asp:ListItem>

                            <asp:ListItem>
                                Cancelled
                            </asp:ListItem>

                        </asp:DropDownList>

                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>

                        <asp:Button
                            ID="btnUpdate"
                            runat="server"
                            Text="Update"
                            CssClass="btn"
                            CommandName="UpdateStatus"
                            CommandArgument='<%# Eval("OrderId") %>'  OnClick="btnUpdate_Click"/>
                        

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <br />

        <asp:Label
            ID="lblMessage"
            runat="server">
        </asp:Label>

    </div>

</div>

</form>

</body>
</html>
