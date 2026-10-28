<%@ Page Title="Shopping Dashboard"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="WebKiu._Default" %>

<asp:Content ID="BodyContent"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css"
        rel="stylesheet" />

    <style>
        /* ==============================
           PAGE
        ============================== */

        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        /* ==============================
           SIDEBAR
        ============================== */

        .shopping-sidebar {
            width: 250px;
            min-height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background: #111827;
            color: white;
            padding-top: 20px;
            z-index: 1000;
        }

        .shopping-logo {
            font-size: 25px;
            font-weight: bold;
            padding: 15px 25px;
            margin-bottom: 20px;
        }

            .shopping-logo span {
                color: #38bdf8;
            }

        .menu-title {
            color: #9ca3af;
            font-size: 12px;
            padding: 10px 25px;
            text-transform: uppercase;
            letter-spacing: .5px;
        }

        .shopping-sidebar a {
            display: flex;
            align-items: center;
            padding: 13px 25px;
            color: #d1d5db;
            text-decoration: none;
            transition: all .3s ease;
        }

            .shopping-sidebar a:hover {
                background: #1f2937;
                color: white;
            }

            .shopping-sidebar a.active {
                background: #2563eb;
                color: white;
            }

            .shopping-sidebar a i {
                margin-right: 12px;
                font-size: 18px;
            }

        /* ==============================
           MAIN AREA
        ============================== */

        .shopping-main {
            margin-left: 250px;
            min-height: 100vh;
        }

        /* ==============================
           TOP BAR
        ============================== */

        .shopping-topbar {
            min-height: 70px;
            background: white;
            border-bottom: 1px solid #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px 30px;
        }

        .search-box {
            width: 300px;
        }

        .profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .profile-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            background: #e5e7eb;
        }

        /* ==============================
           CONTENT
        ============================== */

        .shopping-content {
            padding: 30px;
        }

        .page-title {
            font-size: 28px;
            font-weight: bold;
            color: #111827;
        }

        .welcome-text {
            color: #6b7280;
            margin-top: 5px;
        }

        /* ==============================
           DASHBOARD CARDS
        ============================== */

        .dashboard-card {
            background: white;
            border-radius: 12px;
            padding: 22px;
            border: none;
            box-shadow: 0 3px 12px rgba(0,0,0,.05);
            height: 100%;
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
        }

        .blue {
            background: #dbeafe;
            color: #2563eb;
        }

        .green {
            background: #dcfce7;
            color: #16a34a;
        }

        .orange {
            background: #ffedd5;
            color: #ea580c;
        }

        .purple {
            background: #f3e8ff;
            color: #9333ea;
        }

        .card-number {
            font-size: 27px;
            font-weight: bold;
            margin-top: 12px;
            color: #111827;
        }

        .card-label {
            color: #6b7280;
            margin-top: 3px;
        }

        /* ==============================
           DASHBOARD SECTIONS
        ============================== */

        .dashboard-section {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 3px 12px rgba(0,0,0,.05);
        }

        .section-title {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #111827;
        }

        /* ==============================
           SALES CHART
        ============================== */

        .sales-chart {
            height: 280px;
            display: flex;
            align-items: flex-end;
            justify-content: space-around;
            padding: 30px 20px;
            background: #f9fafb;
            border-radius: 10px;
        }

        .chart-bar {
            width: 35px;
            background: #2563eb;
            border-radius: 6px 6px 0 0;
            transition: .3s;
        }

            .chart-bar:hover {
                background: #1d4ed8;
            }

        .bar-1 {
            height: 35%;
        }

        .bar-2 {
            height: 55%;
        }

        .bar-3 {
            height: 45%;
        }

        .bar-4 {
            height: 75%;
        }

        .bar-5 {
            height: 60%;
        }

        .bar-6 {
            height: 85%;
        }

        .bar-7 {
            height: 95%;
        }

        /* ==============================
           CATEGORIES
        ============================== */

        .category-item {
            margin-bottom: 20px;
        }

        .category-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 7px;
            font-size: 14px;
        }

        .progress {
            height: 8px;
            border-radius: 10px;
        }

        /* ==============================
           TABLE
        ============================== */

        .orders-table {
            margin-bottom: 0;
        }

            .orders-table th {
                color: #6b7280;
                font-size: 14px;
                font-weight: 600;
                border-bottom: 1px solid #e5e7eb;
            }

            .orders-table td {
                vertical-align: middle;
                padding-top: 15px;
                padding-bottom: 15px;
            }

        .status {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
        }

        .delivered {
            background: #dcfce7;
            color: #15803d;
        }

        .pending {
            background: #fef3c7;
            color: #b45309;
        }

        .cancelled {
            background: #fee2e2;
            color: #dc2626;
        }

        /* ==============================
           RESPONSIVE
        ============================== */

        @media (max-width: 992px) {

            .shopping-sidebar {
                width: 80px;
            }

            .shopping-logo {
                font-size: 0;
                text-align: center;
                padding: 15px 5px;
            }

                .shopping-logo span {
                    font-size: 22px;
                }

            .menu-title {
                display: none;
            }

            .shopping-sidebar a {
                justify-content: center;
                padding: 15px;
            }

                .shopping-sidebar a span {
                    display: none;
                }

                .shopping-sidebar a i {
                    margin-right: 0;
                    font-size: 20px;
                }

            .shopping-main {
                margin-left: 80px;
            }

            .search-box {
                width: 200px;
            }
        }

        @media (max-width: 768px) {

            .shopping-topbar {
                padding: 12px 15px;
            }

            .shopping-content {
                padding: 15px;
            }

            .search-box {
                width: 150px;
            }

            .profile span {
                display: none;
            }

            .page-title {
                font-size: 24px;
            }
            
        }
    </style>


    <!-- =========================================
         SIDEBAR
    ========================================== -->

    <aside class="shopping-sidebar">

        <div class="shopping-logo">
            Shop<span>Zone</span>
        </div>

        <div class="menu-title">
            Main
        </div>

        <a href="Default.aspx" class="active">
            <i class="bi bi-speedometer2"></i>
            <span>Dashboard</span>
        </a>

        <a href="Product.aspx">
            <i class="bi bi-box-seam"></i>
            <span>Products</span>
        </a>

        <a href="Category.aspx">
            <i class="bi bi-tags"></i>
            <span>Categories</span>
        </a>
        <a href="Brand.aspx">
    <i class="bi bi-tags"></i>
    <span>Brand</span>
