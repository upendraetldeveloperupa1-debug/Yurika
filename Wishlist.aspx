<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WebKiu.Wishlist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Wishlist - WebKiu</title>

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

        .wishlist-container {
            margin-top: 40px;
            margin-bottom: 50px;
        }

        .wishlist-box {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,.08);
        }

        .wishlist-title {
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 30px;
        }

        .product-card {
            border: 1px solid #eee;
            border-radius: 12px;
            overflow: hidden;
            background: white;
            height: 100%;
            transition: .2s;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 8px 25px rgba(0,0,0,.1);
        }

        .product-image {
            width: 100%;
            height: 230px;
            object-fit: contain;
            background: #f8f8f8;
            padding: 15px;
        }

        .product-body {
            padding: 18px;
        }

        .brand {
            font-size: 13px;
            color: #777;
            font-weight: bold;
            text-transform: uppercase;
        }

        .product-name {
            font-size: 18px;
            font-weight: bold;
            margin-top: 6px;
        }

        .category {
            color: #777;
            font-size: 14px;
            margin-top: 5px;
        }

        .price {
            color: #e63946;
            font-size: 22px;
            font-weight: bold;
            margin: 12px 0;
        }

        .empty-wishlist {
            text-align: center;
            padding: 80px 20px;
        }

        .heart {
            font-size: 55px;
            color: #dc3545;
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
                    🛒 Cart
                </a>

            </div>

        </div>

    </nav>


    <!-- WISHLIST -->

    <div class="container wishlist-container">

        <div class="wishlist-box">

            <div class="wishlist-title">

                ♥ My Wishlist

            </div>


            <asp:Label
                ID="lblMessage"
                runat="server"
                CssClass="d-block mb-3">
            </asp:Label>


            <asp:Panel
                ID="pnlWishlist"
                runat="server">

                <div class="row g-4">

                    <asp:Repeater
                        ID="rptWishlist"
                        runat="server"
                        OnItemCommand="rptWishlist_ItemCommand">

                        <ItemTemplate>

                            <div class="col-xl-3
                                        col-lg-4
                                        col-md-6">

                                <div class="product-card">

                                    <img
                                        src='<%#GetImageUrl(Eval("ProductImage")) %>'
                                        class="product-image"
                                        alt="Product" />


                                    <div class="product-body">

                                        <div class="brand">

                                            <%# Eval("BrandName") %>

                                        </div>


                                        <div class="product-name">

                                            <%# Eval("ProductName") %>

                                        </div>


                                        <div class="category">

                                            <%# Eval("CategoryName") %>

                                        </div>


                                        <div class="price">

                                            ₹<%# Eval(
                                                "Price",
                                                "{0:N2}") %>

                                        </div>


                                        <!-- STOCK -->

                                        <div class="mb-3">

                                            <%# Convert.ToInt32(
                                                Eval("Stock")) > 0

                                                ? "<span class='text-success'>✓ In Stock</span>"

                                                : "<span class='text-danger'>✕ Out of Stock</span>" %>

                                        </div>


                                        <!-- BUTTONS -->

                                        <div class="d-grid gap-2">

                                            <asp:Button
                                                ID="btnCart"
                                                runat="server"
                                                Text="🛒 Add to Cart"
                                                CommandName="AddCart"
                                                CommandArgument='<%# Eval("ProductId") %>'
                                                CssClass="btn btn-dark"
                                                Enabled='<%# Convert.ToInt32(Eval("Stock")) > 0 %>' />


                                            <asp:Button
                                                ID="btnRemove"
                                                runat="server"
                                                Text="♥ Remove"
                                                CommandName="RemoveWishlist"
                                                CommandArgument='<%# Eval("WishlistId") %>'
                                                CssClass="btn btn-outline-danger" />

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </ItemTemplate>

                    </asp:Repeater>

                </div>

            </asp:Panel>


            <!-- EMPTY -->

            <asp:Panel
                ID="pnlEmpty"
                runat="server"
                Visible="false">

                <div class="empty-wishlist">

                    <div class="heart">
                        ♡
                    </div>

                    <h2>
                        Your Wishlist is Empty
                    </h2>

                    <p class="text-muted">
                        Save products you love here.
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
