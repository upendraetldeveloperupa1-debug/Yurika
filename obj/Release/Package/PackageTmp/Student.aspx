<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="WebKiu.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Registration</title>

    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #eef2ff, #f8fafc);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 950px;
            margin: auto;
        }

        /* Main Card */
        .card {
            background: #ffffff;
            border-radius: 16px;
            padding: 35px;
            box-shadow: 0 10px 35px rgba(0, 0, 0, 0.10);
        }

        .title {
            text-align: center;
            margin-bottom: 30px;
        }

        .title h2 {
            color: #1e293b;
            font-size: 28px;
            margin-bottom: 8px;
        }

        .title p {
            color: #64748b;
            font-size: 14px;
        }

        /* Form */
        .form-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 18px;
        }

        .form-table td:first-child {
            width: 150px;
            font-weight: 600;
            color: #334155;
            vertical-align: middle;
        }

        .form-table td:last-child {
            width: auto;
        }

        .input-box {
            width: 100%;
            padding: 13px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            font-size: 15px;
            outline: none;
            transition: all 0.3s ease;
            background: #f8fafc;
        }

        .input-box:focus {
            border-color: #2563eb;
            background: #ffffff;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.12);
        }

        textarea.input-box {
            min-height: 90px;
            resize: vertical;
        }

        /* Button */
        .button-row {
            text-align: right;
            padding-top: 10px;
        }

        .btn-save {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-save:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.25);
        }

        /* Grid Section */
        .grid-section {
            margin-top: 35px;
        }

        .grid-title {
            font-size: 20px;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 15px;
        }

        .student-grid {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
        }

        .student-grid th {
            background: #1e293b;
            color: #ffffff;
            padding: 14px;
            text-align: left;
            font-size: 14px;
        }

        .student-grid td {
            padding: 13px 14px;
            border-bottom: 1px solid #e2e8f0;
            color: #475569;
            font-size: 14px;
        }

        .student-grid tr:nth-child(even) {
            background: #f8fafc;
        }

        .student-grid tr:hover {
            background: #eff6ff;
        }

        /* Mobile */
        @media (max-width: 650px) {

            body {
                padding: 20px 10px;
            }

            .card {
                padding: 20px;
            }

            .title h2 {
                font-size: 23px;
            }

            .form-table,
            .form-table tbody,
            .form-table tr,
            .form-table td {
                display: block;
                width: 100%;
            }

            .form-table {
                border-spacing: 0;
            }

            .form-table td:first-child {
                margin-bottom: 7px;
            }

            .form-table tr {
                margin-bottom: 15px;
            }

            .button-row {
                text-align: center;
            }

            .btn-save {
                width: 100%;
            }

            .grid-section {
                overflow-x: auto;
            }

            .student-grid {
                min-width: 650px;
            }
        }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <div class="container">

        <div class="card">

            <!-- Header -->
            <div class="title">
                <h2>Student Registration</h2>
                <p>Enter student information and click Submit</p>
            </div>

            <!-- Form -->
            <table class="form-table">

                <tr>
                    <td>
                        Name
                    </td>

                    <td>
                        <asp:TextBox 
                            ID="txtName" 
                            runat="server"
                            CssClass="input-box"
                            Placeholder="Enter Name">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        Email
                    </td>

                    <td>
                        <asp:TextBox 
                            ID="Textemail" 
                            runat="server"
                            CssClass="input-box"
                            TextMode="Email"
                            Placeholder="Enter Email">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        Mobile
                    </td>

                    <td>
                        <asp:TextBox 
                            ID="Textmob" 
                            runat="server"
                            CssClass="input-box"
                            TextMode="Phone"
                            Placeholder="Enter Mobile">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        Address
                    </td>

                    <td>
                        <asp:TextBox 
                            ID="Textaddress" 
                            runat="server"
                            CssClass="input-box"
                            TextMode="MultiLine"
                            Placeholder="Enter Address">
                        </asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>

                    <td class="button-row">

                        <asp:Button 
                            ID="btnSave" 
                            runat="server" 
                            Text="Submit"
                            CssClass="btn-save"
                            OnClick="btnSave_Click" />

                    </td>
                </tr>

            </table>

            <!-- Grid -->
            <div class="grid-section">

                <div class="grid-title">
                    Student List
                </div>

                <asp:GridView ID="gvstudent" runat="server" CssClass="student-grid" AutoGenerateColumns="true" OnRowCommand="gvstudent_RowCommand">
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:button ID="btndelete" runat="server" Text="Delete" CssClass="btn-save alert-danger" CommandName="A" CommandArgument='<%#Eval("stid") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField>
                            <ItemTemplate>
                                <asp:button ID="btnedit" runat="server" Text="Edit" CssClass="btn-save alert-info" CommandName="B" CommandArgument='<%#Eval("stid") %>' />
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