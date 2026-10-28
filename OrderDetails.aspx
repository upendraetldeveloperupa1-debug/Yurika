<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="WebKiu.OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Order Details - WebKiu</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <style>

        body {
            background: #f5f7fb;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 18px rgba(0,0,0,.08);
        }

        .header {
            background: #212529;
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 20px;
        }

        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
        }

        .total {
            font-size: 22px;
            font-weight: 700;
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

<div class="container py-4">

    <!-- HEADER -->

    <div class="card mb-4">

        <div class="header">

            <div class="d-flex justify-content-between">

                <h3 class="mb-0">
                    Order Details
                </h3>

                <asp:Label ID="lblOrderId"
                    runat="server">
                </asp:Label>

            </div>

        </div>


        <div class="card-body">

            <div class="row">

                <div class="col-md-6">

                    <h5>Customer Information</h5>

                    <p>
                        <strong>Name:</strong>
                        <asp:Label ID="lblName"
                            runat="server" />
                    </p>

                    <p>
                        <strong>Email:</strong>
                        <asp:Label ID="lblEmail"
                            runat="server" />
                    </p>

                    <p>
                        <strong>Order Date:</strong>
                        <asp:Label ID="lblDate"
                            runat="server" />
                    </p>

                </div>


                <div class="col-md-6">

                    <h5>Shipping Information</h5>

                    <p>
                        <strong>Name:</strong>
                        <asp:Label ID="lblShippingName"
                            runat="server" />
                    </p>

                    <p>
                        <strong>Mobile:</strong>
                        <asp:Label ID="lblMobile"
                            runat="server" />
                    </p>

                    <p>
                        <strong>Address:</strong>
                        <asp:Label ID="lblAddress"
                            runat="server" />
                    </p>

                    <p>
                        <strong>Location:</strong>
                        <asp:Label ID="lblLocation"
                            runat="server" />
                    </p>

                </div>

            </div>

        </div>

    </div>


    <!-- PRODUCTS -->

    <div class="card">

        <div class="header">
            <h5 class="mb-0">
                Ordered Products
            </h5>
        </div>

        <div class="card-body">

            <div class="table-responsive">

                <asp:GridView
                    ID="gvOrderDetails"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table table-bordered">

                    <Columns>

                        <asp:TemplateField HeaderText="Product">

                            <ItemTemplate>

                                <div class="d-flex align-items-center">

                                    <asp:Image
                                        ID="imgProduct"
                                        runat="server"
                                        CssClass="product-image me-3"
                                        ImageUrl='<%# Eval("ImageUrl") %>' />

                                    <strong>
                                        <%# Eval("ProductName") %>
                                    </strong>

                                </div>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:BoundField
                            DataField="Quantity"
                            HeaderText="Quantity" />

                        <asp:BoundField
                            DataField="UnitPrice"
                            HeaderText="Unit Price"
                            DataFormatString="₹ {0:N2}" />

                        <asp:BoundField
                            DataField="TotalPrice"
                            HeaderText="Total"
                            DataFormatString="₹ {0:N2}" />

                    </Columns>

                </asp:GridView>

            </div>


            <div class="text-end mt-3">

                <span class="total">

                    Grand Total:
                    ₹ <asp:Label
                        ID="lblTotal"
                        runat="server" />

                </span>

            </div>

        </div>

    </div>


    <div class="mt-3">

        <a href="OrderManagement.aspx"
           class="btn btn-secondary">

            ← Back to Orders

        </a>

    </div>

</div>

</form>

</body>
</html>
