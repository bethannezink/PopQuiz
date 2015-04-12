$(function(){
  $("span#play_clip").click(playClip);
});

function playClip() {
  var $clip = $("#random_song")[0];
  $clip.play();
  $clip.currentTime=29.4;
  $("#directions").fadeOut(2000, function(){
    $("#directions").remove();
  })
}
