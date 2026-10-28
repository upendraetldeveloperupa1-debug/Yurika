<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="WebKiu.OrderHistory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>My Orders - WebKiu</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>

        body {
            background: #f5f6f8;
            font-family: Arial, sans-serif;
        }

        .page-title {
            font-weight: 700;
            color: #222;
        }

        .order-card {
            background: white;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,.08);
        }

        .order-header {
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 15px;
        }

        .order-id {
            font-size: 18px;
            font-weight: 700;
        }

        .amount {
            font-size: 20px;
            font-weight: 700;
        }

        .status {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 13px;
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

        .empty-box {
            background: white;
            border-radius: 12px;
            padding: 50px;
            text-align: center;
            box-shadow: 0 3px 12px rgba(0,0,0,.06);
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="container py-5">

        <div class="d-flex justify-content-between align-items-center mb-4">

            <div>
                <h2 class="page-title mb-1">
                    My Orders
                </h2>

                <p class="text-muted mb-0">
                    View your previous orders and order details
                </p>
            </div>

            <a href="Home.aspx"
               class="btn btn-outline-dark">
                Continue Shopping
            </a>

        </div>


        <asp:Label ID="lblMessage"
            runat="server"
            CssClass="text-danger">
        </asp:Label>


        <asp:Panel ID="pnlNoOrders"
            runat="server"
            Visible="false">

            <div class="empty-box">

                <h4>No Orders Found</h4>

                <p class="text-muted">
                    You haven't placed any orders yet.
                </p>

                <a href="ProductListing.aspx"
                   class="btn btn-dark">
                    Start Shopping
                </a>

            </div>

        </asp:Panel>


        <asp:Repeater ID="rptOrders"
            runat="server"
            OnItemCommand="rptOrders_ItemCommand">

            <ItemTemplate>

                <div class="order-card">

                    <div class="order-header">

                        <div class="row align-items-center">

                            <div class="col-md-4">

                                <div class="order-id">
                                    Order #<%# Eval("OrderId") %>
                                </div>

                                <small class="text-muted">
                                    <%# Eval("OrderDate", "{0:dd MMM yyyy, hh:mm tt}") %>
                                </small>

                            </div>


                            <div class="col-md-3">

                                <small class="text-muted d-block">
                                    Payment
                                </small>

                                <strong>
                                    <%# Eval("PaymentMethod") %>
                                </strong>

                            </div>


                            <div class="col-md-2">

                                <small class="text-muted d-block">
                                    Payment Status
                                </small>

                                <strong>
                                    <%# Eval("PaymentStatus") %>
                                </strong>

                            </div>


                            <div class="col-md-3 text-md-end">

                                <div class="amount">
                                    ₹ <%# Eval("TotalAmount", "{0:N2}") %>
                                </div>

                                <span class='status <%#GetStatusClass(Eval("OrderStatus")) %>'>
                                    <%# Eval("OrderStatus") %>
                                </span>

                            </div>

                        </div>

                    </div>


                    <div class="row">

                        <div class="col-md-8">

                            <small class="text-muted">
                                Delivery Address
                            </small>

                            <div class="mt-1">

                                <%# Eval("ShippingName") %><br />

                                <%# Eval("ShippingAddress") %><br />

                                <%# Eval("ShippingCity") %>,
                                <%# Eval("ShippingState") %>
                                -
                                <%# Eval("ShippingPincode") %><br />

                                Mobile:
                                <%# Eval("ShippingMobile") %>

                            </div>

                        </div>


                        <div class="col-md-4 text-md-end mt-3 mt-md-0">

                            <asp:LinkButton ID="btnViewDetails"
                                runat="server"
                                CssClass="btn btn-dark"
                                CommandName="ViewDetails"
                                CommandArgument='<%# Eval("OrderId") %>'>

                                View Order Details

                            </asp:LinkButton>

                        </div>

                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</form>

</body>
</html>
