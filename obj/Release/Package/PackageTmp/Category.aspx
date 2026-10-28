<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WebKiu.Category" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Kiu | Category Management</title>

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        body {
            background: #f5f7fb;
            color: #1e293b;
        }

        /* ================= PAGE ================= */

        .page {
            min-height: 100vh;
            padding: 35px 45px;
        }

        /* ================= TOP BAR ================= */

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .brand-logo {
            width: 45px;
            height: 45px;
            border-radius: 12px;
            background: #4f46e5;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 21px;
            font-weight: 800;
            box-shadow: 0 6px 15px rgba(79,70,229,.25);
        }

        .brand-text h2 {
            font-size: 20px;
            font-weight: 700;
        }

        .brand-text span {
            font-size: 12px;
            color: #94a3b8;
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .admin-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: #e0e7ff;
            color: #4338ca;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: 700;
        }

        .admin-info strong {
            display: block;
            font-size: 13px;
        }

        .admin-info span {
            font-size: 11px;
            color: #94a3b8;
        }

        /* ================= HEADING ================= */

        .heading {
            margin-bottom: 25px;
        }

            .heading h1 {
                font-size: 30px;
                font-weight: 750;
                letter-spacing: -.5px;
                margin-bottom: 6px;
            }

            .heading p {
                color: #64748b;
                font-size: 14px;
            }

        /* ================= MAIN GRID ================= */

        .content {
            display: grid;
            grid-template-columns: 430px 1fr;
            gap: 25px;
            align-items: start;
        }

        /* ================= CARD ================= */

        .card {
            background: white;
            border-radius: 18px;
            border: 1px solid #e8edf5;
            box-shadow: 0 8px 30px rgba(15,23,42,.05);
            overflow: hidden;
        }

        .card-header {
            padding: 22px 25px;
            border-bottom: 1px solid #edf1f6;
        }

            .card-header h2 {
                font-size: 18px;
                margin-bottom: 4px;
            }

            .card-header p {
                color: #94a3b8;
                font-size: 12px;
            }

        .card-body {
            padding: 25px;
        }

        /* ================= FORM ================= */

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 650;
            margin-bottom: 8px;
            color: #334155;
        }

        .required {
            color: #ef4444;
        }

        .input-wrap {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #94a3b8;
            font-size: 15px;
        }

        .form-control {
            width: 100%;
            border: 1px solid #dce2eb;
            border-radius: 10px;
            padding: 12px 14px 12px 40px;
            font-size: 13px;
            outline: none;
            color: #334155;
            background: #fff;
            transition: .2s;
        }

        textarea.form-control {
            min-height: 115px;
            resize: vertical;
            padding-left: 14px;
        }

        .form-control:hover {
            border-color: #c5ccd8;
        }

        .form-control:focus {
            border-color: #6366f1;
            box-shadow: 0 0 0 4px rgba(99,102,241,.10);
        }

        /* ================= STATUS ================= */

        .status-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #f8fafc;
            border: 1px solid #e5eaf1;
            padding: 13px 15px;
            border-radius: 10px;
        }

        .status-title {
            font-size: 13px;
            font-weight: 600;
        }

        .status-subtitle {
            display: block;
            color: #94a3b8;
            font-size: 11px;
            margin-top: 2px;
        }

        .status-box input {
            width: 18px;
            height: 18px;
            accent-color: #4f46e5;
            cursor: pointer;
        }

        /* ================= BUTTONS ================= */

        .buttons {
            display: flex;
            gap: 10px;
            margin-top: 25px;
        }

        .btn {
            border: 0;
            border-radius: 9px;
            padding: 12px 18px;
            cursor: pointer;
            font-size: 13px;
            font-weight: 650;
            transition: .2s;
        }

        .btn-save {
            flex: 1;
            background: #4f46e5;
            color: white;
        }

            .btn-save:hover {
                background: #4338ca;
                transform: translateY(-1px);
                box-shadow: 0 7px 18px rgba(79,70,229,.25);
            }

        .btn-update {
            flex: 1;
            background: #059669;
            color: white;
        }

        .btn-clear {
            background: #f1f5f9;
            color: #475569;
            border: 1px solid #dbe2ea;
        }

            .btn-clear:hover {
                background: #e2e8f0;
            }

        /* ================= LIST HEADER ================= */

        .list-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 22px 25px;
            border-bottom: 1px solid #edf1f6;
        }

        .list-title h2 {
            font-size: 18px;
        }

        .list-title span {
            font-size: 12px;
            color: #94a3b8;
        }

        .category-count {
            background: #eef2ff;
            color: #4f46e5;
            padding: 7px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
        }

        /* ================= SEARCH ================= */

        .search-area {
            padding: 18px 25px;
            border-bottom: 1px solid #edf1f6;
        }

        .search-box {
            position: relative;
        }

            .search-box input {
                width: 100%;
                padding: 11px 15px 11px 40px;
                border: 1px solid #dce2eb;
                border-radius: 9px;
                outline: none;
                font-size: 13px;
            }

                .search-box input:focus {
                    border-color: #6366f1;
                }

        .search-icon {
            position: absolute;
            left: 14px;
            top: 11px;
            color: #94a3b8;
        }

        /* ================= EMPTY TABLE ================= */

        .empty-state {
            text-align: center;
            padding: 65px 20px;
        }

        .empty-icon {
            width: 65px;
            height: 65px;
            margin: auto;
            border-radius: 50%;
            background: #f1f5f9;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 27px;
            margin-bottom: 15px;
        }

        .empty-state h3 {
            font-size: 16px;
            margin-bottom: 6px;
        }

        .empty-state p {
            color: #94a3b8;
            font-size: 12px;
        }

        /* ================= RESPONSIVE ================= */

        @media(max-width: 1000px) {

            .content {
                grid-template-columns: 1fr;
            }

            .page {
                padding: 25px;
            }
        }

        @media(max-width: 600px) {

            .page {
                padding: 18px;
            }

            .topbar {
                margin-bottom: 20px;
            }

            .admin-info {
                display: none;
            }

            .heading h1 {
                font-size: 24px;
            }

            .card-body,
            .card-header,
            .list-header,
            .search-area {
                padding-left: 18px;
                padding-right: 18px;
            }

            .buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="page">

            <!-- ================= TOP BAR ================= -->

            <div class="topbar">

                <div class="brand">

                    <div class="brand-logo">
                        K
                    </div>

                    <div class="brand-text">
                        <h2>KIU</h2>
                        <span>Shopping Admin</span>
                    </div>

                </div>

                <div class="admin-profile">

                    <div class="admin-avatar">
                        A
                    </div>

                    <div class="admin-info">
                        <strong>Administrator</strong>
                        <span>Admin Panel</span>
                    </div>

                </div>

            </div>


            <!-- ================= PAGE TITLE ================= -->

            <div class="heading">

                <h1>Categories</h1>

                <p>
                    Manage product categories for your online store.
                </p>

            </div>


            <!-- ================= CONTENT ================= -->

            <div class="content">


                <!-- ================= ADD CATEGORY ================= -->

                <div class="card">

                    <div class="card-header">

                        <h2>Category Details</h2>

                        <p>
                            Add or update your product category
                        </p>

                    </div>


                    <div class="card-body">


                        <!-- Hidden ID -->

                        <%--<asp:TextBox
                            ID="txtCategoryId"
                            runat="server"
                            Visible="false">
                        </asp:TextBox>--%>


                        <!-- Category Name -->

                        <div class="form-group">

                            <label class="form-label">
                                Category Name
                        <span class="required">*</span>
                            </label>

                            <div class="input-wrap">

                                <span class="input-icon">▣</span>

                                <asp:TextBox
                                    ID="txtCategoryName"
                                    runat="server"
                                    CssClass="form-control"
                                    Placeholder="e.g. Electronics">
                                </asp:TextBox>

                            </div>

                        </div>


                        <!-- Description -->

                        <div class="form-group">

                            <label class="form-label">
                                Description
                            </label>

                            <asp:TextBox
                                ID="txtDescription"
                                runat="server"
                                CssClass="form-control"
                                TextMode="MultiLine"
                                Placeholder="Write a short description...">
                            </asp:TextBox>

                        </div>


                        <!-- Status -->

                        <div class="form-group">

                            <label class="form-label">
                                Status
                            </label>

                            <div class="status-box">

                                <div>

                                    <span class="status-title">Active Category
                                    </span>

                                    <span class="status-subtitle">Category will be visible in the store
                                    </span>

                                </div>

                                <asp:CheckBox
                                    ID="chkActive"
                                    runat="server"
                                    Checked="true" />

                            </div>

                        </div>


                        <!-- Buttons -->

                        <div class="buttons">

                            <asp:Button
                                ID="btnClear"
                                runat="server"
                                Text="Clear"
                                CssClass="btn btn-clear" OnClick="btnClear_Click"/>

                            <%--<asp:Button
                                ID="btnUpdate"
                                runat="server"
                                Text="Update Category"
                                Visible="false"
                                CssClass="btn btn-update" />--%>

                            <asp:Button
                                ID="btnSave"
                                runat="server"
                                Text="Submit"
                                CssClass="btn btn-save" OnClick="btnSave_Click" />

                        </div>

                    </div>

                </div>


                <!-- ================= CATEGORY LIST ================= -->

                <div class="card">

                    <div class="list-header">

                        <div class="list-title">

                            <h2>Category List</h2>
                            <asp:GridView ID="Gvcategory" runat="server" AutoGenerateColumns="true" OnRowCommand="gvcategory_RowCommand">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn-save alert-danger" CommandName="A" CommandArgument='<%#Eval("CategoryId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="btnedit" runat="server" Text="Edit" CssClass="btn-save alert-info" CommandName="B" CommandArgument='<%#Eval("CategoryId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>

                            <span>All product categories
                            </span>

                        </div>

                        <div class="category-count">
                            Categories
                        </div>

                    </div>


                    <!-- Search -->

                    <div class="search-area">

                        <div class="search-box">

                            <span class="search-icon">🔍
                            </span>

                            <input
                                type="text"
                                placeholder="Search categories..." />

                        </div>

                    </div>


                    <!-- Empty State -->

                    <div class="empty-state">

                        <div class="empty-icon">
                            📦
                        </div>

                        <h3>No categories yet</h3>

                        <p>
                            Add your first product category using the form.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </form>

</body>
</html>
