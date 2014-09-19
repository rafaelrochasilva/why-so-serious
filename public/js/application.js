$(document).ready(function() {
  $(".icon_img").on("click", function(event){
    var img_meme = event.target;
    var img_meme_parent = $(img_meme).parent();

    $(img_meme_parent).hide();
    var src_my_image = $(img_meme).attr('src');
    console.log(src_my_image);
    $(".joke_big_image icon_img").attr("src", src_my_image) ;
    $(".joke_big_image icon_img").show();
  });
});
