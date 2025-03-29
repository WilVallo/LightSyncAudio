<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="IT114L_G2_MP.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Css/contactcss.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Page Header -->
    <div class="page-header">
        <div class="container">
            <h1>Get In Touch</h1>
            <p>We'd love to hear from you. Whether you have a question about our services, pricing, or anything else, our team is ready to answer all your questions.</p>
        </div>
    </div>
    
    <!-- Contact Cards Section -->
    <section class="contact-section">
        <div class="container">
            <h2 class="section-title">Contact Information</h2>
            <div class="contact-cards">
                <div class="contact-card">
                    <i class="bi bi-headset contact-icon"></i>
                    <h3>Customer Care</h3>
                    <div class="contact-item">
                        <i class="bi bi-telephone-fill"></i>
                        <span>+63 917 248 2837</span>
                    </div>
                    <div class="contact-item">
                        <i class="bi bi-envelope-fill"></i>
                        <span>lightsynaudio@gmail.com</span>
                    </div>
                </div>

                <div class="contact-card">
                    <i class="bi bi-building contact-icon"></i>
                    <h3>Office</h3>
                    <p>Unit 203, ABC Business Center</p>
                    <p>National Highway, Brgy.</p>
                    <p>Balibago Santa Rosa, Laguna</p>
                    <p>4026 Philippines</p>
                </div>
                
                <div class="contact-card">
                    <i class="bi bi-clock contact-icon"></i>
                    <h3>Business Hours</h3>
                    <div class="contact-item">
                        <i class="bi bi-calendar-check"></i>
                        <span>Monday - Friday: 9AM - 6PM</span>
                    </div>
                    <div class="contact-item">
                        <i class="bi bi-calendar-check"></i>
                        <span>Saturday: 9AM - 1PM</span>
                    </div>
                    <div class="contact-item">
                        <i class="bi bi-calendar-x"></i>
                        <span>Sunday: Closed</span>
                    </div>
                </div>
            </div>
            <!-- Map Section -->
<h2 class="section-title">Find Us</h2>
<div class="map-container">
    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3866.6904340422584!2d121.10675731483823!3d14.282493989994283!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397d9a2f0c7e2ef%3A0x2e01b8b00b9ebc48!2sBalibago%2C%20Santa%20Rosa%2C%20Laguna!5e0!3m2!1sen!2sph!4v1648123456789!5m2!1sen!2sph" allowfullscreen="" loading="lazy"></iframe>
</div>
            
            <!-- FAQ Section -->
<h2 class="section-title">Frequently Asked Questions</h2>
<div class="faq-section">
    <div class="accordion" id="faqAccordion">
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingOne">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                    What services do you offer?
                </button>
            </h2>
            <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    We offer a comprehensive range of audio and lighting equipment rental services for events of all sizes. Our services include sound systems, lighting setups, DJ equipment, and complete event production packages.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingTwo">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                    How far in advance should I book equipment?
                </button>
            </h2>
            <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    We recommend booking at least 2-4 weeks in advance for regular events, and 1-3 months for large events or during peak season (holidays, graduation season, etc.) to ensure availability of your preferred equipment.
                </div>
            </div>
        </div>
        <div class="accordion-item">
            <h2 class="accordion-header" id="headingThree">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                    Do you provide setup and technical support?
                </button>
            </h2>
            <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                <div class="accordion-body">
                    Yes, we provide professional setup and technical support for all our equipment rentals. Our experienced technicians will ensure everything is properly installed and functioning before your event, and can remain on-site for technical support throughout your event if needed.
                </div>
            </div>
        </div>
    </div>
</div>
          
            
        
         
            
            
        </div>
    </section>
</asp:Content>

