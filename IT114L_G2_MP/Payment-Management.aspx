<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Payment-Management.aspx.cs" Inherits="IT114L_G2_MP.Payment_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css\payment.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="package-container">
        <div class="center">
            <h3>Customer-Event Information</h3>
            <center><hr style="width:100%; margin-bottom: 20px;"/></center>
        </div>
        <div class="detail-container">
            <div class="item">
                Customer Name <br />
                <asp:TextBox runat="server" ID="name" Enabled="false" CssClass="detail-tb"/>
            </div>
            <div class="item">
                Event Name <br />
                <asp:TextBox runat="server" ID="eventname" Enabled="false" CssClass="detail-tb"/>
            </div>
        </div>

        <div class="detail-container">
            <div class="item">
                Event Date <br />
                <asp:TextBox runat="server" ID="eventdate" Enabled="false" CssClass="detail-tb"/>
            </div>
            <div class="item">
                Package <br />
                <asp:TextBox runat="server" ID="package" Enabled="false" CssClass="detail-tb"/>
            </div>
        </div>
        </div>

    <div class="package-container">
        <div class="center">
            <h3>Service Charge Breakdown</h3>
            <center>
                <hr style="width: 100%; margin-bottom: 20px;" />
            </center>
        </div>

        <div class="detail-container">
            <div class="item">
                Package Fee
                <br />
                <asp:TextBox runat="server" ID="package_fee" Enabled="false" CssClass="detail-tb" />
            </div>
            <div class="item">
                Team Professional Fee
                <br />
                <asp:TextBox runat="server" ID="team_pf" Enabled="false" CssClass="detail-tb" />
            </div>
        </div>

        <div class="detail-container">
            <div class="item">
                Discount
                <br />
                <asp:TextBox runat="server" ID="discount" Enabled="false" CssClass="detail-tb" />
            </div>
            <div class="item">
                Down Payment
                <br />
                <asp:TextBox runat="server" ID="downpayment" Enabled="false" CssClass="detail-tb" />
            </div>
        </div>

        <div class="detail-container">
            <div class="item">
                Total Service Fee
                <br />
                <asp:TextBox runat="server" ID="total_service_fee" Enabled="false" CssClass="detail-tb" />
            </div>
            <div class="item">
                Balance
                <br />
                <asp:TextBox runat="server" ID="balance" Enabled="false" CssClass="detail-tb" />
            </div>
        </div>

        <center>
            <asp:Button runat="server" ID="pay" Text="Pay 50%" Enabled="false" CssClass="paid" OnClick="paid_Click" />
        </center>
    </div>


</asp:Content>
