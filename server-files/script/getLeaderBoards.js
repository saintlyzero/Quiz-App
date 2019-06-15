$('.button-login').click(function(){
console.log($("#username").val());
$.ajax({
url: 'http://localhost/quiz-app/login.php',
type: 'POST',
dataType:'json',
data: { "username": $("#username").val(),"password": $("#password").val() },
success: function(response) {
console.log(response);
var res_json = JSON.parse(JSON.stringify(response));
if (res_json["status"] == 1)
{
console.log(res_json["username"]);
window.location = "dashboard/dashboard.html";
}
else
{
alert('Invalid Credentials!');
}

},
error: function(data){
console.log(data);
console.log("Error in api call.");
}
});
});
