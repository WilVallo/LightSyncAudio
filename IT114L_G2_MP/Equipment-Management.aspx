<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="Equipment-Management.aspx.cs" Inherits="IT114L_G2_MP.Equipment_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css\equipment.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="body-container">
        <div class="left-container form-container">
            <div class="evt-container-line">
                <h3 class="header-title">My Equipment</h3>
            </div>

            <asp:GridView ID="gvEquipments" runat="server" AutoGenerateColumns="False" CssClass="gridview" ShowHeaderWhenEmpty="True" DataKeyNames="equip_id" OnSelectedIndexChanged="gvEquipments_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="true" />
                    <asp:BoundField DataField="equip_id" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="equip_type" HeaderText="Type" ReadOnly="True" />
                    <asp:BoundField DataField="equip_brand" HeaderText="Brand" ReadOnly="True" />
                    <asp:BoundField DataField="equip_model" HeaderText="Model" ReadOnly="True" />
                    <asp:BoundField DataField="equip_funct" HeaderText="Purpose" ReadOnly="True" />
                    <asp:BoundField DataField="equip_qty" HeaderText="Qty" ReadOnly="True" />
                    <asp:BoundField DataField="equip_ppd" HeaderText="Rent Price" ReadOnly="True" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="No_Equ" runat="server" Text=""></asp:Label>
        </div>

        <div class="right-container">
            <div class="form-container">
                <div class="evt-container-line">
                    <h3 class="header-title">Add Equipment</h3>
                </div>
                Select Equipment Type<asp:RequiredFieldValidator ID="rfv_equipType" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_type" ValidationGroup="add"/><br />

                <asp:DropDownList ID="equip_type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_typeChange" CssClass="input-field">
                    <asp:ListItem Value="0">-- Select Equipment Type --</asp:ListItem>
                    <asp:ListItem Value="Lights">Lights</asp:ListItem>
                    <asp:ListItem Value="Sounds">Sounds</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                </asp:DropDownList><br />

                Enter Brand<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_brand" ValidationGroup="add" /><br />
                <asp:TextBox ID="equip_brand" runat="server" CssClass="input-field"></asp:TextBox><br />

                Enter Model<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_model"  ValidationGroup="add"/><br />
                <asp:TextBox ID="equip_model" runat="server" CssClass="input-field"></asp:TextBox><br />

                Date of Acquisation<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_acq" ValidationGroup="add" /><br />
                <asp:TextBox ID="equip_acq" runat="server" TextMode="Date" CssClass="input-field date"></asp:TextBox><br />

                Enter Quantity<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_quant"  ValidationGroup="add"/><br />
                <asp:TextBox ID="equip_quant" runat="server" TextMode="Number" CssClass="input-field"></asp:TextBox><br />

                Enter Price Per Day<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_ppd"  ValidationGroup="add"/><br />
                <asp:TextBox ID="equip_ppd" runat="server" TextMode="Number" CssClass="input-field"></asp:TextBox><br />

                Enter Equipment Function<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_purpose" ValidationGroup="add"/><br />
                <asp:DropDownList ID="equip_purpose" runat="server" AutoPostBack="true" CssClass="input-field">
                    <asp:ListItem Value="0">-- Select Equipment Type --</asp:ListItem>
                </asp:DropDownList>

                <div class="btn-container">
                    <asp:Button ID="submit" runat="server" Text="Submit" OnClick="submit_Click" CssClass="btn" ValidationGroup="add"/>
                </div>
            </div>

            <div class="form-container">
                <div class="evt-container-line">
                    <h3 class="header-title">Edit Equipment</h3>
                </div>
                
                Equipment ID<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_ID"  ValidationGroup="update"/><br />
                <asp:TextBox ID="edit_ID" runat="server" CssClass="input-field" Enabled="false"></asp:TextBox><br />

                Select Equipment Type<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="equip_type"  ValidationGroup="update"/><br />

                <asp:DropDownList ID="edit_type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_typeEdit" CssClass="input-field">
                    <asp:ListItem Value="0">-- Select Equipment Type --</asp:ListItem>
                    <asp:ListItem Value="Lights">Lights</asp:ListItem>
                    <asp:ListItem Value="Sounds">Sounds</asp:ListItem>
                    <asp:ListItem Value="Others">Others</asp:ListItem>
                </asp:DropDownList><br />

                Enter Brand<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_brand" ValidationGroup="update" /><br />
                <asp:TextBox ID="edit_brand" runat="server" CssClass="input-field"></asp:TextBox><br />

                Enter Model<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_model"  ValidationGroup="update"/><br />
                <asp:TextBox ID="edit_model" runat="server" CssClass="input-field"></asp:TextBox><br />

                Date of Acquisation<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_acq"  ValidationGroup="update"/><br />
                <asp:TextBox ID="edit_acq" runat="server" TextMode="Date" CssClass="input-field date"></asp:TextBox><br />

                Enter Quantity<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_quant"  ValidationGroup="update"/><br />
                <asp:TextBox ID="edit_quant" runat="server" TextMode="Number" CssClass="input-field"></asp:TextBox><br />

                Enter Price Per Day<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_ppd"  ValidationGroup="update"/><br />
                <asp:TextBox ID="edit_ppd" runat="server" TextMode="Number" CssClass="input-field"></asp:TextBox><br />

                Enter Equipment Function<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="edit_func"  ValidationGroup="update"/><br />
                <asp:DropDownList ID="edit_func" runat="server" AutoPostBack="true" CssClass="input-field">
                    <asp:ListItem Value="0">-- Select Equipment Type --</asp:ListItem>
                </asp:DropDownList>

                <div class="btn-container">
                    <asp:Button ID="Button1" runat="server" Text="Save" OnClick="save_Click" CssClass="btn"  ValidationGroup="update"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
