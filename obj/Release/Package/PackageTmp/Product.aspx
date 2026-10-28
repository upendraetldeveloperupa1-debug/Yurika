<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="WebKiu.Product" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Product Management</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-header bg-dark text-white">

            <h3 class="mb-0">
                Product Management
            </h3>

        </div>

        <div class="card-body">

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="d-block mb-3">
            </asp:Label>


            <div class="row">

                <!-- Product Name -->

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Product Name
                    </label>

                    <asp:TextBox
                        ID="txtProductName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter product name">
                    </asp:TextBox>

                </div>


                <!-- Category -->

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Category
                    </label>

                    <asp:DropDownList
                        ID="ddlCategory"
                        runat="server"
                        CssClass="form-select">
                    </asp:DropDownList>

                </div>


                <!-- Brand -->

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Brand
                    </label>

                    <asp:DropDownList
                        ID="ddlBrand"
                        runat="server"
                        CssClass="form-select">
                    </asp:DropDownList>

                </div>


                <!-- Price -->

                <div class="col-md-3 mb-3">

                    <label class="form-label">
                        Price
                    </label>

                    <asp:TextBox
                        ID="txtPrice"
                        runat="server"
                        CssClass="form-control"
                        placeholder="0.00">
                    </asp:TextBox>

                </div>


                <!-- Stock -->

                <div class="col-md-3 mb-3">

                    <label class="form-label">
                        Stock
                    </label>

                    <asp:TextBox
                        ID="txtStock"
                        runat="server"
                        CssClass="form-control"
                        placeholder="0">
                    </asp:TextBox>

                </div>


                <!-- Description -->

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Description
                    </label>

                    <asp:TextBox
                        ID="txtDescription"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        Rows="3"
                        placeholder="Enter product description">
                    </asp:TextBox>

                </div>


                <!-- Image -->

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Image URL
                    </label>

                    <asp:TextBox
                        ID="txtImageUrl"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter image URL">
                    </asp:TextBox>

                </div>


                <!-- Active -->

                <div class="col-md-6 mb-3">

                    <div class="form-check">

                        <asp:CheckBox
                            ID="chkActive"
                            runat="server"
                            Checked="true"
                            CssClass="form-check-input" />

                        <label class="form-check-label">
                            Active
                        </label>

                    </div>

                </div>

            </div>


            <asp:Button
                ID="btnSave"
                runat="server"
                Text="Save"
                CssClass="btn btn-primary me-2" OnClick="btnSave_Click"/>

            <%--<asp:Button
                ID="btnCancel"
                runat="server"
                Text="Cancel"
                CssClass="btn btn-secondary" OnClick="btnCancel_Click" />--%>

        </div>

    </div>


    <!-- Product Grid -->

    <div class="card shadow mt-4">

        <div class="card-header bg-dark text-white">

            <h4 class="mb-0">
                Product List
            </h4>

        </div>

        <div class="card-body">

            <div class="table-responsive">

                <asp:GridView
                    ID="gvProduct"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-hover" OnRowCommand="gvProduct_RowCommand">

                    <Columns>

                        <asp:BoundField
                            DataField="ProductId"
                            HeaderText="ID" />

                        <asp:BoundField
                            DataField="ProductName"
                            HeaderText="Product" />

                        <asp:BoundField
                            DataField="CategoryName"
                            HeaderText="Category" />

                        <asp:BoundField
                            DataField="BrandName"
                            HeaderText="Brand" />

                        <asp:BoundField
                            DataField="Price"
                            HeaderText="Price"
                            DataFormatString="{0:C}" />

                        <asp:BoundField
                            DataField="Stock"
                            HeaderText="Stock" />

                        <asp:CheckBoxField
                            DataField="IsActive"
                            HeaderText="Active" />

                        <asp:TemplateField HeaderText="Action">

                            <ItemTemplate>

                                <asp:Button
                                    ID="btnEdit"
                                    runat="server"
                                    Text="Edit"
                                    CommandName="EditProduct"
                                    CommandArgument='<%# Eval("ProductId") %>'
                                    CssClass="btn btn-sm btn-warning me-2" />

                                <asp:Button
                                    ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CommandName="DeleteProduct"
                                    CommandArgument='<%# Eval("ProductId") %>'
                                    CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this product?');"/>

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
