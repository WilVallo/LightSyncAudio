<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="IT114L_G2_MP.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/homepagecss.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Hero Banner Section -->
    <div class="banner-container">
        <asp:Image runat="server" ImageUrl="~/img/home-banner.jpg" CssClass="home-banner" />
    
        <div class="overlay-content">
            <asp:Image runat="server" ImageUrl="~/img/front-banner-logo.png" CssClass="home-banner-logo"/>
            <h2 class="banner-tagline">Premium Audio & Lighting Solutions</h2>
            <asp:Button runat="server" Text="Book Now" CssClass="banner-button" PostBackUrl="~/Booking.aspx" />
        </div>
    </div>

    <!-- Services Section -->
    <section class="services-section">
        <div class="section-container">
            <div class="section-header">
                <h2>Our Services</h2>
                <p>Professional audio and lighting solutions for any event</p>
            </div>
            
            <div class="services-grid">
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-music"></i>
                    </div>
                    <h3>Sound Systems</h3>
                    <p>Professional audio equipment for concerts, corporate events, and private parties.</p>
                </div>
                
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-lightbulb"></i>
                    </div>
                    <h3>Lighting Solutions</h3>
                    <p>Create the perfect atmosphere with our premium lighting equipment and effects.</p>
                </div>
                
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-microphone-alt"></i>
                    </div>
                    <h3>DJ Equipment</h3>
                    <p>Complete DJ setups with mixers, controllers, and professional-grade accessories.</p>
                </div>
                
                <div class="service-card">
                    <div class="service-icon">
                        <i class="fas fa-cogs"></i>
                    </div>
                    <h3>Technical Support</h3>
                    <p>Expert technicians available to ensure your event runs smoothly from setup to teardown.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- About Us Section -->
    <section class="about-section">
        <div class="section-container">
            <div class="about-content">
                <div class="about-text">
                    <div class="section-header left-aligned">
                        <h2>About LightSync Audio</h2>
                        <p>Your premier audio and lighting equipment provider</p>
                    </div>
                    <p>From a simple rental service to a leading events production provider, LightSyncAudio continues to grow, bringing unforgettable experiences to every event it touches. LightSyncAudio Lights and Sounds was founded in 2020 by Wil Vallo, a Computer Science student from Mapua Malayan Colleges Laguna. His passion for music led him to perform at major school events, local bars, and private gigs across Laguna and Manila. </p>
                    <p>As a multi-instrumentalist, he had amassed a collection of professional audio and lighting equipment, but when the pandemic hit, his gear sat unused. Rather than letting it go to waste, he saw an opportunity—turning his passion into a business by offering rental services.</p>
                    <asp:Button runat="server" Text="Learn More" CssClass="secondary-button" PostBackUrl="~/About.aspx" />
                </div>
                <div class="about-image">
                    <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1438557068880-c5f474830377?q=80&w=2073&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" AlternateText="About Us" CssClass="about-img" />
                </div>
            </div>
        </div>
    </section>

    
    <!-- Testimonials Section -->
    <section class="testimonials-section">
        <div class="section-container">
            <div class="section-header">
                <h2>What Our Clients Say</h2>
                <p>Hear from those who have experienced our services</p>
            </div>
            
            <div class="testimonials-grid">
                <div class="testimonial-card">
                    <div class="testimonial-content">
                        <div class="quote-icon"><i class="fas fa-quote-left"></i></div>
                        <p>LightSync Audio provided exceptional service for our corporate event. The sound quality was impeccable, and the lighting created the perfect atmosphere. Highly recommended!</p>
                        <div class="testimonial-rating pad">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1640960543409-dbe56ccc30e2?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" AlternateText="ea" />
                        </div>
                        <div class="author-info">
                            <h4>Will</h4>
                            <p>Event Manager, TechCorp</p>
                        </div>
                    </div>
                </div>
                
                <div class="testimonial-card">
                    <div class="testimonial-content">
                        <div class="quote-icon"><i class="fas fa-quote-left"></i></div>
                        <p>As a wedding DJ, I regularly rent equipment from LightSync Audio. Their gear is always in perfect condition, and their team is incredibly helpful with setup and technical support.</p>
                        <div class="testimonial-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                                                        <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" AlternateText="wil" />
                        </div>
                        <div class="author-info">
                            <h4>Earl</h4>
                            <p>Professional DJ</p>
                        </div>
                    </div>
                </div>
                
                <div class="testimonial-card">
                    <div class="testimonial-content">
                        <div class="quote-icon"><i class="fas fa-quote-left"></i></div>
                        <p>We used LightSync Audio for our music festival, and they exceeded all expectations. Their team handled everything professionally, and the sound quality was outstanding even in our challenging outdoor venue.</p>
                        <div class="testimonial-rating">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                    <div class="testimonial-author">
                        <div class="author-image">
                            <asp:Image runat="server" ImageUrl="https://images.unsplash.com/photo-1640951613773-54706e06851d?q=80&w=2080&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" AlternateText="mc" />
                        </div>
                        <div class="author-info">
                            <h4>Mikael</h4>
                            <p>Festival Organizer</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="section-container">
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-calendar-check"></i>
                    </div>
                    <div class="stat-number">500+</div>
                    <div class="stat-label">Events Serviced</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-number">200+</div>
                    <div class="stat-label">Happy Clients</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-truck"></i>
                    </div>
                    <div class="stat-number">1000+</div>
                    <div class="stat-label">Equipment Items</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-award"></i>
                    </div>
                    <div class="stat-number">5+</div>
                    <div class="stat-label">Years Experience</div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="section-container">
            <div class="cta-content">
                <h2>Ready to Make Your Event Unforgettable?</h2>
                <p>Contact us today to discuss your audio and lighting needs. Our team is ready to help you create the perfect atmosphere for your next event.</p>
                <div class="cta-buttons">
                    <asp:Button runat="server" Text="Book Now" CssClass="banner-button" PostBackUrl="~/Booking.aspx" />
                    <asp:Button runat="server" Text="Contact Us" CssClass="secondary-button" PostBackUrl="~/Contact.aspx" />
                </div>
            </div>
        </div>
    </section>

</asp:Content>

