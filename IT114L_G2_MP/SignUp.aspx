<%@ Page Title="" Language="C#" MasterPageFile="~/Log_in.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="IT114L_G2_MP.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css\signup.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Audio Visualizer -->
    <div class="audio-visualizer" id="audioVisualizer"></div>
    
    <div class="signup-page">
        <!-- Branding Text -->
        <div class="branding-text">
            <h1>We Provide</h1>
            <h2>Top Quality</h2>
            <p>Light Sync Audio - Professional Sound & Lighting Solutions</p>
        </div>
        
        <div class="signup-container">
            <h1>Create Account</h1>

            <!--------------------------------------------| EMAIL -->
            <label for="tb_email">Email Address</label>
            <asp:TextBox ID="tb_email" runat="server" TextMode="Email" CssClass="su_Email" placeholder="Enter your email address"></asp:TextBox>

            <!--------------------------------------------| USERNAME -->
            <label for="tb_username">Username</label>
            <asp:TextBox ID="tb_username" runat="server" CssClass="su_Username" placeholder="Choose a username"></asp:TextBox>

            <!--------------------------------------------| PASSWORD -->
            <label for="tb_password">Password</label>
            <asp:TextBox ID="tb_password" runat="server" TextMode="Password" CssClass="su_Password" placeholder="Create a password"></asp:TextBox>

            <!--------------------------------------------| CONFIRM PASSWORD -->
            <label for="tb_confirm_password">Confirm Password</label>
            <asp:TextBox ID="tb_confirm_password" runat="server" TextMode="Password" CssClass="su_CfPassword" placeholder="Confirm your password"></asp:TextBox>

            <!--------------------------------------------| FIRST AND LAST NAME -->
            <table class="form-table">
                <tr>
                    <!-- First Name -->
                    <td>
                        <label for="tb_fname" class="su_FirstNameLabel">First Name</label>
                        <asp:TextBox ID="tb_fname" runat="server" CssClass="su_FirstName" placeholder="First name"></asp:TextBox>
                    </td>

                    <!-- Last Name -->
                    <td>
                        <label for="tb_lastname" class="su_LastNameLabel">Last Name</label>
                        <asp:TextBox ID="tb_lastname" runat="server" CssClass="su_LastName" placeholder="Last name"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <!--------------------------------------------| COMPANY NAME -->
            <label for="tb_comp_name">Company Name</label>
            <asp:TextBox ID="tb_comp_name" runat="server" CssClass="su_CompName" placeholder="Enter your company name"></asp:TextBox>

            <!--------------------------------------------| PHONE NUMBER -->
            <label for="tb_phone">Phone Number</label>
            <asp:TextBox ID="tb_phone" runat="server" MaxLength="11" TextMode="Phone" CssClass="su_Phone" placeholder="Enter your phone number"></asp:TextBox>

            <!--------------------------------------------| BUSINESS NUMBER -->
            <label for="tb_buss_phone">Business Number</label>
            <asp:TextBox ID="tb_buss_phone" runat="server" MaxLength="11" TextMode="Phone" CssClass="su_BusNum" placeholder="Enter your business number"></asp:TextBox>

            <!--------------------------------------------| CREATE ACCOUNT BUTTON -->
            <div class="Div_for_button_na_hindi_macenter">
                <asp:Button ID="Button1" runat="server" Text="Create Account" OnClick="Button1_Click" CssClass="su_CreateAccountBtn" />
            </div>

            <!--------------------------------------------| RETURN TO LOGIN -->
            <a href="Default.aspx" class="return-link">Already have an account? Sign in</a>
        </div>
    </div>
    
    <script type="text/javascript">
        document.addEventListener('DOMContentLoaded', function () {
            // Create audio visualizer bars
            const visualizer = document.getElementById('audioVisualizer');
            const barCount = 60; // Number of bars

            for (let i = 0; i < barCount; i++) {
                const bar = document.createElement('div');
                bar.className = 'bar';

                // Random height for each bar
                const scale = (Math.random() * 0.8) + 0.2; // Between 0.2 and 1.0
                bar.style.setProperty('--scale', scale);

                // Random animation duration
                const duration = (Math.random() * 1.5) + 0.5; // Between 0.5 and 2.0 seconds
                bar.style.setProperty('--duration', duration + 's');

                // Random height
                const height = Math.floor(Math.random() * 100) + 20; // Between 20px and 120px
                bar.style.height = height + 'px';

                visualizer.appendChild(bar);
            }
        });
    </script>
</asp:Content>