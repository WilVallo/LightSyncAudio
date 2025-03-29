<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="IT114L_G2_MP.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/about.css" rel="stylesheet" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="banner-container">
        <asp:Image runat="server" ImageUrl="~/img/about-banner.jpg" CssClass="home-banner" />
        <div class="overlay-text">
            <h3>About Light Sync Audio</h3>
            <p>Premier Lighting & Sound solutions for unforgettable events. Brilliant visuals, flawless audio—experience perfection!</p>
        </div>

        <div class="overlay-content">
            <div class="cards-container">
                <div class="card mission">
                    <div class="evt-container-line"></div>
                    <h3>MISSION</h3>
                    <p>To provide high-quality, reliable, and innovative light and sound solutions that enhance events and create unforgettable experiences.</p>
                    <div class="evt-container-line"></div>
                </div>
                <div class="card vision">
                    <div class="evt-container-line line-vision"></div>
                    <h3>VISION</h3>
                    <p>To be the leading provider of cutting-edge lighting and sound services, transforming every event into a spectacular and immersive experience.</p>
                    <div class="evt-container-line line-vision"></div>
                </div>
                <div class="evt-container-line"></div>
            </div>
        </div>
    </div>
    <div class="history-section">
        <div class="body-content ">
            <h3>Our <span class="red">History</span></h3>
            <p>From a simple rental service to a leading events production provider, LightSyncAudio continues to grow, bringing unforgettable experiences to every event it touches. LightSyncAudio Lights and Sounds was founded in 2020 by Wil Vallo, a Computer Science student from Mapua Malayan Colleges Laguna. His passion for music led him to perform at major school events, local bars, and private gigs across Laguna and Manila. </p>
            <p>As a multi-instrumentalist, he had amassed a collection of professional audio and lighting equipment, but when the pandemic hit, his gear sat unused. Rather than letting it go to waste, he saw an opportunity—turning his passion into a business by offering rental services.</p>

        </div>



        <div class="photo-container">
            <div class="photo-grid">
                <asp:Image runat="server" ImageUrl="~/img/About1.png" CssClass="big-photo"/>
                <div class="small-photos">
                    <asp:Image runat="server" ImageUrl="~/img/About2.png"/>
                    <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1678967630352-c40c4b2960b8?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
                </div>
            </div>
        </div>

        <div class="timeline-section">
            <div class="timeline-entry">
                <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1546961329-78bef0414d7c?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" CssClass="timeline-img"/>
                <div class="timeline-content">
                    <h3>2012–2014</h3>
                    <p>
                        In its first few years, LightSyncAudio steadily built a reputation, securing bookings for intimate gatherings, corporate functions, and small-scale private events. With growing demand, Wil reinvested in state-of-the-art equipment, expanding both his inventory and his team. This allowed the company to handle multiple events in a day. As word spread, the company grew its community, onboarding more than 20 employees who helped deliver exceptional event experiences. By this time, LightSyncAudio was capable of handling regional expos, beauty pageants, weddings, and live band performances.
                    </p>
                </div>
            </div>

            <div class="timeline-entry">
                <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" CssClass="timeline-img"/>
                <div class="timeline-content">
                    <h3>2014-2019</h3>
                    <p>
                       By 2024, LightSyncAudio had expanded its reach across Region IV, further upgrading its inventory to meet the needs of larger-scale productions. With over 50 employees, the company could now cater to major events, including political rallies, grand fiestas, large-scale concerts, and high-profile pageants.
                    </p>
                </div>
            </div>

                <div class="timeline-entry">
                <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" CssClass="timeline-img"/>
                <div class="timeline-content">
                    <h3>Present</h3>
                    <p>
                      With its growing success, LightSyncAudio took a major step forward in 2025 by allocating a budget to develop its official website. Designed to enhance customer experience, the website will allow clients to book services seamlessly, customize event requirements, and receive instant quotations—all with just a few clicks. The system is currently in its early development phase, with a projected launch in the second quarter of the year. This digital transformation will streamline the booking process and reinforce LightSyncAudio’s commitment to innovation and customer convenience.
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>