<%@ Page Title="" Language="C#" MasterPageFile="~/StaffMasterPage.Master" AutoEventWireup="true" CodeBehind="Event-Management.aspx.cs" Inherits="IT114L_G2_MP.Event_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css\events.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gridviewcontainer"> 
        <div class="heading_container">
            <h3>My Events</h3>
             <div class="evt-container-line"></div>
        </div>

        <center>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" EnableViewState="true">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="Booking ID" />
                <asp:BoundField DataField="Event_Name" HeaderText="Event Name" />
                <asp:BoundField DataField="Date" HeaderText="Event Date" />
                <asp:BoundField DataField="PAX" HeaderText="PAX" />
                <asp:BoundField DataField="team_name" HeaderText="Team" />
                <asp:BoundField DataField="STATUS" HeaderText="Status" />
            </Columns>
        </asp:GridView>
        </center>

        <center><asp:Label runat="server" ID="No_Events" style="text-align: center; margin: auto; font-size: 40px; font-weight: bold; color: gray;"></asp:Label></center>
    </div>

    <div class="event_details">
        <div class="heading_container">
            <h3>Event Details</h3>
            <div class="evt-container-line"></div>
        </div>
        
        <div class="container">
            <h4>Customer Information</h4>
            <center><hr style="width:95%"/></center>
            <div class="content">
                <div class="left">
                    <div class="prompt">
                        Booking ID<br />
                        <asp:TextBox ID="booking_ID" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    
                    <div class="prompt">
                        Email <br />
                        <asp:TextBox ID="custemail" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        Company Name <br />
                        <asp:TextBox ID="compname" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div> 
                </div>

                <div class="right">
                    <div class="prompt">
                        Customer Name <br />
                        <asp:TextBox ID="custname" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        Phone Number <br />
                        <asp:TextBox ID="p_number" runat="server" Width="90%" Height="40px" TextMode="Phone" MaxLength="11" CssClass="textprompt" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        Business Number <br />
                        <asp:TextBox ID="b_number" runat="server" Width="90%" Height="40px" TextMode="Phone" MaxLength="11" CssClass="textprompt" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <h4>Event Location</h4>
            <center><hr style="width:95%"/></center>

            <div class="content">
                <div class="left">
                    <div class="prompt">
                        Region <br />
                        <asp:TextBox ID="region" runat="server" Width="90%" Height="40px" CssClass="textbox" Enabled="false"></asp:TextBox>
                    </div>
                    
                    <div class="prompt">
                        City <br />
                        <asp:TextBox ID="city" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        Address <br />
                        <asp:TextBox ID="addr" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                </div>

                <div class="right">
                    <div class="prompt">
                        Province <br />
                        <asp:TextBox ID="province" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        Barangay <br />
                        <asp:TextBox ID="brgy" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <h4>Event Information</h4>
            <center><hr style="width:95%"/></center>

            <div class="content">
                <div class="left">
                    <div class="prompt">
                        Event Name <br />
                        <asp:TextBox ID="ev_name" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    
                    <div class="prompt">
                        Event Date <br />
                        <asp:TextBox ID="ev_date" runat="server" Width="90%" Height="40px" TextMode="Date" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        <label for="discount_ddl">Downpayment</label>
                        <asp:TextBox runat="server" ID="dp" Width="90%" Height="40px" TextMode="Number" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        Total Fee <br />
                        <asp:TextBox ID="total_fee" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                </div>

                <div class="right">
                    <div class="prompt">
                        Event Type <br />
                        <asp:TextBox ID="ev_type" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                    <div class="prompt">
                        PAX <br />
                        <asp:TextBox ID="ev_pax" runat="server" Width="90%" Height="40px" TextMode="Number" Enabled="false"></asp:TextBox>
                    </div>
                    
                    <div class="prompt">
                        Package ID <br />
                        <asp:TextBox ID="packageid" runat="server" Width="90%" Height="40px" Enabled="false"></asp:TextBox>
                    </div>
                </div>
            </div>
            <center><hr style="width:95%;" /></center>

            <div class="content3">
                <div class="dropdown-group">
                    <label for="teamDDL_ddl">Team Name</label>
                    <div class="dropdown-group">
                        <asp:DropDownList runat="server" ID="teamDDL" CssClass="ddl" AutoPostBack="true" OnSelectedIndexChanged="teamDDL_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="dropdown-group">
                    <label for="discount_ddl">Discount</label>
                    <asp:DropDownList runat="server" ID="discount_ddls" CssClass="ddl" OnSelectedIndexChanged="discount_ddl_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="0.00">None</asp:ListItem>
                        <asp:ListItem Value="0.05">Loyalty Discount (5%)</asp:ListItem>
                        <asp:ListItem Value="0.10">Partnership Discount (10%)</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <div class="dropdown-group">
                    <label for="bookStatus">Booking Status</label>
                    <asp:DropDownList ID="bookStatus" runat="server" CssClass="ddl">
                        <asp:ListItem Value="">Empty</asp:ListItem>
                        <asp:ListItem Value="Pending">Pending</asp:ListItem>
                        <asp:ListItem Value="Approved">Approved</asp:ListItem>
                        <asp:ListItem Value="Disapproved">Disapproved</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="button-container">
                <center>
                    <asp:Button ID="clear_btn" runat="server" Text="Clear" CssClass="button" BackColor="Red" ForeColor="White" Type="Clear" OnClick="clear_btn_Click"/>
                    <asp:Button ID="save_btn" runat="server" Text="Save" CssClass="button" BackColor="Green" ForeColor="White" Type="Submit" OnClick="save_btn_Click"/>
                </center>
            </div>
        </div>
    </div>
</asp:Content>
