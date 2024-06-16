let jwt = localStorage.getItem("jwt")

if(jwt != null){
    window.location.href = '/sec/fronend/home'
}

function login(){
    const username = document.getElementById("username");
    const password = document.getElementById("password");

    const xhttp = new XMLHttpRequest();
    xhttp .open("POST", "http://127.0.0.1:8080/login");
    xhttp.setRequestHeader("Content-Type", "application/json;charser=UTF-8");
    xhttp.send(JSON.stringify({
        "username": username,
        "password":password
    }));
    xhttp.onreadystatechange = function(){
        if(this.readyState == 4){
            const objects = JSON.parse(this.responseText);
            console.log(objects);
        }
    }
    return false;
}