<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Brand.aspx.cs" Inherits="WebKiu.Brand" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Brand Management</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />
</head>

<body>

<form id="form1" runat="server">

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-header bg-dark text-white">
            <h3 class="mb-0">Brand Management</h3>
        </div>

        <div class="card-body">

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="mb-3 d-block">
            </asp:Label>

            <div class="row">

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Brand Name
                    </label>

                    <asp:TextBox ID="txtBrandName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter brand name">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Description
                    </label>

                    <asp:TextBox ID="txtDescription"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="2"
                        placeholder="Enter description">
                    </asp:TextBox>

                </div>

                <div class="col-md-6 mb-3">

                    <div class="form-check">

                        <asp:CheckBox ID="chkActive"
                            runat="server"
                            Checked="true"
                            CssClass="form-check-input" />

                        <label class="form-check-label">
                            Active
                        </label>

                    </div>

                </div>

            </div>

            <asp:Button ID="btnSave"
                runat="server"
                Text="Save"
                CssClass="btn btn-primary me-2" OnClick="btnSave_Click" />

            <asp:Button ID="btnCancel"
                runat="server"
                Text="Cancel"
                CssClass="btn btn-secondary" OnClick="btnCancel_Click" />

        </div>

    </div>


    <div class="card shadow mt-4">

        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">Brand List</h4>
        </div>

        <div class="card-body">

            <asp:GridView ID="gvBrand"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table table-bordered table-hover" DataKeyNames="BrandId" OnRowCommand="gvBrand_RowCommand">

                <Columns>

                    <asp:BoundField
                        DataField="BrandId"
                        HeaderText="ID" />

                    <asp:BoundField
                        DataField="BrandName"
                        HeaderText="Brand Name" />

                    <asp:BoundField
                        DataField="Description"
                        HeaderText="Description" />

                    <asp:CheckBoxField
                        DataField="IsActive"
                        HeaderText="Active" />

                    <asp:TemplateField HeaderText="Action">

                        <ItemTemplate>

                            <asp:Button ID="btnEdit"
                                runat="server"
                                Text="Edit"
                                CssClass="btn btn-sm btn-warning me-1"
                                CommandName="EditBrand"
                                CommandArgument='<%# Eval("BrandId") %>' />

                            <asp:Button ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="btn btn-sm btn-danger"
                                CommandName="DeleteBrand"
                                CommandArgument='<%# Eval("BrandId") %>' OnClientClick="return confirm('Are you sure you want to delete this brand?');"/>

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
