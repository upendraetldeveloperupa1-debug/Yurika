<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebKiu.Checkout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Checkout - WebKiu</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        body {
            background: #f5f6f8;
            font-family: Arial, sans-serif;
        }

        .navbar {
            background: #111827;
        }

        .navbar-brand {
            color: white !important;
            font-size: 25px;
            font-weight: bold;
        }

        .nav-link {
            color: white !important;
        }

        .checkout-container {
            margin-top: 40px;
            margin-bottom: 50px;
        }

        .checkout-box {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 5px 25px rgba(0,0,0,.08);
        }

        .section-title {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .form-label {
            font-weight: 600;
        }

        .summary-box {
            background: #f8f9fa;
            padding: 25px;
            border-radius: 12px;
        }

        .grand-total {
            font-size: 25px;
            font-weight: bold;
        }

        .place-order {
            width: 100%;
            background: #111827;
            color: white;
            border: none;
            padding: 14px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 16px;
        }

        .place-order:hover {
            background: #000;
            color: white;
        }

        .message {
            font-weight: bold;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- NAVBAR -->

    <nav class="navbar">

        <div class="container">

            <a class="navbar-brand"
               href="Default.aspx">

                WebKiu

            </a>

            <div>

                <a href="Default.aspx"
                   class="nav-link d-inline-block">
                    Home
                </a>

                <a href="ProductListing.aspx"
                   class="nav-link d-inline-block">
                    Products
                </a>

                <a href="Cart.aspx"
                   class="nav-link d-inline-block">
                    Cart
                </a>

            </div>

        </div>

    </nav>


    <!-- CHECKOUT -->

    <div class="container checkout-container">

        <div class="row g-4">

            <!-- SHIPPING DETAILS -->

            <div class="col-lg-7">

                <div class="checkout-box">

                    <div class="section-title">
                        📦 Shipping Information
                    </div>


                    <div class="mb-3">

                        <label class="form-label">
                            Full Name
                        </label>

                        <asp:TextBox
                            ID="txtShippingName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter full name">
                        </asp:TextBox>

                    </div>


                    <div class="mb-3">

                        <label class="form-label">
                            Mobile Number
                        </label>

                        <asp:TextBox
                            ID="txtShippingMobile"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter mobile number">
                        </asp:TextBox>

                    </div>


                    <div class="mb-3">

                        <label class="form-label">
                            Address
                        </label>

                        <asp:TextBox
                            ID="txtShippingAddress"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="3"
                            placeholder="House number, street, area">
                        </asp:TextBox>

                    </div>


                    <div class="row">

                        <div class="col-md-4 mb-3">

                            <label class="form-label">
                                City
                            </label>

                            <asp:TextBox
                                ID="txtCity"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>


                        <div class="col-md-4 mb-3">

                            <label class="form-label">
                                State
                            </label>

                            <asp:TextBox
                                ID="txtState"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>


                        <div class="col-md-4 mb-3">

                            <label class="form-label">
                                Pincode
                            </label>

                            <asp:TextBox
                                ID="txtPincode"
                                runat="server"
                                CssClass="form-control">
                            </asp:TextBox>

                        </div>

                    </div>


                    <div class="section-title mt-4">
                        💳 Payment Method
                    </div>


                    <asp:RadioButtonList
                        ID="rblPaymentMethod"
                        runat="server"
                        CssClass="mb-3">

                        <asp:ListItem
                            Text="Cash on Delivery"
                            Value="COD"
                            Selected="True" />

                        <asp:ListItem
                            Text="Online Payment"
                            Value="Online" />

                    </asp:RadioButtonList>


                    <asp:Label
                        ID="lblMessage"
                        runat="server"
                        CssClass="message d-block mb-3">
                    </asp:Label>


                    <asp:Button
                        ID="btnPlaceOrder"
                        runat="server"
                        Text="Place Order"
                        CssClass="place-order" OnClick="btnPlaceOrder_Click"/>

                </div>

            </div>


            <!-- ORDER SUMMARY -->

            <div class="col-lg-5">

                <div class="checkout-box">

                    <div class="section-title">
                        🛒 Order Summary
                    </div>


                    <asp:GridView
                        ID="gvSummary"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-sm">

                        <Columns>

                            <asp:BoundField
                                DataField="ProductName"
                                HeaderText="Product" />

                            <asp:BoundField
                                DataField="Quantity"
                                HeaderText="Qty" />

                            <asp:BoundField
                                DataField="TotalPrice"
                                HeaderText="Total"
                                DataFormatString="₹{0:N2}" />

                        </Columns>

                    </asp:GridView>


                    <div class="summary-box mt-3">

                        <div class="d-flex
                                    justify-content-between">

                            <span>
                                Total Amount
                            </span>

                            <asp:Label
                                ID="lblTotalAmount"
                                runat="server"
                                CssClass="grand-total">
                            </asp:Label>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</form>

</body>

</html>
