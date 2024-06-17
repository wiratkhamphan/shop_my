function loadUser() {
  var jwt = localStorage.getItem("jwt");

  if (jwt == null) {
      window.location.href = 'http://127.0.0.1:5500/sec/fronend/login_web/index.html';
      return;
  }

  const xhttp = new XMLHttpRequest();
  xhttp.open("GET", "http://127.0.0.1:8080/login/user", true);
  xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  xhttp.setRequestHeader("Authorization", "Bearer " + jwt);
  xhttp.send();
  xhttp.onreadystatechange = function() {
      if (this.readyState == 4) {
          if (this.status == 200) {
              const response = JSON.parse(this.responseText);
              console.log(response);
              if (response.status === 'ok') {
                  const user = response.user;
                  document.getElementById("fname").innerHTML = user.fname;
                  document.getElementById("username").innerHTML = user.username;
              }
          } else {
              console.error('Error loading user data', this.responseText);
              if (this.status === 401 || this.status === 403) {
                  logout();
              }
          }
      }
  };
}

function logout() {
  localStorage.removeItem("jwt");
  window.location.href = "http://127.0.0.1:5500/sec/fronend/login_web/index.html";
}

loadUser();
