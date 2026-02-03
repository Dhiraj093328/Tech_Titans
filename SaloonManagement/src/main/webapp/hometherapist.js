// Navigation active state
document.querySelectorAll('.nav-link').forEach(link => {
    link.addEventListener('click', function(e) {
        // Remove active class from all links
        document.querySelectorAll('.nav-link').forEach(l => {
            l.classList.remove('active');
        });
        
        // Add active class to clicked link
        this.classList.add('active');
    });
});

// Parallax effect on mouse move
document.addEventListener('mousemove', (e) => {
    const mouseX = e.clientX / window.innerWidth;
    const mouseY = e.clientY / window.innerHeight;

    document.querySelectorAll('.orb').forEach((orb, index) => {
        const speed = (index + 1) * 15;
        const x = (mouseX - 0.5) * speed;
        const y = (mouseY - 0.5) * speed;
        
        orb.style.transform = `translate(${x}px, ${y}px)`;
    });
});

// Update time greeting based on actual time
function updateGreeting() {
    const hour = new Date().getHours();
    const greeting = document.querySelector('.time-greeting');
    
    if (hour < 12) {
        greeting.innerHTML = '<span>☀️</span><span>Good Morning, Dhiraj</span>';
    } else if (hour < 18) {
        greeting.innerHTML = '<span>🌤️</span><span>Good Afternoon, Dhiraj</span>';
    } else {
        greeting.innerHTML = '<span>🌙</span><span>Good Evening, Dhiraj</span>';
    }
}

updateGreeting();

// Add click animation to action cards
document.querySelectorAll('.action-card').forEach(card => {
    card.addEventListener('click', function() {
        this.style.transform = 'scale(0.95)';
        setTimeout(() => {
            this.style.transform = '';
        }, 150);
        
        console.log('Action clicked:', this.querySelector('.action-title').textContent);
    });
});

// Animate stats on scroll
const observerOptions = {
    threshold: 0.3,
    rootMargin: '0px'
};

const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

document.querySelectorAll('.stat-card, .action-card').forEach(card => {
    observer.observe(card);
});

// Notification animation
const notificationBtn = document.querySelector('.notification-btn');
notificationBtn.addEventListener('click', function() {
    alert('You have 3 new notifications!');
});

// User avatar click
const userAvatar = document.querySelector('.user-avatar');
userAvatar.addEventListener('click', function() {
    console.log('Profile clicked');
    // You can add profile dropdown logic here
});

// Add ripple effect to cards on click
document.querySelectorAll('.stat-card, .action-card').forEach(card => {
    card.addEventListener('click', function(e) {
        const ripple = document.createElement('div');
        const rect = this.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = e.clientX - rect.left - size / 2;
        const y = e.clientY - rect.top - size / 2;
        
        ripple.style.width = ripple.style.height = size + 'px';
        ripple.style.left = x + 'px';
        ripple.style.top = y + 'px';
        ripple.style.position = 'absolute';
        ripple.style.borderRadius = '50%';
        ripple.style.background = 'rgba(139, 92, 246, 0.3)';
        ripple.style.transform = 'scale(0)';
        ripple.style.pointerEvents = 'none';
        ripple.style.zIndex = '0';
        
        this.appendChild(ripple);
        
        // Animate
        ripple.animate([
            { transform: 'scale(0)', opacity: 1 },
            { transform: 'scale(2)', opacity: 0 }
        ], {
            duration: 600,
            easing: 'ease-out'
        });
        
        setTimeout(() => ripple.remove(), 600);
    });
});

// Animate footer on scroll
const footerObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, {
    threshold: 0.1,
    rootMargin: '0px'
});

const footer = document.querySelector('footer');
if (footer) {
    footer.style.opacity = '0';
    footer.style.transform = 'translateY(30px)';
    footer.style.transition = 'opacity 0.8s ease, transform 0.8s ease';
    footerObserver.observe(footer);
}

// Smooth scroll for footer links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});