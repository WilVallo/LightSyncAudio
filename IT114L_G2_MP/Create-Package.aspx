<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="Create-Package.aspx.cs" Inherits="IT114L_G2_MP.Create_Package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/packages.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="page">
        <div class="create-package-container">
            <div class="left-container">
                <div class="package-information">
                    <center><h2>Package Information</h2></center>
                    <asp:TextBox runat="server" ID="package_name" placeholder="Package Name" CssClass="textbox" MaxLength="100"></asp:TextBox>
                    <div class="button-container">
                        <asp:Button runat="server" ID="createNew" Text="Create New" OnClick="createNew_Click" CssClass="button" />
                    </div>
                    <asp:TextBox runat="server" ID="packageID" placeholder="Package ID" CssClass="textbox" MaxLength="100" Enabled="false"></asp:TextBox>
                    <asp:TextBox runat="server" ID="packagePrice" placeholder="Price" CssClass="textbox" MaxLength="8" Enabled="true" TextMode="Number"></asp:TextBox>
                    <asp:Button ID="update" runat="server" Text="Update Price" CssClass="button" OnClick="price_Click"/>
                </div>

                <div class="select-package-container">
                    <center><h2>Select Equipment</h2></center>

                    <asp:DropDownList ID="ddlItemType" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlItemType_SelectedIndexChanged">
                        <asp:ListItem Value="0">-- Select Type --</asp:ListItem>
                        <asp:ListItem Value="Lights">Lights</asp:ListItem>
                        <asp:ListItem Value="Sounds">Sounds</asp:ListItem>
                        <asp:ListItem Value="Others">Others</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlPurpose" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlPurpose_SelectedIndexChanged">
                        <asp:ListItem Value="0">-- Select Purpose --</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlItemBrand" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlItemBrand_SelectedIndexChanged">
                        <asp:ListItem Value="0">-- Select Brand --</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlItemModel" runat="server" AutoPostBack="true" CssClass="ddl" OnSelectedIndexChanged="ddlItemModel_SelectedIndexChanged">
                        <asp:ListItem Value="0">-- Select Model --</asp:ListItem>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddlItemQty" runat="server" AutoPostBack="true" CssClass="ddl">
                        <asp:ListItem Value="0">-- Select Quantity --</asp:ListItem>
                    </asp:DropDownList>

                    <div class="button-container">
                        <asp:Button ID="addbtn" runat="server" Text="Add" CssClass="button" OnClick="addbtn_Click"/>
                        <asp:Button ID="clearbtn" runat="server" Text="Clear" CssClass="button" OnClick="clearbtn_Click" />
                    </div>
                </div>

                <div class="select-package_gridview">
                    <center><h2>Package Lists</h2></center>
                    <asp:GridView ID="gvPackages" runat="server" AutoGenerateColumns="False" CssClass="gridview" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvPackages_SelectedIndexChanged" OnRowDeleting="gvPackages_RowDeleting" DataKeyNames="package_id">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" SelectText="View" />
                            <asp:BoundField DataField="package_id" HeaderText="Package ID" ReadOnly="True" />
                            <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <div class="view-package-items-container">
                <center><h2>Package Content</h2></center>
                <asp:GridView ID="gvEquipment" runat="server" AutoGenerateColumns="False"
                    CssClass="gridview" ShowHeaderWhenEmpty="True" OnRowCommand="gvEquipment_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="Type" HeaderText="Type" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" />
                        <asp:BoundField DataField="Model" HeaderText="Model" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnDelete" runat="server" 
                                    CommandName="DeleteItem" 
                                    CommandArgument="<%# Container.DataItemIndex %>"
                                    Text="Delete" 
                                    CssClass="delete-button" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <div class="view-available-packages-container">
        </div>
    </div>
</asp:Content>

