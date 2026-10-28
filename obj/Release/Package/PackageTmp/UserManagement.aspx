<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement.aspx.cs" Inherits="WebKiu.UserManagement" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>User Management</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        body {
            background: #f4f6f9;
            font-family: Arial, sans-serif;
        }

        .page-title {
            font-weight: 700;
            color: #212529;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 18px rgba(0,0,0,.08);
        }

        .card-header {
            background: #212529;
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 18px;
        }

        .form-control,
        .form-select {
            border-radius: 8px;
            padding: 10px;
        }

        .btn {
            border-radius: 8px;
        }

        .table {
            vertical-align: middle;
        }

        .table thead {
            background: #212529;
            color: white;
        }

        .badge-active {
            background: #198754;
        }

        .badge-inactive {
            background: #dc3545;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container-fluid p-4">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <div>
            <h2 class="page-title">Customer / User Management</h2>
            <p class="text-muted">
                Manage customers, staff and administrators
            </p>
        </div>

    </div>


    <!-- MESSAGE -->

    <asp:Label ID="lblMessage"
        runat="server"
        CssClass="d-block mb-3 fw-bold">
    </asp:Label>


    <!-- USER FORM -->

    <div class="card mb-4">

        <div class="card-header">
            <h5 class="mb-0">User Information</h5>
        </div>

        <div class="card-body">

            <div class="row g-3">

                <!-- Full Name -->

                <div class="col-md-4">

                    <label class="form-label">
                        Full Name
                    </label>

                    <asp:TextBox ID="txtFullName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter full name">
                    </asp:TextBox>

                </div>


                <!-- Email -->

                <div class="col-md-4">

                    <label class="form-label">
                        Email
                    </label>

                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter email">
                    </asp:TextBox>

                </div>


                <!-- Mobile -->

                <div class="col-md-4">

                    <label class="form-label">
                        Mobile
                    </label>

                    <asp:TextBox ID="txtMobile"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter mobile number">
                    </asp:TextBox>

                </div>


                <!-- Password -->

                <div class="col-md-4">

                    <label class="form-label">
                        Password
                    </label>

                    <asp:TextBox ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Enter password">
                    </asp:TextBox>

                </div>


                <!-- Address -->

                <div class="col-md-8">

                    <label class="form-label">
                        Address
                    </label>

                    <asp:TextBox ID="txtAddress"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="2"
                        placeholder="Enter address">
                    </asp:TextBox>

                </div>


                <!-- City -->

                <div class="col-md-3">

                    <label class="form-label">
                        City
                    </label>

                    <asp:TextBox ID="txtCity"
                        runat="server"
                        CssClass="form-control"
                        placeholder="City">
                    </asp:TextBox>

                </div>


                <!-- State -->

                <div class="col-md-3">

                    <label class="form-label">
                        State
                    </label>

                    <asp:TextBox ID="txtState"
                        runat="server"
                        CssClass="form-control"
                        placeholder="State">
                    </asp:TextBox>

                </div>


                <!-- Pincode -->

                <div class="col-md-3">

                    <label class="form-label">
                        Pincode
                    </label>

                    <asp:TextBox ID="txtPincode"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Pincode">
                    </asp:TextBox>

                </div>


                <!-- Role -->

                <div class="col-md-3">

                    <label class="form-label">
                        Role
                    </label>

                    <asp:DropDownList ID="ddlRole"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Text="Customer"
                            Value="Customer" />

                        <asp:ListItem Text="Staff"
                            Value="Staff" />

                        <asp:ListItem Text="Admin"
                            Value="Admin" />

                    </asp:DropDownList>

                </div>


                <!-- Active -->

                <div class="col-md-3">

                    <div class="form-check mt-4">

                        <asp:CheckBox ID="chkActive"
                            runat="server"
                            Checked="true"
                            CssClass="form-check-input" />

                        <label class="form-check-label">
                            Active User
                        </label>

                    </div>

                </div>


                <!-- Buttons -->

                <div class="col-md-12 mt-3">

                    <asp:Button ID="btnSave"
                        runat="server"
                        Text="Save User"
                        CssClass="btn btn-primary me-2" OnClick="btnSave_Click"/>

                    <asp:Button ID="btnCancel"
                        runat="server"
                        Text="Clear"
                        CssClass="btn btn-secondary"
                        CausesValidation="false" OnClick="btnCancel_Click"/>
                        

                </div>

            </div>

        </div>

    </div>


    <!-- USER LIST -->

    <div class="card">

        <div class="card-header">

            <div class="d-flex justify-content-between">

                <h5 class="mb-0">
                    Customer / User List
                </h5>

                <span>
                    WebKiu Admin
                </span>

            </div>

        </div>


        <div class="card-body">

            <div class="table-responsive">

                <asp:GridView ID="gvUser"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-hover"
                    EmptyDataText="No users found." OnRowCommand="gvUser_RowCommand">

                    <Columns>

                        <asp:BoundField
                            DataField="UserId"
                            HeaderText="ID" />

                        <asp:BoundField
                            DataField="FullName"
                            HeaderText="Name" />

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
                            DataField="UserRole"
                            HeaderText="Role" />

                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

                                <span class='<%# Convert.ToBoolean(Eval("IsActive"))
                                    ? "badge badge-active"
                                    : "badge badge-inactive" %>'>

                                    <%# Convert.ToBoolean(Eval("IsActive"))
                                        ? "Active"
                                        : "Inactive" %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:Button
                                    ID="btnEdit"
                                    runat="server"
                                    Text="Edit"
                                    CssClass="btn btn-sm btn-warning me-1"
                                    CommandName="EditUser"
                                    CommandArgument='<%# Eval("UserId") %>' />

                                <asp:Button
                                    ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CssClass="btn btn-sm btn-danger"
                                    CommandName="DeleteUser"
                                    CommandArgument='<%# Eval("UserId") %>'/>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

        </div>

    </div>

</div>

</form>

</body>
</html>
