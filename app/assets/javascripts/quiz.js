$(function(){
  beginGame();
  $("#give_up").click(iGiveUp); 
  $("#am_i_right").click(checkAnswer); 
  $("#play_again").click(playAgain);
});

function beginGame() {
  $("#wrapper-2").hide();
  $("#directions-2").hide();
  $("#sub-directions-2").hide();
  $("#try_again").hide();
  $("span#play_clip").click(playClip);
  $("#you_did_it").hide();
  $("#try_again").hide();
}

function playClip() {
  var $clip = $("#random_song")[0];
  $clip.currentTime=5;
  $clip.play();
  setTimeout(function() { $clip.pause(); }, 1200);

  $("#directions").fadeOut(900, function(){
  $("#directions-2").fadeIn(1300);
  $("#sub-directions-2").fadeIn(4000);
  });
}

function checkAnswer(e){
  e.preventDefault();
  e.stopPropagation();

  if($('#guess').val().length >= 1){
    $button = $(this)
    var url = $button.parent().attr("action");
    var method = $button.parent().attr("method");
    var data = $button.parent().serialize();

    $.ajax({
      url: url,
      method: method,
      data: data, 
      dataType: "script", 
    })
  } 
}

function playAgain(){
  $("#guess").val("");
  $("#you_did_it").hide();
  $("#wrapper").show();
  $("#wrapper-2").hide();

  location.reload();
  var $clip = $("#random_song")[0];
  $clip.pause();
  $("#directions-2").hide();
  $("#sub-directions-2").hide();
  $("#directions").show();
}

function iGiveUp(e){
  e.preventDefault();
  e.stopPropagation();

  $("#wrapper-2").show();
  $("#wrapper").hide();
  handleClip();
}

function correctAnswer(){
  $("#wrapper").hide();
  $("#try_again").hide();
  $("#you_did_it").show();
  setTimeout(function() { $("#you_did_it").hide(); }, 800);
  setTimeout(function() { $("#wrapper-2").fadeIn("slow"); }, 800);
  $("#guess").val("");
  handleClip();
}

function incorrectAnswer(){
  $("#you_did_it").hide();
  $("#wrapper").hide();
  $("#try_again").show();
  setTimeout(function() { $("#try_again").hide(); }, 1300);
  setTimeout(function() { $("#wrapper-2").fadeIn("slow"); }, 1300);
  $("#guess").val("");
  handleClip();
}

$(function(){
  setInterval(function() {
      $.ajax({
        url: "/update_score",
      });
    }, 100);
});

function handleClip(){
  var $clip = $("#random_song")[0];
  $clip.currentTime=5;
  setTimeout(function() { $clip.play(); }, 25);
  setTimeout(function() { $clip.pause(); }, 25000);
  setTimeout(function() { location.reload(); }, 25000);
}
