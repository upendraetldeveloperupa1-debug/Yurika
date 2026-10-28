<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductImage.aspx.cs" Inherits="WebKiu.Product_Image" %>


<!DOCTYPE html>

<html>
<head runat="server">

    <title>Product Images</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

</head>

<body>

<form id="form1" runat="server">

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-header bg-dark text-white">

            <h3 class="mb-0">
                Product Image Management
            </h3>

        </div>

        <div class="card-body">

            <asp:Label ID="lblMessage"
                runat="server"
                CssClass="d-block mb-3">
            </asp:Label>


            <!-- Product -->

            <div class="mb-3">

                <label class="form-label">
                    Select Product
                </label>

                <asp:DropDownList
                    ID="ddlProduct"
                    runat="server"
                    CssClass="form-select">
                </asp:DropDownList>

            </div>


            <!-- Image -->

            <div class="mb-3">

                <label class="form-label">
                    Select Image
                </label>

                <asp:FileUpload
                    ID="fuProductImage"
                    runat="server"
                    CssClass="form-control" />

                <small class="text-muted">
                    JPG, JPEG, PNG or WEBP
                </small>

            </div>


            <!-- Primary -->

            <div class="form-check mb-3">

                <asp:CheckBox
                    ID="chkPrimary"
                    runat="server"
                    CssClass="form-check-input" />

                <label class="form-check-label">
                    Primary Image
                </label>

            </div>


            <!-- Active -->

            <div class="form-check mb-3">

                <asp:CheckBox
                    ID="chkActive"
                    runat="server"
                    Checked="true"
                    CssClass="form-check-input" />

                <label class="form-check-label">
                    Active
                </label>

            </div>


            <asp:Button
                ID="btnSave"
                runat="server"
                Text="Save Image"
                CssClass="btn btn-primary me-2" OnClick="btnSave_Click"/>

            <asp:Button
                ID="btnCancel"
                runat="server"
                Text="Cancel"
                CssClass="btn btn-secondary" OnClick="btnCancel_Click"/>

        </div>

    </div>


    <!-- Image List -->

    <div class="card shadow mt-4">

        <div class="card-header bg-dark text-white">

            <h4 class="mb-0">
                Product Images
            </h4>

        </div>

        <div class="card-body">

            <div class="table-responsive">

                <asp:GridView
                    ID="gvProductImage"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered table-hover" OnRowCommand="gvProductImage_RowCommand">

                    <Columns>

                        <asp:BoundField
                            DataField="ProductImageId"
                            HeaderText="ID" />

                        <asp:BoundField
                            DataField="ProductName"
                            HeaderText="Product" />


                        <asp:TemplateField
                            HeaderText="Image">

                            <ItemTemplate>

                                <asp:Image
                                    ID="imgProduct"
                                    runat="server"
                                    ImageUrl='<%# Eval("ImageUrl") %>'
                                    Width="100px"
                                    Height="80px"
                                    Style="object-fit: cover;" />

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:CheckBoxField
                            DataField="IsPrimary"
                            HeaderText="Primary" />


                        <asp:CheckBoxField
                            DataField="IsActive"
                            HeaderText="Active" />


                        <asp:TemplateField
                            HeaderText="Action">

                            <ItemTemplate>

                                <asp:Button
                                    ID="btnDelete"
                                    runat="server"
                                    Text="Delete"
                                    CommandName="DeleteImage"
                                    CommandArgument='<%# Eval("ProductImageId") %>'
                                    CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Delete this image?');"/>

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
