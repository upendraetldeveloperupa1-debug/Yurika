<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebKiu.Cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Cart - WebKiu</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        body {
            background: #f6f7f9;
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

        .cart-container {
            margin-top: 40px;
            margin-bottom: 50px;
        }

        .cart-box {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,.08);
        }

        .cart-title {
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .product-image {
            width: 80px;
            height: 80px;
            object-fit: contain;
            border-radius: 8px;
            background: #f5f5f5;
            padding: 5px;
        }

        .product-name {
            font-weight: bold;
        }

        .price {
            font-weight: bold;
        }

        .total-box {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
        }

        .grand-total {
            font-size: 25px;
            font-weight: bold;
        }

        .checkout-btn {
            width: 100%;
            background: #111827;
            color: white;
            border: none;
            padding: 13px;
            border-radius: 8px;
            font-weight: bold;
        }

        .checkout-btn:hover {
            background: #000;
            color: white;
        }

        .empty-cart {
            text-align: center;
            padding: 70px 20px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- NAVBAR -->

    <nav class="navbar navbar-expand-lg">

        <div class="container">

            <a class="navbar-brand"
               href="Default.aspx">
                WebKiu
            </a>

            <div class="ms-auto">

                <a href="Default.aspx"
                   class="nav-link d-inline-block">
                    Home
                </a>

                <a href="ProductListing.aspx"
                   class="nav-link d-inline-block">
                    Products
                </a>

            </div>

        </div>

    </nav>


    <div class="container cart-container">

        <div class="cart-box">

            <div class="cart-title">
                🛒 My Shopping Cart
            </div>


            <asp:Label ID="lblMessage"
                       runat="server"
                       CssClass="mb-3 d-block">
            </asp:Label>


            <asp:Panel ID="pnlCart"
                         runat="server">

                <div class="table-responsive">

                    <asp:GridView ID="gvCart"
                                  runat="server"
                                  AutoGenerateColumns="False"
                                  CssClass="table align-middle" OnRowCommand="gvCart_RowCommand">

                        <Columns>

                            <asp:BoundField
                                DataField="CartId"
                                HeaderText="Cart ID"
                                Visible="false" />

                            <asp:TemplateField
                                HeaderText="Product">

                                <ItemTemplate>

                                    <div class="d-flex align-items-center">

                                        <img src='<%#GetImageUrl(Eval("ProductImage")) %>'
                                             class="product-image me-3" />

                                        <span class="product-name">
                                            <%# Eval("ProductName") %>
                                        </span>

                                    </div>

                                </ItemTemplate>

                            </asp:TemplateField>


                            <asp:BoundField
                                DataField="Price"
                                HeaderText="Price"
                                DataFormatString="₹{0:N2}" />


                            <asp:TemplateField
                                HeaderText="Quantity">

                                <ItemTemplate>

                                    <asp:TextBox
                                        ID="txtQuantity"
                                        runat="server"
                                        Text='<%# Eval("Quantity") %>'
                                        TextMode="Number"
                                        CssClass="form-control"
                                        style="width:80px;">
                                    </asp:TextBox>

                                </ItemTemplate>

                            </asp:TemplateField>


                            <asp:BoundField
                                DataField="TotalPrice"
                                HeaderText="Total"
                                DataFormatString="₹{0:N2}" />


                            <asp:TemplateField
                                HeaderText="Action">

                                <ItemTemplate>

                                    <asp:Button
                                        ID="btnUpdate"
                                        runat="server"
                                        Text="Update"
                                        CommandName="UpdateCart"
                                        CommandArgument='<%# Eval("CartId") %>'
                                        CssClass="btn btn-sm btn-primary me-1" />


                                    <asp:Button
                                        ID="btnRemove"
                                        runat="server"
                                        Text="Remove"
                                        CommandName="RemoveCart"
                                        CommandArgument='<%# Eval("CartId") %>'
                                        CssClass="btn btn-sm btn-danger" />

                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>


                <div class="row justify-content-end">

                    <div class="col-md-5">

                        <div class="total-box">

                            <h5>
                                Cart Summary
                            </h5>

                            <hr />

                            <div class="d-flex justify-content-between">

                                <span>
                                    Total
                                </span>

                                <asp:Label
                                    ID="lblGrandTotal"
                                    runat="server"
                                    CssClass="grand-total">
                                </asp:Label>

                            </div>


                            <div class="mt-4">

                                <asp:Button
                                    ID="btnCheckout"
                                    runat="server"
                                    Text="Proceed to Checkout →"
                                    CssClass="checkout-btn"
                                     OnClick="btnCheckout_Click" />

                            </div>

                        </div>

                    </div>

                </div>

            </asp:Panel>


            <asp:Panel ID="pnlEmpty"
                         runat="server"
                         Visible="false">

                <div class="empty-cart">

                    <h2>
                        🛒 Your Cart is Empty
                    </h2>

                    <p class="text-muted">
                        Add some products to your cart.
                    </p>

                    <a href="ProductListing.aspx"
                       class="btn btn-dark">
                        Continue Shopping
                    </a>

                </div>

            </asp:Panel>

        </div>

    </div>

</form>

</body>
</html>
