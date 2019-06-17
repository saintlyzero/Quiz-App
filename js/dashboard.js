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
// Function that displays the leaderboards tab and hides others
function leaderboard()
{
    console.log('Retrived cookie: '+readCookie('username'));
    document.getElementById("main-block").style.display = 'none';
    document.getElementById("leaderboards-block").style.display = 'block';
    document.getElementById("quiz-block").style.display = 'none';

    let table = document.querySelector('#table-main');
    let rowCount = table.rows.length;
    let tr = table.insertRow();

    // let td1=document.createElement('td');
    // let td1=document.createElement('td');
    // td1 = tr.insertCell(0);
    

    $.ajax({
        url: 'http://localhost/quiz-app/leaderBoards.php',
        type: 'GET',
        dataType:'json',
        // data: { "username": readCookie('username') },
        success: function(response) { 
        console.log(response);
        res_json = response;//JSON.parse(JSON.stringify(response));
        if (res_json.length>1)
        {
          //  var getScores = JSON.parse(res_json);
            for(let i =0;i<res_json.length;i++)
            {
                console.log("parsed: "+res_json[i].username);
                
                let rowCount = table.rows.length;
                let tr = table.insertRow();
                let td1=document.createElement('td'); // TABLE DEFINITION.
                td1=tr.insertCell(0);
                td1.appendChild(document.createTextNode(res_json[i].username));
                let td2=document.createElement('td');
                td2=tr.insertCell(1);
                td2.appendChild(document.createTextNode(res_json[i].score));
               
            }
            
        }
        else
        {
        console.log(res_json['message']);
        }
        },
        error: function(data){
        console.log(data);
        console.log("Error in api call of get score for user.");
        }
       
        });
        


}
// Function that displays the Dashboard tab and hides others
function dashboard()
{
    document.getElementById("main-block").style.display = 'block';
    document.getElementById("leaderboards-block").style.display = 'none';
    document.getElementById("quiz-block").style.display = 'none';
}
// Function that displays the Quiz tab and hides others
function loadQuiz(category)
{
    document.getElementById("main-block").style.display = 'none';
    document.getElementById("leaderboards-block").style.display = 'none';
    document.getElementById("quiz-block").style.display = 'block';
    
}

// Load Scores
function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}
                $(document).ready(function(){
                    console.log('before');
                    console.log(readCookie('username'));
          $("#profile_name").text(readCookie('username'));

//console.log($("#profile_name").text("ANBC"));

    $.ajax({
    url: 'http://localhost/quiz-app/getScore.php',
    type: 'POST',
    dataType:'json',
    data: { "username": readCookie('username') },
    success: function(response) {  
        console.log(response);
        var res_json = JSON.parse(JSON.stringify(response));
        if (res_json["status"] == 1)
        {
            $("#quants").text(res_json['quantitative_score']);
            $("#logic").text(res_json['logical_score']);
            $("#verbal").text(res_json['aptitude_score']);
        }
        else
        {
           console.log(res_json['message']);
        }

    },
    error: function(data){
        console.log(data);
       console.log("Error in api call of get score for user.");
    }
});


        });