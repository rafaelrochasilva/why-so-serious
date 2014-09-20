$(document).ready(function() {
  $(".icon_img").on("click", function(event){
    var img_meme = event.target;
    var img_meme_parent = $(img_meme).parent();
    
    var card = img_meme_parent.parent()
    var image_element = card.find('.joke_big_image > img');
    
    $(img_meme_parent).hide();
    
    var src_my_image = $(img_meme).attr('src');
    image_element.attr("src", src_my_image);
    
    card.find(".image_input").attr("value", src_my_image);

    image_element.parent().show();
  });
});