</a>

        <a href="Orders.aspx">
            <i class="bi bi-cart3"></i>
            <span>Orders</span>
        </a>

        <a href="Customer.aspx">
            <i class="bi bi-people"></i>
            <span>Customer</span>
        </a>

        <a href="ProductImage.aspx">
    <i class="bi bi-people"></i>
    <span>Product Image</span>
</a>

 <a href="Reports.aspx">
    <i class="bi bi-people"></i>
    <span>Reports</span>
</a>

        <div class="menu-title">
            Management
        </div>

        <a href="Reports.aspx">
            <i class="bi bi-bar-chart"></i>
            <span>Reports</span>
        </a>

        <a href="Settings.aspx">
            <i class="bi bi-gear"></i>
            <span>Settings</span>
        </a>

        <a href="Login.aspx">
            <i class="bi bi-box-arrow-right"></i>
            <span>Logout</span>
        </a>

    </aside>


    <!-- =========================================
         MAIN CONTENT
    ========================================== -->

    <div class="shopping-main">

        <!-- TOP BAR -->

        <header class="shopping-topbar">

            <div>
                <h5 class="mb-0">Shopping Dashboard
                </h5>
            </div>

            <div class="d-flex align-items-center gap-3">

                <input type="text"
                    class="form-control search-box"
                    placeholder="Search..." />

                <button type="button"
                    class="btn btn-light">

                    <i class="bi bi-bell"></i>

                </button>

                <div class="profile">

                    <img src="Images/user.jpg"
                        class="profile-image"
                        alt="Admin" />

                    <span>
                        <a href="AdminDashboard.aspx">Admin</a>
                    </span>

                </div>

            </div>

        </header>


        <!-- CONTENT -->

        <main class="shopping-content">

            <!-- PAGE TITLE -->

            <div class="mb-4">

                <div class="page-title">
                    Dashboard
                </div>

                <div class="welcome-text">
                    Welcome back! Here's what's happening
                    with your store today.
                </div>

            </div>


            <!-- =====================================
                 STATISTICS CARDS
            ====================================== -->

            <div class="row g-4 mb-4">

                <!-- PRODUCTS -->

                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-card">

                        <div class="card-icon blue">
                            <i class="bi bi-box-seam"></i>
                        </div>

                        <div class="card-number">
                            1,245
                        </div>

                        <div class="card-label">
                            Total Products
                        </div>

                    </div>

                </div>


                <!-- ORDERS -->

                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-card">

                        <div class="card-icon green">
                            <i class="bi bi-cart-check"></i>
                        </div>

                        <div class="card-number">
                            856
                        </div>

                        <div class="card-label">
                            Total Orders
                        </div>

                    </div>

                </div>


                <!-- CUSTOMERS -->

                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-card">

                        <div class="card-icon orange">
                            <i class="bi bi-people"></i>
                        </div>

                        <div class="card-number">
                            3,245
                        </div>

                        <div class="card-label">
                            Total Customers
                        </div>

                    </div>

                </div>


                <!-- REVENUE -->

                <div class="col-xl-3 col-md-6">

                    <div class="dashboard-card">

                        <div class="card-icon purple">
                            <i class="bi bi-currency-rupee"></i>
                        </div>

                        <div class="card-number">
                            ₹2,45,850
                        </div>

                        <div class="card-label">
                            Total Revenue
                        </div>

                    </div>

                </div>

            </div>


            <!-- =====================================
                 SALES + CATEGORIES
            ====================================== -->

            <div class="row g-4 mb-4">

                <!-- SALES -->

                <div class="col-lg-8">

                    <div class="dashboard-section">

                        <div class="section-title">
                            Sales Overview
                        </div>

                        <div class="sales-chart">

                            <div class="chart-bar bar-1"></div>

                            <div class="chart-bar bar-2"></div>

                            <div class="chart-bar bar-3"></div>

                            <div class="chart-bar bar-4"></div>

                            <div class="chart-bar bar-5"></div>

                            <div class="chart-bar bar-6"></div>

                            <div class="chart-bar bar-7"></div>

                        </div>

                        <div class="d-flex justify-content-around
                                    text-muted mt-2">

                            <small>Mon</small>
                            <small>Tue</small>
                            <small>Wed</small>
                            <small>Thu</small>
                            <small>Fri</small>
                            <small>Sat</small>
                            <small>Sun</small>

                        </div>

                    </div>

                </div>


                <!-- TOP CATEGORIES -->

                <div class="col-lg-4">

                    <div class="dashboard-section">

                        <div class="section-title">
                            Top Categories
                        </div>


                        <div class="category-item">

                            <div class="category-header">

                                <span>Electronics
                                </span>

                                <strong>80%
                                </strong>

                            </div>

                            <div class="progress">

                                <div class="progress-bar"
                                    style="width: 80%">
                                </div>

                            </div>

                        </div>


                        <div class="category-item">

                            <div class="category-header">

                                <span>Clothing
                                </span>

                                <strong>65%
                                </strong>

                            </div>

                            <div class="progress">

                                <div class="progress-bar"
                                    style="width: 65%">
                                </div>

                            </div>

                        </div>


                        <div class="category-item">

                            <div class="category-header">

                                <span>Shoes
                                </span>

                                <strong>50%
                                </strong>

                            </div>

                            <div class="progress">

                                <div class="progress-bar"
                                    style="width: 50%">
                                </div>

                            </div>

                        </div>


                        <div class="category-item">

                            <div class="category-header">

                                <span>Accessories
                                </span>

                                <strong>35%
                                </strong>

                            </div>

                            <div class="progress">

                                <div class="progress-bar"
                                    style="width: 35%">
                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- =====================================
                 RECENT ORDERS
            ====================================== -->

            <div class="dashboard-section">

                <div class="d-flex
                            justify-content-between
                            align-items-center mb-3">

                    <div class="section-title mb-0">
                        Recent Orders
                    </div>

                    <a href="Orders.aspx"
                        class="btn btn-primary btn-sm">View All

                    </a>

                </div>


                <div class="table-responsive">

                    <table class="table orders-table">

                        <thead>

                            <tr>

                                <th>Order ID
                                </th>

                                <th>Customer
                                </th>

                                <th>Product
                                </th>

                                <th>Amount
                                </th>

                                <th>Date
                                </th>

                                <th>Status
                                </th>

                            </tr>

                        </thead>


                        <tbody>

                            <tr>

                                <td>
                                    <strong>#ORD001</strong>
                                </td>

                                <td>Rahul Sharma
                                </td>

                                <td>iPhone 15
                                </td>

                                <td>₹65,000
                                </td>

                                <td>19 Sep 2026
                                </td>

                                <td>

                                    <span class="status delivered">Delivered
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <strong>#ORD002</strong>
                                </td>

                                <td>Amit Kumar
                                </td>

                                <td>Samsung TV
                                </td>

                                <td>₹45,000
                                </td>

                                <td>18 Sep 2026
                                </td>

                                <td>

                                    <span class="status pending">Pending
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <strong>#ORD003</strong>
                                </td>

                                <td>Priya Singh
                                </td>

                                <td>Nike Shoes
                                </td>

                                <td>₹7,500
                                </td>

                                <td>18 Sep 2026
                                </td>

                                <td>

                                    <span class="status delivered">Delivered
                                    </span>

                                </td>

                            </tr>


                            <tr>

                                <td>
                                    <strong>#ORD004</strong>
                                </td>

                                <td>Vikas Patel
                                </td>

                                <td>Laptop
                                </td>

                                <td>₹72,000
                                </td>

                                <td>17 Sep 2026
                                </td>

                                <td>

                                    <span class="status cancelled">Cancelled
                                    </span>

                                </td>

                            </tr>

                        </tbody>

                    </table>

                </div>

            </div>

        </main>

    </div>

</asp:Content>
