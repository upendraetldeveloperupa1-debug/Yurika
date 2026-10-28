<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductListing.aspx.cs" Inherits="WebKiu.ProductListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Products - WebKiu</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>

        body {
            background: #f6f7fb;
            font-family: Arial, sans-serif;
        }

        /* NAVBAR */

        .navbar {
            background: #111827;
            padding: 15px 0;
        }

        .logo {
            color: white;
            font-size: 28px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-link {
            color: white !important;
        }

        .nav-link:hover {
            color: #ffc107 !important;
        }


        /* HEADER */

        .page-header {
            background: white;
            padding: 35px 20px;
            text-align: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-weight: 700;
        }


        /* FILTER */

        .filter-card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,.07);
            margin-bottom: 30px;
        }


        /* PRODUCT CARD */

        .product-card {
            background: white;
            border-radius: 14px;
            overflow: hidden;
            height: 100%;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
            transition: all .3s ease;
        }

        .product-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 10px 30px rgba(0,0,0,.15);
        }

        .product-image {
            width: 100%;
            height: 260px;
            object-fit: cover;
            background: #eee;
        }

        .product-body {
            padding: 20px;
        }

        .product-name {
            font-size: 19px;
            font-weight: 600;
            margin-bottom: 7px;
        }

        .brand {
            color: #777;
            font-size: 14px;
        }

        .category {
            color: #666;
            font-size: 14px;
        }

        .price {
            font-size: 22px;
            font-weight: bold;
            color: #198754;
            margin: 12px 0;
        }

        .stock {
            font-size: 13px;
            color: #198754;
        }

        .out-stock {
            color: #dc3545;
        }


        /* FOOTER */

        footer {
            margin-top: 60px;
            background: #111827;
            color: white;
            padding: 40px 0;
        }

        footer a {
            color: #ccc;
            text-decoration: none;
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


<!-- ================= NAVBAR ================= -->

<nav class="navbar">

    <div class="container">

        <div class="d-flex
                    justify-content-between
                    align-items-center
                    w-100">

            <a href="Default.aspx"
               class="logo">

                WebKiu

            </a>


            <div>

                <a href="Default.aspx"
                   class="nav-link d-inline-block me-3">

                    Home

                </a>

                <a href="ProductListing.aspx"
                   class="nav-link d-inline-block me-3">

                    Products

                </a>

                <a href="Cart.aspx"
                   class="nav-link d-inline-block">

                    🛒 Cart

                </a>

            </div>

        </div>

    </div>

</nav>


<!-- ================= HEADER ================= -->

<div class="page-header">

    <div class="container">

        <h1>
            Our Products
        </h1>

        <p class="text-muted">
            Discover products you'll love
        </p>

    </div>

</div>


<div class="container">


<!-- ================= FILTER ================= -->

<div class="filter-card">

    <div class="row g-3">


        <!-- SEARCH -->

        <div class="col-md-6">

            <label class="form-label">
                Search Product
            </label>

            <div class="input-group">

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Search product, brand or category">
                </asp:TextBox>

                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn btn-dark"
                    OnClick="btnSearch_Click" />

            </div>

        </div>


        <!-- CATEGORY -->

        <div class="col-md-4">

            <label class="form-label">
                Category
            </label>

            <asp:DropDownList
                ID="ddlCategory"
                runat="server"
                CssClass="form-select"
                AutoPostBack="true"
                 OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
            </asp:DropDownList>

        </div>


        <!-- RESET -->

        <div class="col-md-2 d-flex
                    align-items-end">

            <asp:Button
                ID="btnReset"
                runat="server"
                Text="Reset"
                CssClass="btn btn-outline-secondary w-100"
                 OnClick="btnReset_Click" />

        </div>

    </div>

</div>


<!-- ================= MESSAGE ================= -->

<asp:Label
    ID="lblMessage"
    runat="server"
    CssClass="text-danger fw-bold">
</asp:Label>


<!-- ================= PRODUCTS ================= -->

<div class="row g-4 mt-2">


    <asp:Repeater
        ID="rptProducts"
        runat="server">

        <ItemTemplate>


            <div class="col-xl-3
                        col-lg-4
                        col-md-6">


                <div class="product-card">


                    <!-- IMAGE -->

                    <img
                        src='<%# GetImageUrl(Eval("ProductImage")) %>'
                        class="product-image"
                        alt="Product" />


                    <!-- BODY -->

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

                            ₹<%# Eval("Price", "{0:N2}") %>

                        </div>


                        <div class="mb-3">

                            <%# Convert.ToInt32(
                                Eval("Stock")) > 0

                                ? "<span class='stock'>✓ In Stock</span>"

                                : "<span class='stock out-stock'>✕ Out of Stock</span>"
                            %>

                        </div>


                        <a
                            href='ProductDetails.aspx?ProductId=<%# Eval("ProductId") %>'
                            class="btn btn-dark w-100">

                            View Details

                        </a>


                    </div>

                </div>

            </div>


        </ItemTemplate>

    </asp:Repeater>


</div>


<!-- ================= EMPTY ================= -->

<asp:Panel
    ID="pnlNoProducts"
    runat="server"
    Visible="false"
    CssClass="text-center py-5">

    <h3>
        No products found
    </h3>

    <p class="text-muted">
        Try another search or category.
    </p>

</asp:Panel>


</div>


<!-- ================= FOOTER ================= -->

<footer>

    <div class="container">

        <div class="row">

            <div class="col-md-6">

                <h4>WebKiu</h4>

                <p>
                    Your online shopping destination.
                </p>

            </div>


            <div class="col-md-6 text-md-end">

                <a href="Default.aspx">
                    Home
                </a>

                &nbsp;&nbsp;

                <a href="ProductListing.aspx">
                    Products
                </a>

                &nbsp;&nbsp;

                <a href="Cart.aspx">
                    Cart
                </a>

            </div>

        </div>

    </div>

</footer>


</form>

</body>

</html>
