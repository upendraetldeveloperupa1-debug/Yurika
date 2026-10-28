<%@ Page Title="Product Size" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="Size.aspx.cs"
    Inherits="WebKiu.Size" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-4">

        <div class="card shadow">

            <div class="card-header bg-dark text-white">
                <h4 class="mb-0">Product Size Management</h4>
            </div>

            <div class="card-body">

                <asp:HiddenField ID="hfSizeId" runat="server" />

                <!-- Size Name -->

                <div class="row mb-3">

                    <div class="col-md-6">

                        <label class="form-label">
                            Size Name
                        </label>

                        <asp:TextBox
                            ID="txtSizeName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter size name">
                        </asp:TextBox>

                    </div>

                    <div class="col-md-6">

                        <label class="form-label">
                            Description
                        </label>

                        <asp:TextBox
                            ID="txtDescription"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="2"
                            placeholder="Enter description">
                        </asp:TextBox>

                    </div>

                </div>


                <!-- Active -->

                <div class="form-check mb-3">

                    <asp:CheckBox
                        ID="chkActive"
                        runat="server"
                        CssClass="form-check-input"
                        Checked="true" />

                    <label class="form-check-label">
                        Active
                    </label>

                </div>


                <!-- Buttons -->

                <div class="mb-3">

                    <asp:Button
                        ID="btnSave"
                        runat="server"
                        Text="Save"
                        CssClass="btn btn-primary me-2" OnClick="btnSave_Click" />

                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Update"
                        CssClass="btn btn-success me-2" OnClick="btnUpdate_Click"
                        Visible="false" />

                    <asp:Button
                        ID="btnClear"
                        runat="server"
                        Text="Clear" OnClick="btnClear_Click"
                        CssClass="btn btn-secondary" />

                </div>


                <!-- Message -->

                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="fw-bold">
                </asp:Label>


                <hr />


                <!-- Grid -->

                <div class="table-responsive">

                    <asp:GridView
                        ID="gvSize"
                        runat="server"
                        AutoGenerateColumns="False"
                        CssClass="table table-bordered table-striped" OnRowCommand="gvSize_RowCommand"
                        DataKeyNames="SizeId">

                        <Columns>

                            <asp:BoundField
                                DataField="SizeId"
                                HeaderText="ID" />

                            <asp:BoundField
                                DataField="SizeName"
                                HeaderText="Size" />

                            <asp:BoundField
                                DataField="Description"
                                HeaderText="Description" />

                            <asp:TemplateField HeaderText="Status">

                                <ItemTemplate>

                                    <asp:Label
                                        runat="server"
                                        Text='<%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>'
                                        CssClass='<%# Convert.ToBoolean(Eval("IsActive")) ? "badge bg-success" : "badge bg-danger" %>'>
                                    </asp:Label>

                                </ItemTemplate>

                            </asp:TemplateField>


                            <asp:BoundField
                                DataField="CreatedDate"
                                HeaderText="Created Date"
                                DataFormatString="{0:dd-MM-yyyy}" />


                            <asp:TemplateField HeaderText="Action">

                                <ItemTemplate>

                                    <asp:LinkButton
                                        ID="btnEdit"
                                        runat="server"
                                        CommandName="EditSize"
                                        CommandArgument='<%# Eval("SizeId") %>'
                                        CssClass="btn btn-sm btn-warning me-1">

                                        Edit

                                    </asp:LinkButton>


                                    <asp:LinkButton
                                        ID="btnDelete"
                                        runat="server"
                                        CommandName="DeleteSize"
                                        CommandArgument='<%# Eval("SizeId") %>'
                                        CssClass="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure you want to delete this size?');">

                                        Delete

                                    </asp:LinkButton>

                                </ItemTemplate>

                            </asp:TemplateField>

                        </Columns>

                    </asp:GridView>

                </div>

            </div>

        </div>

    </div>

</asp:Content>
