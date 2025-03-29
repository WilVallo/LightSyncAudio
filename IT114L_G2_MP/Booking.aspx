<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="IT114L_G2_MP.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/bookcss.css" rel="stylesheet" />
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="booking-con">
        <div class="evt-container-line">
            <h3>Select Package</h3>
        </div>
        <div class="container">
            <asp:DropDownList ID="ddlPackages" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPackages_SelectedIndexChanged" CssClass="form-control">
            </asp:DropDownList>

            <asp:GridView ID="gvPackageContents" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered">
                <Columns>
                    <asp:BoundField DataField="equip_id" HeaderText="Equipment ID" />
                    <asp:BoundField DataField="equip_brand" HeaderText="Brand" />
                    <asp:BoundField DataField="equip_model" HeaderText="Model" />
                    <asp:BoundField DataField="equip_qty" HeaderText="Quantity" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="evt-container-line">
            <h3>Event Details</h3>
        </div>
        <div class="container">
            <div class="booking-input-container">
                <div class="booking-input">
                    <p>Event Name<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="name" ValidationGroup="bookingVal"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="name" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="booking-input">
                    <p>Event Type<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ControlToValidate="evtType" ValidationGroup="bookingVal"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="evtType" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="booking-input-container">
                <div class="booking-input">
                    <p>Number of Attendees<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="numAttendees" ValidationGroup="bookingVal"></asp:RequiredFieldValidator></p>
                    <asp:TextBox ID="numAttendees" runat="server" CssClass="input" TextMode="Number"></asp:TextBox>
                </div>
                <div class="booking-input">
                    <p>Event Date</p>
                     <asp:TextBox ID="bookDate" runat="server" CssClass="input date" TextMode="Date"></asp:TextBox>
                </div>

            </div>

        </div>

        <div class="evt-container-line">
            <h3>Event Location</h3>
        </div>
        <div class="container">
            <div class="booking-input-container">
                <div class="booking-input">
                    <p>Region</p>
                    <asp:TextBox ID="region" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="booking-input">
                    <p>Province</p>
                    <asp:TextBox ID="province" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="booking-input-container">
                <div class="booking-input">
                    <p>City</p>
                    <asp:TextBox ID="city" runat="server" CssClass="input"></asp:TextBox>
                </div>
                <div class="booking-input">
                    <p>Barangay</p>
                    <asp:TextBox ID="barangay" runat="server" CssClass="input"></asp:TextBox>
                </div>
            </div>

            <div class="wide-booking-input">
                <p>Address</p>
                <asp:TextBox ID="address" runat="server" CssClass="wide-input" ></asp:TextBox>
            </div>
        </div>

        <div class="evt-container-line"></div>
        <div class="bold booking-input">
            <p>1. BOOKING AND PAYMENT</p>
            <p>1.1. A booking is considered confirmed only upon receipt of a non-refundable deposit of 50% of the total rental cost.</p>
            <p>1.2. The remaining balance must be settled at least 2 days before the event date unless otherwise agreed.</p>
            <p>1.3. Payments can be made via [Bank Transfer, GCash, Cash, or other agreed methods].</p>
            <p>1.4. Failure to complete payment by the due date may result in cancellation of the booking.</p>
            <br />
            <p>2. CANCELLATION AND REFUND POLICY</p>
            <p>2.1. Cancellations made 3 days before the event will be eligible for a refund of the amount paid, minus the non-refundable deposit.</p>
            <p>2.2. Cancellations made less than 2 days before the event are non-refundable.</p>
            <p>2.3. If the event is postponed, rescheduling is subject to availability and must be requested at least 2 days in advance.</p>
            <br />
            <p>3. EQUIPMENT USAGE AND LIABILITY</p>
            <p>3.1. The rental equipment remains the property of Light Sync Audio and must be used only for the agreed event.</p>
            <p>3.2. The client is responsible for any damage, loss, or theft of the rented equipment during the rental period.</p>
            <p>3.3. In case of damage, repair or replacement costs will be charged to the client.</p>
            <p>3.4. The client must ensure that the venue has proper electrical outlets and sufficient power capacity for the equipment.</p>
            <br />
            <p>4. DELIVERY, SETUP, AND DISMANTLING</p>
            <p>4.1. Delivery and setup will be done at the agreed time and venue. Any last-minute changes must be communicated in advance.</p>
            <p>4.2. The client must provide venue access at the agreed setup time. Delays caused by the venue may result in additional charges.</p>
            <p>4.3. Dismantling and pickup of the equipment will be done immediately after the event unless otherwise arranged.</p>
            <br />
            <p>5. EVENT OPERATION AND TECHNICAL SUPPORT</p>
            <p>5.1. A technical team may be provided to operate the lights and sounds as per the agreed service package.</p>
            <p>5.2. The client must coordinate with the technical team regarding the event program and special effects requirements.</p>
            <p>5.3. The client is not allowed to operate or alter the settings of the rented equipment without permission from Light Sync Audio.</p>
            <br />
            <p>7. AGREEMENT ACCEPTANCE</p>
            <p>7.1. By confirming a booking, the client acknowledges and agrees to these Terms and Conditions.</p>
            <p>7.2. Any modifications to this agreement must be made in writing and approved by both parties.</p>
            <br />
            <p>For inquiries or clarifications, please contact Light Sync Audio at +63 917 248 2837 or email us at lightsyncaudio@gmail.com.</p>

        </div>

        <div class="submit-col">
            <div class="submit">
                <asp:CheckBox ID="CheckBox1" runat="server" />
                <p>I have read and understood the Terms and Conditions of Light Sync Audio and agree to abide by them.</p>
            </div>
            <asp:Button ID="submit" runat="server" Text="Submit" CssClass="submit-btn" OnClick="submit_Click" />
        </div>
    </div>
</asp:Content>
