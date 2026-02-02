// Navigation Functions
function navigateToHome() {
    showNotification('You are already on the Home page', '#ff0096');
}

function navigateToAppointments() {
    showNotification('Navigating to Appointment Requests...', '#8a2be2');
}

function navigateToProfile() {
    showNotification('Navigating to Profile...', '#00bfff');
}

// Enhanced notification system
function showNotification(message, color) {
    const notification = document.createElement('div');
    notification.textContent = message;
    notification.style.cssText = `
        position: fixed;
        top: 100px;
        right: 30px;
        background: linear-gradient(135deg, ${color}, #ff6400);
        color: white;
        padding: 1.5rem 2.5rem;
        border-radius: 50px;
        font-weight: 700;
        font-size: 1.1rem;
        box-shadow: 0 10px 40px ${color}80;
        z-index: 10000;
        animation: slideInRight 0.5s ease, slideOutRight 0.5s ease 2.5s;
        backdrop-filter: blur(10px);
        border: 2px solid rgba(255, 255, 255, 0.3);
    `;
    
    document.body.appendChild(notification);
    
    setTimeout(() => {
        notification.remove();
    }, 3000);
}

// Create sparkle effects
function createSparkles() {
    for(let i = 0; i < 20; i++) {
        const sparkle = document.createElement('div');
        sparkle.className = 'sparkle';
        sparkle.style.left = Math.random() * 100 + '%';
        sparkle.style.top = Math.random() * 100 + '%';
        sparkle.style.animationDelay = Math.random() * 2 + 's';
        document.body.appendChild(sparkle);
    }
}

// Add interactive cursor effect on nav buttons
function addButtonInteractivity() {
    document.querySelectorAll('.nav-menu button').forEach(button => {
        button.addEventListener('mousemove', (e) => {
            const rect = button.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            button.style.setProperty('--mouse-x', `${x}px`);
            button.style.setProperty('--mouse-y', `${y}px`);
        });
    });
}

// Initialize all effects when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    createSparkles();
    addButtonInteractivity();
    
    // Add smooth scroll behavior
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
});

// Optional: Add parallax effect to decorative circles
window.addEventListener('mousemove', (e) => {
    const circles = document.querySelectorAll('.decorative-circle');
    const mouseX = e.clientX / window.innerWidth;
    const mouseY = e.clientY / window.innerHeight;
    
    circles.forEach((circle, index) => {
        const speed = (index + 1) * 20;
        const x = (mouseX - 0.5) * speed;
        const y = (mouseY - 0.5) * speed;
        
        circle.style.transform = `translate(${x}px, ${y}px)`;
    });
});

// Add keyboard navigation support
document.addEventListener('keydown', (e) => {
    if (e.key === 'h' || e.key === 'H') {
        navigateToHome();
    } else if (e.key === 'a' || e.key === 'A') {
        navigateToAppointments();
    } else if (e.key === 'p' || e.key === 'P') {
        navigateToProfile();
    }
});

// Performance optimization: Throttle mouse move events
function throttle(func, delay) {
    let timeoutId;
    let lastExecTime = 0;
    
    return function(...args) {
        const currentTime = Date.now();
        const timeSinceLastExec = currentTime - lastExecTime;
        
        clearTimeout(timeoutId);
        
        if (timeSinceLastExec > delay) {
            func.apply(this, args);
            lastExecTime = currentTime;
        } else {
            timeoutId = setTimeout(() => {
                func.apply(this, args);
                lastExecTime = Date.now();
            }, delay - timeSinceLastExec);
        }
    };
}

// Add loading animation
window.addEventListener('load', () => {
    document.body.style.opacity = '0';
    document.body.style.transition = 'opacity 0.5s ease-in';
    
    setTimeout(() => {
        document.body.style.opacity = '1';
    }, 100);
});

// Console welcome message
console.log('%c🎨 Welcome to Salon Admin Portal! 🎨', 
    'font-size: 20px; font-weight: bold; color: #ff0096; text-shadow: 2px 2px 4px rgba(0,0,0,0.3);'
);
console.log('%cKeyboard Shortcuts:', 
    'font-size: 14px; font-weight: bold; color: #8a2be2;'
);
console.log('%cPress H for Home, A for Appointments, P for Profile', 
    'font-size: 12px; color: #00bfff;'
);