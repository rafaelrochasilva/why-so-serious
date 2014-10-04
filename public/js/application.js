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

  $(".back_btn").on("click", function(event){
    var button_parent = $(event.target).parent();
    var card = $(button_parent).parent();
    $(button_parent).hide();
    var small_image = $(card).find('.joke_small_images');

    $(small_image).show();
  });

  $("#btn_delete").on('submit', function(event){
    event.preventDefault();

    $.post( "/joke", $(this).serialize(), function(e){
      $(event.target).parent().parent().remove();
    });
  });

  $("#login_facebook").click(function(e){
    e.preventDefault();
    FB.login(function(response){
      if (response.authResponse) {
        $('.login_container').html('Connected! Hitting OmniAuth callback (GET /auth/facebook/callback)...');

        // since we have cookies enabled, this request will allow omniauth to parse
        // out the auth code from the signed request in the fbsr_XXX cookie
        $.getJSON('/auth/facebook/callback', function(json) {
            console.log(json);
            // $('#connect').html('Connected! Callback complete.');
            // $('#results').html(JSON.stringify(json));
        });
      }
    });
  });
});
