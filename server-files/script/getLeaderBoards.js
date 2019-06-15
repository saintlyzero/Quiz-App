$.ajax({
    url: "http://localhost/quiz-app/getQuestions.php",
    type: 'GET',
    success: function(res) {
        console.log(res);
        alert(res);
    }
});