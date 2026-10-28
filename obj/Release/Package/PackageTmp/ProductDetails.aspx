<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="WebKiu.ProductDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Product Details - WebKiu</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        body {
            background: #f7f7f7;
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

        .product-container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            margin-top: 40px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.08);
        }

        .main-image {
            width: 100%;
            height: 450px;
            object-fit: contain;
            border-radius: 12px;
            background: #f8f8f8;
            padding: 20px;
        }

        .thumbnail {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid #ddd;
            padding: 4px;
            margin-right: 8px;
            cursor: pointer;
        }

        .thumbnail:hover {
            border-color: #111827;
        }

        .brand {
            color: #777;
            font-size: 14px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .product-name {
            font-size: 34px;
            font-weight: bold;
            margin-top: 10px;
        }

        .category {
            color: #777;
            margin-top: 10px;
        }

        .price {
            color: #e63946;
            font-size: 30px;
            font-weight: bold;
            margin: 20px 0;
        }

        .description {
            color: #555;
            line-height: 1.7;
        }

        .stock {
            margin-top: 15px;
            font-weight: bold;
        }

        .quantity-box {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 25px;
        }

        .quantity-input {
            width: 80px;
            text-align: center;
        }

        .btn-cart {
            background: #111827;
            color: white;
            border: none;
            padding: 13px 30px;
            border-radius: 8px;
            font-weight: bold;
            margin-top: 20px;
        }

        .btn-cart:hover {
            background: #000;
            color: white;
        }

        .back-btn {
            margin-top: 20px;
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- NAVBAR -->

    <nav class="navbar navbar-expand-lg">

        <div class="container">

            <a class="navbar-brand" href="Default.aspx">
                WebKiu
            </a>

            <button class="navbar-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarMenu">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse"
                 id="navbarMenu">

                <ul class="navbar-nav ms-auto">

                    <li class="nav-item">
                        <a class="nav-link"
                           href="Home.aspx">
                            Home
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="ProductListing.aspx">
                            Products
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="Cart.aspx">
                            Cart
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="Login.aspx">
                            Login
                        </a>
                    </li>

                </ul>

            </div>

        </div>

    </nav>


    <!-- PRODUCT DETAILS -->

    <div class="container">

        <div class="product-container">

            <div class="row">

                <!-- IMAGE -->

                <div class="col-lg-6">

                    <asp:Image ID="imgProduct"
                               runat="server"
                               CssClass="main-image" />

                    <div class="mt-3">

                        <asp:Repeater ID="rptImages"
                                      runat="server">

                            <ItemTemplate>

                                <img src='<%#GetImageUrl(Eval("ImageUrl")) %>'
                                     class="thumbnail"
                                     alt="Product Image" />

                            </ItemTemplate>

                        </asp:Repeater>

                    </div>

                </div>


                <!-- DETAILS -->

                <div class="col-lg-6">

                    <div class="brand">

                        <asp:Label ID="lblBrand"
                                   runat="server">
                        </asp:Label>

                    </div>

                    <div class="product-name">

                        <asp:Label ID="lblProductName"
                                   runat="server">
                        </asp:Label>

                    </div>

                    <div class="category">

                        Category:

                        <asp:Label ID="lblCategory"
                                   runat="server">
                        </asp:Label>

                    </div>


                    <div class="price">

                        ₹<asp:Label ID="lblPrice"
                                   runat="server">
                        </asp:Label>

                    </div>


                    <div class="description">

                        <strong>Description</strong>

                        <br />

                        <asp:Label ID="lblDescription"
                                   runat="server">
                        </asp:Label>

                    </div>


                    <div class="stock">

                        <asp:Label ID="lblStock"
                                   runat="server">
                        </asp:Label>

                    </div>


                    <!-- QUANTITY -->

                    <div class="quantity-box">

                        <label>
                            Quantity:
                        </label>

                        <asp:TextBox ID="txtQuantity"
                                     runat="server"
                                     CssClass="form-control quantity-input"
                                     Text="1"
                                     TextMode="Number">
                        </asp:TextBox>

                    </div>


                    
                    <asp:Label ID="Label1" runat="server" CssClass="message"></asp:Label>
                    <asp:Button ID="btnAddToCart"
                                runat="server"
                                Text="🛒 Add To Cart"
                                CssClass="btn btn-cart"
                                 OnClick="btnAddToCart_Click"/>
                    <a href="Cart.aspx">Buynow</a>

                    <%--<asp:Button ID="btnWishlist" runat="server" Text="♡ Add to Wishlist" CssClass="btn btn-outline-danger px-4" OnClick="btnWishlist_Click" />--%>

                    <br />

                    <asp:Label ID="lblMessage"
                               runat="server"
                               CssClass="message">
                    </asp:Label>


                    <div>

                        <a href="ProductListing.aspx"
                           class="btn btn-outline-dark back-btn">

                            ← Back to Products

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</form>

</body>
</html>
