
document.addEventListener('DOMContentLoaded', function () {
    const menuToggle = document.getElementById('menu-toggle');
    const navMenu = document.getElementById('nav-menu');

    menuToggle.addEventListener('click', function () {
        navMenu.classList.toggle('active');
    });


    const navLinks = document.querySelectorAll('.nav-links a');
    navLinks.forEach(link => {
        link.addEventListener('click', function () {
            navLinks.forEach(item => item.classList.remove('active'));
            this.classList.add('active');
        });
    });


    const carouselOptions = {
        interval: 5000,
        wrap: true,
        keyboard: true,
        pause: 'hover',
        touch: true
    };

    //para sa caoursel
    const lightingCarousel = new bootstrap.Carousel(document.getElementById('lightingCarousel'), carouselOptions);
    const soundCarousel = new bootstrap.Carousel(document.getElementById('soundCarousel'), carouselOptions);
    const specialEventsCarousel = new bootstrap.Carousel(document.getElementById('specialEventsCarousel'), carouselOptions);

    // scrolling
    function animateOnScroll() {
        const contactCards = document.querySelectorAll('.contact-card');

        contactCards.forEach(card => {
            const cardPosition = card.getBoundingClientRect().top;
            const screenPosition = window.innerHeight / 1.3;

            if (cardPosition < screenPosition) {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }
        });
    }

    //cards
    const contactCards = document.querySelectorAll('.contact-card');
    contactCards.forEach(card => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(20px)';
        card.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    });


    window.addEventListener('scroll', animateOnScroll);
    animateOnScroll(); // Run once on page load
});
