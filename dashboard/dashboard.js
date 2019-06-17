// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

console.log('in my js file')
    // Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function nav_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidebar with the close button
function nav_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}

// function leaderboard()
// {
//     document.getElementById("main-block").style.display = 'none';
//     document.getElementById("leaderboards-block").style.display = 'block';
//     document.getElementById("quiz-block").style.display = 'none';


//     $.ajax({
//         url: 'http://localhost/quiz-app/leaderBoards.php',
//         type: 'GET',
//         dataType:'json',
//         // data: { "username": readCookie('username') },
//         success: function(response) { 
//         console.log(response);
//         res_json = response;//JSON.parse(JSON.stringify(response));
//         if (res_json["status"] == 1)
//         {
//         console.log(res_json);
//         }
//         else
//         {
//         console.log(res_json['message']);
//         }
//         },
//         error: function(data){
//         console.log(data);
//         console.log("Error in api call of get score for user.");
//         }
//         });

// }
function dashboard()
{
    document.getElementById("main-block").style.display = 'block';
    document.getElementById("leaderboards-block").style.display = 'none';
    document.getElementById("quiz-block").style.display = 'none';
}
function loadQuiz(category)
{
    document.getElementById("main-block").style.display = 'none';
    document.getElementById("leaderboards-block").style.display = 'none';
    document.getElementById("quiz-block").style.display = 'block';
    
        // Get value from input element on the page
        var numValue = $("#num").val();
       
        // Send the input data to the server using get
        $.post("http://localhost/quiz-app/getQuestions.php", {username: 'abc',topic:'aptitude'} , function(data){
            // Display the returned data in browser
            console.log(data);
            // $("#result").html(data);
        });
   
    
}