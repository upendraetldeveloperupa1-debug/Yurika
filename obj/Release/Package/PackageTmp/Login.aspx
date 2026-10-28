<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebKiu.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>WebKiu - Login</title>

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
            font-family: Arial, sans-serif;
        }

        .login-container {
            width: 100%;
            max-width: 420px;
            padding: 20px;
        }

        .login-card {
            background: white;
            border-radius: 18px;
            padding: 35px;
            box-shadow: 0 15px 40px rgba(0,0,0,.20);
        }

        .logo {
            text-align: center;
            font-size: 32px;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 5px;
        }

        .subtitle {
            text-align: center;
            color: #777;
            margin-bottom: 30px;
        }

        .form-control {
            height: 48px;
            border-radius: 10px;
        }

        .login-btn {
            height: 48px;
            width: 100%;
            border: none;
            border-radius: 10px;
            background: #667eea;
            color: white;
            font-size: 16px;
            font-weight: 600;
        }

            .login-btn:hover {
                background: #5568d8;
            }

        .error-message {
            display: block;
            text-align: center;
            margin-bottom: 15px;
        }
    </style>

</head>

<body>

    <form id="form1" runat="server">

        <div class="login-container">

            <div class="login-card">

                <div class="logo">
                    WebKiu
                </div>

                <div class="subtitle">
                    Sign in to your account
                </div>


                <!-- Message -->

                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="error-message text-danger">
                </asp:Label>


                <!-- Email -->

                <div class="mb-3">

                    <label class="form-label">
                        Email Address
                    </label>

                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Email"
                        placeholder="Enter your email">
                    </asp:TextBox>

                </div>


                <!-- Password -->

                <div class="mb-3">

                    <label class="form-label">
                        Password
                    </label>

                    <asp:TextBox ID="txtPassword"
                        runat="server"
                        CssClass="form-control"
                        TextMode="Password"
                        placeholder="Enter your password">
                    </asp:TextBox>

                </div>


                <!-- Remember -->

                <div class="mb-3">

                    <asp:CheckBox ID="chkRemember"
                        runat="server"
                        Text=" Remember me" />

                </div>


                <!-- Login -->

                <div class="mb-3">

                    <asp:Button ID="btnLogin"
                        runat="server"
                        Text="Login"
                        CssClass="login-btn" OnClick="btnLogin_Click" />

                </div>


                <!-- Register -->

                <div class="text-center">

                    <span class="text-muted">Don't have an account?
                    </span>

                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#registerModal">Register</button>

                </div>

            </div>

        </div>
        <section>
            <div class="modal fade" id="registerModal" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title">Create Account</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                        </div>

                        <div class="modal-body">

                            <div class="mb-3">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtName" runat="server"
                                    CssClass="form-control"
                                    placeholder="Enter full name">
                                </asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Email</label>
                                <asp:TextBox ID="TextBox1" runat="server"
                                    CssClass="form-control"
                                    TextMode="Email"
                                    placeholder="Enter email">
                                </asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Mobile</label>
                                <asp:TextBox ID="txtMobile" runat="server"
                                    CssClass="form-control"
                                    placeholder="Enter mobile number">
                                </asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Password</label>
                                <asp:TextBox ID="textPassword" runat="server"
                                    CssClass="form-control"
                                    TextMode="Password"
                                    placeholder="Enter password">
                                </asp:TextBox>
                            </div>

                            <%--<div class="mb-3">
                                <label>Confirm Password</label>
                                <asp:TextBox ID="txtConfirmPassword" runat="server"
                                    CssClass="form-control"
                                    TextMode="Password"
                                    placeholder="Confirm password">
                                </asp:TextBox>
                            </div>--%>

                            <div class="mb-3">
                                <label>Address</label>
                                <asp:TextBox
                                    ID="txtAddress"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="Enter address">
                    </asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>City</label>
                                <asp:TextBox
                                    ID="txtCity"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="City">
                    </asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>State</label>
                                <asp:TextBox
                                    ID="txtState"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="State">
                    </asp:TextBox>
                            </div>

                            <div class="mb-3">
                                <label>Pincode</label>
                                <asp:TextBox 
                                    ID="txtPincode"
                                    runat="server"
                                    CssClass="form-control"
                                    placeholder="Pincode">
                    </asp:TextBox>
                            </div>
                             <div class="col-md-3">

     <label class="form-label">
         Role
     </label>

     <asp:DropDownList ID="ddlRole"
         runat="server" autofill="Costomer"
         CssClass="form-select">
        

         <asp:ListItem Text="Customer"
             Value="Customer" />

         <%--<asp:ListItem Text="Staff" 
             Value="Staff" />

         <asp:ListItem Text="Admin"
             Value="Admin" />--%>

     </asp:DropDownList>

 </div>

                            <div class="col-md-3">

    <div class="form-check mt-4">

        <asp:CheckBox ID="chkActive"
            runat="server"
            Checked="true"
            CssClass="form-check-input" />

        <label class="form-check-label">
            Active User
        </label>

    </div>

</div>


                             <div class="col-md-12 mt-4">
                            <asp:Button ID="btnRegister" runat="server"
                                Text="Create Account"
                                CssClass="btn btn-primary w-100" OnClick="btnRegister_Click"/>
                                 </div>

                            <div class="col-md-12 text-center mt-3">

                    <span class="text-muted">
                        Already have an account?
                    </span>

                    <asp:HyperLink
                        ID="lnkLogin"
                        runat="server"
                        NavigateUrl="Login.aspx"
                        CssClass="fw-bold text-decoration-none">
                        Login
                    </asp:HyperLink>

                </div>
                        </div>
                   
                </div>
            </div>
        </section>
           </div>
        </div>

    </form>

</body>
</html>
