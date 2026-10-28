<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressManagement.aspx.cs" Inherits="WebKiu.AddressManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>My Addresses - WebKiu</title>

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

        .page-container {
            margin-top: 40px;
            margin-bottom: 50px;
        }

        .box {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,.08);
            margin-bottom: 25px;
        }

        .title {
            font-size: 28px;
            font-weight: bold;
        }

        .section-title {
            font-size: 21px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .address-card {
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 20px;
            height: 100%;
        }

        .address-card.default {
            border: 2px solid #198754;
        }

        .address-type {
            font-weight: bold;
            color: #111827;
        }

        .default-badge {
            background: #198754;
            color: white;
            padding: 4px 9px;
            border-radius: 20px;
            font-size: 12px;
        }

        .address-text {
            color: #555;
            line-height: 1.7;
        }

        .btn-save {
            background: #111827;
            color: white;
        }

        .btn-save:hover {
            background: #000;
            color: white;
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


    <div class="container page-container">

        <div class="title mb-4">
            📍 My Addresses
        </div>


        <asp:Label
            ID="lblMessage"
            runat="server"
            CssClass="d-block mb-3">
        </asp:Label>


        <!-- ADDRESS FORM -->

        <div class="box">

            <div class="section-title">

                <asp:Label
                    ID="lblFormTitle"
                    runat="server"
                    Text="Add New Address">
                </asp:Label>

            </div>


            <asp:HiddenField
                ID="hdnAddressId"
                runat="server" />


            <div class="row">

                <div class="col-md-4 mb-3">

                    <label class="form-label">
                        Address Type
                    </label>

                    <asp:DropDownList
                        ID="ddlAddressType"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem
                            Text="Home"
                            Value="Home" />

                        <asp:ListItem
                            Text="Office"
                            Value="Office" />

                        <asp:ListItem
                            Text="Other"
                            Value="Other" />

                    </asp:DropDownList>

                </div>


                <div class="col-md-4 mb-3">

                    <label class="form-label">
                        Full Name
                    </label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Full name">
                    </asp:TextBox>

                </div>


                <div class="col-md-4 mb-3">

                    <label class="form-label">
                        Mobile
                    </label>

                    <asp:TextBox
                        ID="txtMobile"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Mobile number">
                    </asp:TextBox>

                </div>

            </div>


            <div class="mb-3">

                <label class="form-label">
                    Address
                </label>

                <asp:TextBox
                    ID="txtAddress"
                    runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="3"
                    placeholder="House no, street, area">
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


            <div class="form-check mb-3">

                <asp:CheckBox
                    ID="chkDefault"
                    runat="server"
                    CssClass="form-check-input" />

                <label class="form-check-label">
                    Set as default address
                </label>

            </div>


            <asp:Button
                ID="btnSave"
                runat="server"
                Text="Save Address"
                CssClass="btn btn-save px-4" OnClick="btnSave_Click"/>


            <asp:Button
                ID="btnClear"
                runat="server"
                Text="Clear"
                CssClass="btn btn-outline-secondary px-4 ms-2" OnClick="btnClear_Click" />

        </div>


        <!-- SAVED ADDRESSES -->

        <div class="box">

            <div class="section-title">
                Saved Addresses
            </div>


            <div class="row g-4">

                <asp:Repeater
                    ID="rptAddresses"
                    runat="server"
                    OnItemCommand="rptAddresses_ItemCommand">

                    <ItemTemplate>

                        <div class="col-md-6">

                            <div class='<%# Convert.ToBoolean(Eval("IsDefault"))
                                        ? "address-card default"
                                        : "address-card" %>'>

                                <div class="d-flex
                                            justify-content-between
                                            mb-2">

                                    <span class="address-type">

                                        <%# Eval("AddressType") %>

                                    </span>


                                    <%# Convert.ToBoolean(Eval("IsDefault"))
                                        ? "<span class='default-badge'>Default</span>"
                                        : "" %>

                                </div>


                                <h6>
                                    <%# Eval("FullName") %>
                                </h6>


                                <div class="address-text">

                                    <%# Eval("AddressLine") %>
                                    <br />

                                    <%# Eval("City") %>,
                                    <%# Eval("State") %>
                                    -
                                    <%# Eval("Pincode") %>

                                    <br />

                                    Mobile:
                                    <%# Eval("Mobile") %>

                                </div>


                                <div class="mt-3">

                                    <asp:Button
                                        ID="btnEdit"
                                        runat="server"
                                        Text="Edit"
                                        CommandName="EditAddress"
                                        CommandArgument='<%# Eval("AddressId") %>'
                                        CssClass="btn btn-sm btn-outline-primary me-1" />


                                    <asp:Button
                                        ID="btnDelete"
                                        runat="server"
                                        Text="Delete"
                                        CommandName="DeleteAddress"
                                        CommandArgument='<%# Eval("AddressId") %>'
                                        CssClass="btn btn-sm btn-outline-danger me-1" />


                                    <asp:Button
                                        ID="btnDefault"
                                        runat="server"
                                        Text="Set Default"
                                        CommandName="SetDefault"
                                        CommandArgument='<%# Eval("AddressId") %>'
                                        CssClass="btn btn-sm btn-outline-success"
                                        Visible='<%# !Convert.ToBoolean(Eval("IsDefault")) %>' />

                                </div>

                            </div>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>

            </div>

        </div>

    </div>

</form>

</body>

</html>
