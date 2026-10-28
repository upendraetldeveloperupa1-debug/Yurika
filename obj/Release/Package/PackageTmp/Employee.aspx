<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="WebKiu.Employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="txtName" runat="server" 
    Placeholder="Enter Name"></asp:TextBox>

<asp:TextBox ID="txtEmail" runat="server" 
    Placeholder="Enter Email"></asp:TextBox>

<asp:TextBox ID="txtSalary" runat="server" 
    Placeholder="Enter Salary"></asp:TextBox>
<!-- Department Dropdown -->

        <div>

            <label>Department</label>

            <asp:DropDownList
                ID="ddlDepartment"
                runat="server">

                <asp:ListItem
                    Text="-- Select Department --"
                    Value="0">
                </asp:ListItem>

            </asp:DropDownList>

        </div>

        <br />

<asp:HiddenField ID="hdnEmployeeId" runat="server" />

<asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>

        </div>
                   <div>
<asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="False" DataKeyNames="EmployeeId" OnRowCommand="gvEmployee_RowCommand">
     <Columns>

        <asp:BoundField DataField="EmployeeId"
            HeaderText="ID" />

        <asp:BoundField DataField="Name"
            HeaderText="Name" />

        <asp:BoundField DataField="Email"
            HeaderText="Email" />

        <asp:BoundField DataField="Salary"
            HeaderText="Salary" />
         <asp:BoundField
                    DataField="DepartmentName"
                    HeaderText="Department" />

        <asp:ButtonField ButtonType="Button"
            Text="Edit"
            CommandName="EditEmployee" />

        <asp:ButtonField ButtonType="Button"
            Text="Delete"
            CommandName="DeleteEmployee" />

    </Columns>

</asp:GridView>
    </div>
    </form>
  
</body>
</html>
