<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="WebKiu.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Customer Management - WebKiu</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <style>

        body {
            background: #f5f7fb;
            font-family: Arial, sans-serif;
        }

        .page-header {
            background: #212529;
            color: white;
            padding: 22px 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .form-card,
        .grid-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 3px 15px rgba(0,0,0,.08);
        }

        .form-label {
            font-weight: 600;
        }

        .btn-space {
            margin-right: 8px;
        }

        .table thead {
            background: #212529;
            color: white;
        }

        .message {
            font-weight: 600;
        }

        .title {
            font-weight: 600;
            margin-bottom: 20px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container-fluid p-4">

    <!-- HEADER -->

    <div class="page-header">

        <div class="d-flex justify-content-between
                    align-items-center">

            <div>

                <h2>👥 Customer Management</h2>

                <small>
                    Manage WebKiu customers
                </small>

            </div>

            <a href="AdminDashboard.aspx"
               class="btn btn-light">

                Dashboard

            </a>

        </div>

    </div>


    <!-- FORM -->

    <div class="form-card mb-4">

        <h4 class="title">
            Customer Details
        </h4>


        <asp:HiddenField
            ID="hfCustomerId"
            runat="server" />


        <div class="row g-3">

            <!-- NAME -->

            <div class="col-md-6">

                <label class="form-label">
                    Full Name
                </label>

                <asp:TextBox
                    ID="txtFullName"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter full name">
                </asp:TextBox>

            </div>


            <!-- EMAIL -->

            <div class="col-md-6">

                <label class="form-label">
                    Email
                </label>

                <asp:TextBox
                    ID="txtEmail"
                    runat="server"
                    CssClass="form-control"
                    TextMode="Email"
                    placeholder="Enter email">
                </asp:TextBox>

            </div>


            <!-- MOBILE -->

            <div class="col-md-4">

                <label class="form-label">
                    Mobile
                </label>

                <asp:TextBox
                    ID="txtMobile"
                    runat="server"
                    CssClass="form-control"
                    MaxLength="15"
                    placeholder="Enter mobile">
                </asp:TextBox>

            </div>


            <!-- CITY -->

            <div class="col-md-4">

                <label class="form-label">
                    City
                </label>

                <asp:TextBox
                    ID="txtCity"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter city">
                </asp:TextBox>

            </div>


            <!-- STATE -->

            <div class="col-md-4">

                <label class="form-label">
                    State
                </label>

                <asp:TextBox
                    ID="txtState"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter state">
                </asp:TextBox>

            </div>


            

            <div class="col-md-4">

                <label class="form-label">
                    Pincode
                </label>

                <asp:TextBox
                    ID="txtPincode"
                    runat="server"
                    CssClass="form-control"
                    MaxLength="10"
                    placeholder="Enter pincode">
                </asp:TextBox>

            </div>


            <!-- ADDRESS -->

            <div class="col-md-8">

                <label class="form-label">
                    Address
                </label>

                <asp:TextBox
                    ID="txtAddress"
                    runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="2"
                    placeholder="Enter address">
                </asp:TextBox>

            </div>


            <!-- ACTIVE -->

            <div class="col-md-4">

                <div class="form-check mt-4">

                    <asp:CheckBox
                        ID="chkActive"
                        runat="server"
                        Checked="true"
                        CssClass="form-check-input" />

                    <label class="form-check-label">
                        Active Customer
                    </label>

                </div>

            </div>


            <!-- BUTTONS -->

            <div class="col-12">

                <asp:Button
                    ID="btnSave"
                    runat="server"
                    Text="Save Customer"
                    CssClass="btn btn-primary btn-space" OnClick="btnSave_Click"
                     />

                <asp:Button
                    ID="btnClear"
                    runat="server"
                    Text="Clear"
                    CssClass="btn btn-secondary" OnClick="btnClear_Click"
                    CausesValidation="false" />

            </div>
            <li class="nav-item">
    <a class="nav-link"
       href="Wishlist.aspx">
        ♥ Wishlist
    </a>
</li>

<li class="nav-item">
    <a class="nav-link"
       href="Cart.aspx">
        🛒 Cart
    </a>
</li>

            <div class="col-12">

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>

            </div>

        </div>

    </div>


    <!-- SEARCH -->

    <div class="grid-card">

        <div class="row mb-3 align-items-end">

            <div class="col-md-6">

                <h4 class="title mb-0">
                    Customer List
                </h4>

            </div>

            <div class="col-md-6">

                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Search name, email, mobile or city"
                    AutoPostBack="true" OnTextChanged="txtSearch_TextChanged">
                </asp:TextBox>

            </div>

        </div>


        <!-- GRID -->

        <div class="table-responsive">

            <asp:GridView
                ID="gvCustomer"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover" OnRowCommand="gvCustomer_RowCommand"
                EmptyDataText="No customers found.">

                <Columns>

                    <asp:BoundField
                        DataField="CustomerId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="FullName"
                        HeaderText="Customer Name" />

                    <asp:BoundField
                        DataField="Email"
                        HeaderText="Email" />

                    <asp:BoundField
                        DataField="Mobile"
                        HeaderText="Mobile" />

                    <asp:BoundField
                        DataField="City"
                        HeaderText="City" />

                    <asp:BoundField
                        DataField="State"
                        HeaderText="State" />

                    <asp:BoundField
                        DataField="Pincode"
                        HeaderText="Pincode" />


                    <asp:TemplateField
                        HeaderText="Status">

                        <ItemTemplate>

                            <%# Convert.ToBoolean(Eval("IsActive"))
                                ? "Active"
                                : "Inactive" %>

                        </ItemTemplate>

                    </asp:TemplateField>


                    <asp:BoundField
                        DataField="CreatedDate"
                        HeaderText="Created Date"
                        DataFormatString="{0:dd-MM-yyyy}" />


                    <asp:TemplateField
                        HeaderText="Action">

                        <ItemTemplate>

                            <asp:LinkButton
                                ID="btnEdit"
                                runat="server"
                                Text="Edit"
                                CssClass="btn btn-sm btn-warning me-1"
                                CommandName="EditCustomer"
                                CommandArgument='<%# Eval("CustomerId") %>'>
                            </asp:LinkButton>


                            <asp:LinkButton
                                ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="btn btn-sm btn-danger"
                                CommandName="DeleteCustomer"
                                CommandArgument='<%# Eval("CustomerId") %>' OnClientClick="return confirm('Are you sure you want to delete this customer?');">
                            </asp:LinkButton>

                        </ItemTemplate>

                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </div>

</div>

</form>

</body>

</html>
