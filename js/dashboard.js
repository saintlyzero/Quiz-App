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

function leaderboard()
{
    document.getElementById("main-block").style.display = 'none';
    document.getElementById("leaderboards-block").style.display = 'block';
    document.getElementById("quiz-block").style.display = 'none';

}
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
    
}