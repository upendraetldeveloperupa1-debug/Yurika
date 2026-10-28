<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderTracking.aspx.cs" Inherits="WebKiu.OrderTracking" %>

<!DOCTYPE html>

<html>
<head runat="server">

    <title>Track Order</title>

    <style>

        body {
            font-family: Arial;
            background: #f5f6fa;
            margin: 0;
        }

        .container {
            width: 700px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,.1);
        }

        .title {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 25px;
        }

        .search {
            display: flex;
            gap: 10px;
        }

        .textbox {
            flex: 1;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
        }

        .btn {
            padding: 12px 25px;
            border: none;
            background: #111827;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }

        .timeline {
            margin-top: 40px;
        }

        .tracking-item {
            position: relative;
            padding-left: 40px;
            padding-bottom: 30px;
            border-left: 3px solid #ddd;
        }

        .tracking-item:last-child {
            border-left: none;
        }

        .circle {
            position: absolute;
            left: -10px;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #16a34a;
        }

        .status {
            font-size: 18px;
            font-weight: bold;
        }

        .description {
            color: #666;
            margin-top: 5px;
        }

        .date {
            font-size: 13px;
            color: #999;
            margin-top: 5px;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container">

    <div class="title">
        Track Your Order
    </div>

    <div class="search">

        <asp:TextBox
            ID="txtOrderId"
            runat="server"
            CssClass="textbox"
            Placeholder="Enter Order ID">
        </asp:TextBox>

        <asp:Button
            ID="btnTrack"
            runat="server"
            Text="Track Order"
            CssClass="btn" OnClick="btnTrack_Click" />

    </div>

    <asp:Label
        ID="lblMessage"
        runat="server">
    </asp:Label>

    <div class="timeline">

        <asp:Repeater
            ID="rptTracking"
            runat="server">

            <ItemTemplate>

                <div class="tracking-item">

                    <div class="circle"></div>

                    <div class="status">
                        <%# Eval("Status") %>
                    </div>

                    <div class="description">
                        <%# Eval("Description") %>
                    </div>

                    <div class="date">
                        <%# Eval("TrackingDate", "{0:dd MMM yyyy hh:mm tt}") %>
                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>

    </div>

</div>

</form>

</body>
</html>
