<%@ Page Title="Login" Language="C#" MasterPageFile="~/Log_in.Master" AutoEventWireup="true" 
     CodeBehind="Default.aspx.cs" Inherits="IT114L_G2_MP.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/login-signup.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="page-container">
        <div class="log-in-container">
            <div class="left-container">
                <asp:Image ID="Image1" runat="server" CssClass="banner-bg" ImageUrl="~/img/Design-BG.png" />
                <asp:Image ID="Image2" runat="server" CssClass="logo" ImageUrl="~/img/smallLogo.svg" />
            </div>
            <div class="right-container">
                <div class="login">
                    <h1>Log In</h1>
                    <label>Username</label>
                    <asp:TextBox ID="unameTB" runat="server" CssClass="input"></asp:TextBox>
                    <label>Password</label>
                    <asp:TextBox ID="pwordTB" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="Sign In" CssClass="btn" OnClick="Button1_Click" />
                    <div class="signup">
                        <label>New User?</label>
                        <a href="SignUp.aspx">Sign Up</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>