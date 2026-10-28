<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="WebKiu.AdminDashboard" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Admin Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

    <div class="container mt-5">

        <h1>
            Welcome,
            <asp:Label ID="lblName"
                runat="server">
            </asp:Label>
        </h1>

        <hr />

        <div class="row g-3">

            <div class="col-md-3">
                <a href="UserManagement.aspx"
                   class="btn btn-primary w-100 p-3">
                    Users
                </a>
            </div>

            <div class="col-md-3">
                <a href="Category.aspx"
                   class="btn btn-success w-100 p-3">
                    Categories
                </a>
            </div>

            <div class="col-md-3">
                <a href="Brand.aspx"
                   class="btn btn-warning w-100 p-3">
                    Brands
                </a>
            </div>

            <div class="col-md-3">
                <a href="Product.aspx"
                   class="btn btn-info w-100 p-3">
                    Products
                </a>
            </div>

        </div>

    </div>

</form>

</body>
</html>
