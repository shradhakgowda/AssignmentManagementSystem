body, html {
    height: 100%;
    margin: 0;
}

.hero {
    background-image: url('homebackground.jpeg') no-repeat center center;
    background-size: cover;
    height: 100vh;
    color: rgb(255, 255, 255);
}
.navbar {
    background: rgba(150, 146, 146, 0.5);
    position: fixed; 
    width: 100%; 
    top: 0;
    z-index: 1000; 
    border-radius: 0 0 15px 15px;
}


.hero .display-4 {
    font-weight: bold;
    text-transform: uppercase;
    margin-bottom: 20px;
    
}

.hero .lead {
    margin-bottom: 30px;
    font-size: 1.2rem;
}

.btn-light {
    background-color: white;
    color: black;
}

.btn-light:hover {
    background-color: #f8f9fa;
    color: black;
}