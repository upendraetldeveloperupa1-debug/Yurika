<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmation.aspx.cs" Inherits="WebKiu.OrderConfirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>🎉 Order Placed Successfully!</h1>

<p>
    Thank you for shopping with WebKiu.
</p>

<p>
    Your Order ID is:
    <asp:Label ID="lblOrderId" runat="server" />
</p>

<a href="ProductListing.aspx"
   class="btn btn-dark">
    Continue Shopping
</a>
        </div>
    </form>
</body>
</html>
