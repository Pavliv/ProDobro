function validatePassword() {
  var pass1 = document.getElementById('password1').value;
  var pass2 = document.getElementById('password2').value;
  if(pass1 !== pass2) {
    document.getElementById('password2').setCustomValidity('Passwords don\'t match');
  } else {
    document.getElementById('password2').setCustomValidity('');
  }
}
window.onload = function () {
  document.getElementById('password1').onchange = validatePassword;
  document.getElementById('password2').onchange = validatePassword;
};

window.addEventListener('load', function(){
  var user_roles = document.getElementById('user_roles')
  if (user_roles){
    user_roles.className += 'form-control';
  }
});
