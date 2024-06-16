var jwt = localStorage.getItem("jwt");

if(jwt == null){
    window.location.href ='http://127.0.0.1:5500/sec/fronend/login_web/index.html'
}

function login() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
  
    const xhttp = new XMLHttpRequest();
    xhttp.open("POST", "http://127.0.0.1:8080/login");
    xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhttp.send(JSON.stringify({
      "username": username,
      "password": password
    }));
    xhttp.onreadystatechange = function () {
      if (this.readyState == 4) {
        const objects = JSON.parse(this.responseText);
        console.log(objects);
        if (objects['status'] == 'OK') { // Corrected to uppercase 'OK'
          localStorage.setItem("jwt", objects['accessToken']);
          Swal.fire({
            text: objects['message'],
            icon: 'success'
          }).then((result) => {
            if (result.isConfirmed) { // Corrected from 'isConfirmd' to 'isConfirmed'
              window.location.href = 'http://127.0.0.1:5500/sec/fronend/home/index.html';
            }
          });
        } else {
          Swal.fire(
            objects['status'],
            objects['message'],
            'error'
          );
        }
      }
    };
    return false;
  }

  
  function logout(){
    localStorage.removeItem("jwt");
    window.location.href= "http://127.0.0.1:5500/sec/fronend/login_web/index.html";
  }