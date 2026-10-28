<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebKiu.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>WebKiu - Online Shopping</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>

        body {
            margin: 0;
            background: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        /* NAVBAR */

        .navbar {
            background: #111827;
            padding: 15px 30px;
        }

        .logo {
            color: white;
            font-size: 28px;
            font-weight: bold;
            text-decoration: none;
        }

        .nav-link {
            color: white !important;
            margin-left: 15px;
        }

        .nav-link:hover {
            color: #ffc107 !important;
        }


        

        .hero {
            min-height: 430px;
            background:
                linear-gradient(
                    rgba(0,0,0,.55),
                    rgba(0,0,0,.55)
                ),
                url('Images/hero.jpg');

            background-size: cover;
            background-position: center;

            display: flex;
            align-items: center;
        }

        .hero-content {
            color: white;
            max-width: 600px;
        }

        .hero-content h1 {
            font-size: 52px;
            font-weight: 700;
        }

        .hero-content p {
            font-size: 20px;
            margin: 20px 0;
        }
        .hero-content {
    position: relative;
    z-index: 2;
}

.hero-marquee {
    width: 300%;
    max-width: 650px;
    overflow: hidden;
    background: rgba(0, 0, 0, 0.75);
    border-radius: 30px;
    padding: 10px 0;
    margin-bottom: 25px;
    white-space: nowrap;
}

.marquee-text {
    display: inline-block;
    padding-left: 100%;
    font-size: 14px;
    font-weight: 600;
    color: #fff;
    animation: heroMarquee 18s linear infinite;
}

@keyframes heroMarquee {

    0% {
        transform: translateX(0);
    }

    100% {
        transform: translateX(-100%);
    }
}

.hero-marquee:hover .marquee-text {
    animation-play-state: paused;
}

        /* SECTION */

        .section {
            padding: 55px 0;
        }

        .section-title {
            text-align: center;
            margin-bottom: 35px;
        }

        .section-title h2 {
            font-weight: 700;
        }

        .section-title p {
            color: #777;
        }


        /* CATEGORY */

        .category-card {
            background: white;
            border-radius: 12px;
            padding: 25px 15px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
            transition: .3s;
            height: 100%;
        }

        .category-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 25px rgba(0,0,0,.15);
        }

        .category-icon {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            background: #111827;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: auto;
            font-size: 28px;
        }

        .category-card h5 {
            margin-top: 18px;
            font-weight: 600;
        }


        /* PRODUCT */

        .product-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,.08);
            transition: .3s;
            height: 100%;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,.15);
        }

        .product-image {
            width: 100%;
            height: 240px;
            object-fit: cover;
            background: #f1f1f1;
        }

        .product-body {
            padding: 18px;
        }

        .product-name {
            font-size: 18px;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .brand {
            color: #777;
            font-size: 14px;
        }

        .price {
            color: #198754;
            font-size: 21px;
            font-weight: bold;
            margin: 10px 0;
        }


        /* OFFER */

        .offer {
            background: #111827;
            color: white;
            padding: 55px 20px;
            text-align: center;
        }

        .offer h2 {
            font-size: 38px;
            font-weight: 700;
        }


        /* FOOTER */

        footer {
            background: #111827;
            color: white;
            padding: 45px 0;
        }

        footer h5 {
            margin-bottom: 20px;
        }

        footer a {
            color: #ccc;
            text-decoration: none;
            display: block;
            margin-bottom: 8px;
        }

        footer a:hover {
            color: white;
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg">

    <div class="container">

        <a href="Home.aspx"
           class="logo">

            WebKiu

        </a>


        <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#menu">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div class="collapse navbar-collapse"
             id="menu">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">

                    <a class="nav-link"
                       href="Home.aspx">

                        Home

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="Product.aspx">

                        Products

                    </a>

                </li>

                <li class="nav-item">

                    <a class="nav-link"
                       href="Cart.aspx">

                        🛒 Cart

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


<!-- ================= HERO ================= -->

<section class="hero">

    <div class="container">

       <div class="hero-content">

    <!-- Moving Offer Banner -->
    <div class="hero-marquee">
        <div class="marquee-text">
            🔥 MEGA SALE — UP TO 70% OFF
            &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
            🚚 FREE DELIVERY ABOVE ₹999
            &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
            🎁 SPECIAL WEEKEND OFFERS
            &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
            💳 SECURE ONLINE PAYMENT
        </div>
    </div>

    <h1>
        Shop Smart.<br />
        Shop Better.
    </h1>

    <p>
        Discover amazing products at
        great prices.
    </p>

    <a href="Product.aspx"
       class="btn btn-warning btn-lg">

        Shop Now

    </a>

</div>

    </div>

</section>


<!-- ================= CATEGORIES ================= -->

<section class="section">

    <div class="container">

        <div class="section-title">

            <h2>
                Shop By Category
            </h2>

            <p>
                Explore our popular categories
            </p>

        </div>


        <div class="row g-4">

            <asp:Repeater
                ID="rptCategories"
                runat="server">

                <ItemTemplate>

                    <div class="col-lg-3 col-md-4 col-sm-6">

                        <div class="category-card">

                            <div class="category-icon">

                                🛍️

                            </div>

                            <h5>

                                <%# Eval("CategoryName") %>

                            </h5>

                            <a
                                href='Product.aspx?CategoryId=<%# Eval("CategoryId") %>'
                                class="btn btn-outline-dark btn-sm">

                                View Products

                            </a>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</section>


<!-- ================= PRODUCTS ================= -->

<section class="section bg-light">

    <div class="container">

        <div class="section-title">

            <h2>
                Featured Products
            </h2>

            <p>
                Check out our latest products
            </p>

        </div>


        <div class="row g-4">

            <asp:Repeater
                ID="rptProducts"
                runat="server">

                <ItemTemplate>

                    <div class="col-xl-3
                                col-lg-3
                                col-md-4
                                col-sm-6">

                        <div class="product-card">


                            <img
                                src='<%# GetImageUrl(Eval("ProductImage")) %>'
                                class="product-image"
                                alt="Product" />


                            <div class="product-body">

                                <div class="brand">

                                    <%# Eval("BrandName") %>

                                </div>


                                <div class="product-name">

                                    <%# Eval("ProductName") %>

                                </div>


                                <div class="brand">

                                    <%# Eval("CategoryName") %>

                                </div>


                                <div class="price">

                                    ₹<%# Eval("Price", "{0:N2}") %>

                                </div>


                                <a
                                    href='ProductDetails.aspx?ProductId=<%# Eval("ProductId") %>'
                                    class="btn btn-dark w-100">

                                    View Product

                                </a>

                            </div>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>


        <div class="text-center mt-5">

            <a href="Home.aspx"
               class="btn btn-outline-dark btn-lg">

                View All Products

            </a>

        </div>

    </div>

</section>


<!-- ================= OFFER ================= -->

<section class="offer">

    <div class="container">

        <h2>
            Special Offers
        </h2>

        <p class="lead">
            Discover great products and
            exciting deals at WebKiu.
        </p>

        <a href="Product.aspx"
           class="btn btn-warning btn-lg">

            Explore Now

        </a>

    </div>

</section>


<!-- ================= FOOTER ================= -->

<footer>

    <div class="container">

        <div class="row">

            <div class="col-md-4">

                <h5>WebKiu</h5>

                <p>
                    Your online shopping destination
                    for quality products.
                </p>

            </div>


            <div class="col-md-4">

                <h5>Quick Links</h5>

                <a href="Home.aspx">
                    Home
                </a>

                <a href="Product.aspx">
                    Products
                </a>

                <a href="Cart.aspx">
                    Cart
                </a>

                <a href="Login.aspx">
                    Login
                </a>

            </div>


            <div class="col-md-4">

                <h5>Contact</h5>

                <p>
                    Email: support@webkiu.com
                </p>

                <p>
                    Phone: +91 7210297353
                </p>

            </div>

        </div>


        <hr />


        <div class="text-center">

            © 2026 WebKiu.
            All Rights Reserved.

        </div>

    </div>

</footer>


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</form>

</body>

</html>
