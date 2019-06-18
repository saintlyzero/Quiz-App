(function() {

const onResolved = (resolvedValue) => console.log(resolvedValue);
  
    // <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
var rQuestions;
  //   $.ajax({
  //     url: 'http://localhost/quiz-app/getQuestions.php',
  //     type: 'POST',
  //     //dataType:'json',
  //     data: { "username": readCookie('username'), "topic": "aptitude" },
  //     success: function(response) {  
  //         //console.log(response);
  //          rQuestions = JSON.parse(JSON.stringify(response));
  //          console.log("myqstns "+rQuestions);

        
  //     },
  //     error: function(data){
  //         console.log(data);
  //        console.log("Error in api call of get score for user.");
  //     }
  // });

  const myPromise = new Promise((resolve, reject) => {
    $.ajax({
      url: 'http://localhost/quiz-app/getQuestions.php',
      type: 'POST',
      //dataType:'json',
      data: { "username": readCookie('username'), "topic": "aptitude" },
      success: function(response) {  
          //console.log(response);
           rQuestions = JSON.parse(JSON.stringify(response));
           console.log("myqstns "+rQuestions);
          resolve(rQuestions);
        
      },
      error: function(data){
          console.log(data);
         console.log("Error in api call of get score for user.");
      }
  });
});

myPromise.then((resolvedValue) => {
  console.log("resolved "+resolvedValue);
}, (error) => {
  console.log(error);
});

    var questions = [{"qid":"2","question":"what is 2+2","choices":["4","5","8","19"],"correctAnswer":"0"},{"qid":"4","question":"What is 7+9","choices":["14","16","89","77"],"correctAnswer":"1"},{"qid":"5","question":"What is 2+4","choices":["54","916","989","6"],"correctAnswer":"3"},{"qid":"6","question":"What is 1+19","choices":["4454","22916","20","12797"],"correctAnswer":"3"},{"qid":"7","question":"What is 99 - 99","choices":["854","0","8989","8797"],"correctAnswer":"1"}];
    
    var questionCounter = 0; //Tracks question number
    var selections = []; //Array containing user choices
    var quiz = $('#quiz'); //Quiz div object
    
    // Display initial question
    displayNext();
    
    // Click handler for the 'next' button
    $('#next').on('click', function (e) {
      e.preventDefault();
      
      // Suspend click listener during fade animation
      if(quiz.is(':animated')) {        
        return false;
      }
      choose();
      
      // If no user selection, progress is stopped
      if (isNaN(selections[questionCounter])) {
        alert('Please make a selection!');
      } else {
        questionCounter++;
        displayNext();
      }
    });
    
    // Click handler for the 'prev' button
    $('#prev').on('click', function (e) {
      e.preventDefault();
      
      if(quiz.is(':animated')) {
        return false;
      }
      choose();
      questionCounter--;
      displayNext();
    });
    
    // Click handler for the 'Start Over' button
    $('#start').on('click', function (e) {
      e.preventDefault();
      
      if(quiz.is(':animated')) {
        return false;
      }
      questionCounter = 0;
      selections = [];
      displayNext();
      $('#start').hide();
    });
    
    // Animates buttons on hover
    $('.button').on('mouseenter', function () {
      $(this).addClass('active');
    });
    $('.button').on('mouseleave', function () {
      $(this).removeClass('active');
    });
    
    // Creates and returns the div that contains the questions and 
    // the answer selections
    function createQuestionElement(index) {
      var qElement = $('<div>', {
        id: 'question'
      });
      
      var header = $('<h2>Question ' + (index + 1) + ':</h2>');
      qElement.append(header);
      
      var question = $('<p>').append(questions[index].question);
      qElement.append(question);
      
      var radioButtons = createRadios(index);
      qElement.append(radioButtons);
      
      return qElement;
    }
    
    // Creates a list of the answer choices as radio inputs
    function createRadios(index) {
      var radioList = $('<ul>');
      var item;
      var input = '';
      for (var i = 0; i < questions[index].choices.length; i++) {
        item = $('<li>');
        input = '<input type="radio" name="answer" value=' + i + ' />';
        input += questions[index].choices[i];
        item.append(input);
        radioList.append(item);
      }
      return radioList;
    }
    
    // Reads the user selection and pushes the value to an array
    function choose() {
      selections[questionCounter] = +$('input[name="answer"]:checked').val();
    }
    
    // Displays next requested element
    function displayNext() {
      quiz.fadeOut(function() {
        $('#question').remove();
        
        if(questionCounter < questions.length){
          var nextQuestion = createQuestionElement(questionCounter);
          quiz.append(nextQuestion).fadeIn();
          if (!(isNaN(selections[questionCounter]))) {
            $('input[value='+selections[questionCounter]+']').prop('checked', true);
          }
          
          // Controls display of 'prev' button
          if(questionCounter === 1){
            $('#prev').show();
          } else if(questionCounter === 0){
            
            $('#prev').hide();
            $('#next').show();
          }
        }else {
          var scoreElem = displayScore();
          quiz.append(scoreElem).fadeIn();
          $('#next').hide();
          $('#prev').hide();
          $('#start').show();
        }
      });
    }
    
    // Computes score and returns a paragraph element to be displayed
    function displayScore() {
      var score = $('<p>',{id: 'question'});
      
      var numCorrect = 0;
      for (var i = 0; i < selections.length; i++) {
        if (selections[i] == questions[i].correctAnswer) {
          numCorrect++;
        }
      }
      
      score.append('You got ' + numCorrect + ' questions right out of ' +
                   questions.length + ' questions');
      return score;
    }
  })();