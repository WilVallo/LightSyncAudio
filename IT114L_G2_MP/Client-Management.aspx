<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="Client-Management.aspx.cs" Inherits="IT114L_G2_MP.Client_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css\client.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body-container">
        <div class="form-container">
            
            <h3>MY CLIENTS</h3>
                <center><hr style="width:100%; margin-bottom: 20px;"/></center>
                <asp:GridView ID="client_table" runat="server" AutoGenerateColumns="False" CssClass="gridview" DataKeyNames="acc_id" OnRowCommand="Select_Row">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Edit"/>
                        <asp:BoundField DataField="acc_id" HeaderText="ID"/>
                        <asp:BoundField DataField="user_fname" HeaderText="First Name"/>
                        <asp:BoundField DataField="user_lname" HeaderText="Last Name"/>
                        <asp:BoundField DataField="user_email" HeaderText="Email"/>
                        <asp:BoundField DataField="user_phone_num" HeaderText="Phone"/>
                        <asp:BoundField DataField="user_verification" HeaderText="Verification"/>
                        <asp:BoundField DataField="user_status" HeaderText="Status"/>
                    </Columns>
                </asp:GridView>
            <asp:Label ID="No_Client" runat="server" Text=""></asp:Label>
        </div>


        <div class="form-container verification-container">
            <h3>VERIFY ACCOUNT</h3>
            <center><hr style="width:100%; margin-bottom: 20px;"/></center>
            ID <asp:TextBox ID="acc_id_tb" runat="server" CssClass="input-field" Enabled="false"></asp:TextBox> <br />
            Name <asp:TextBox ID="acc_name_tb" runat="server" CssClass="input-field" Enabled="false"></asp:TextBox> <br />
            <div class="checkbox-group">
                <p>Status</p>
                <asp:RadioButtonList ID="verification" runat="server" CssClass="radio">
                    <asp:ListItem Value="Verified" Text="Verified"></asp:ListItem>
                    <asp:ListItem Value="Unverified" Text="Unverified"></asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="btn-container">
                <asp:Button ID="save_btn" runat="server" Text="Save" OnClick="save_btn_Click" />
                <asp:Button ID="clear_btn" runat="server" Text="Clear" OnClick="clear_btn_Click" />
            </div>
        </div>

        
    </div>
</asp:Content>