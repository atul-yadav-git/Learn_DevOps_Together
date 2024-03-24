document.addEventListener("DOMContentLoaded", function() {
    const githubLogo = document.querySelector('img[alt="GitHub Logo"]');

    if (githubLogo) {
        githubLogo.addEventListener("load", function() {
            // Code for dynamic movement (image rotation)
            setInterval(() => {
                githubLogo.style.transform = `rotate(${Math.random() * 360}deg)`;
            }, 2000); // Change the number for faster or slower rotation (in milliseconds)
        });
        githubLogo.setAttribute("src", "https://live.staticflickr.com/5622/22160892602_e5474a698d_w.jpg"); // GitHub logo image URL
    }
});


