// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require bootstrap
//= require fancybox
//= require_tree .



// For the js in the main index page
// 
// var mouse_is_inside = false;
//  
// $(document).ready(function() {
//     $(".login_btn").click(function() {
//         var loginBox = $("#login_box");
//         if (loginBox.is(":visible"))
//             loginBox.fadeOut("fast");
//         else
//             loginBox.fadeIn("fast");
//         return false;
//     });
//  
//     $("#login_box").hover(function(){ 
//         mouse_is_inside=true; 
//     }, function(){ 
//         mouse_is_inside=false; 
//     });
//  
//     $("body").click(function(){
//         if(! mouse_is_inside) $("#login_box").fadeOut("fast");
//     });
// });





// For the js in the main index page

$(document).ready(function() {      
     
    //Execute the slideShow, set 4 seconds for each images
    slideShow(5000);
 
});
 
function slideShow(speed) {
 
 
    //append a LI item to the UL list for displaying caption
    $('ul.slideshow').append('<li id="slideshow-caption" class="caption"><div class="slideshow-caption-container"><h3></h3><p></p></div></li>');
 
    //Set the opacity of all images to 0
    $('ul.slideshow li').css({opacity: 0.0});
     
    //Get the first image and display it (set it to full opacity)
    $('ul.slideshow li:first').css({opacity: 1.0}).addClass('show');
     
    //Get the caption of the first image from REL attribute and display it
    $('#slideshow-caption h3').html($('ul.slideshow li.show').find('img').attr('title'));
    $('#slideshow-caption p').html($('ul.slideshow li.show').find('img').attr('alt'));
         
    //Display the caption
    $('#slideshow-caption').css({opacity: 0.7, bottom:0});
     
    //Call the gallery function to run the slideshow    
    var timer = setInterval('gallery()',speed);
     
    //pause the slideshow on mouse over
    //$('ul.slideshow').hover(
    //  function () {
    //        clearInterval(timer);   
    //    },  
    //    function () {
    //        timer = setInterval('gallery()',speed);         
    //    }
    //);
}


function gallery() { 
 
    //if no IMGs have the show class, grab the first image
    var current = ($('ul.slideshow li.show')?  $('ul.slideshow li.show') : $('#ul.slideshow li:first'));
 
    //trying to avoid speed issue
    if(current.queue('fx').length == 0) {
 
        //Get next image, if it reached the end of the slideshow, rotate it back to the first image
        var next = ((current.next().length) ? ((current.next().attr('id') == 'slideshow-caption')? $('ul.slideshow li:first') :current.next()) : $('ul.slideshow li:first'));
             
        //Get next image caption
        var title = next.find('img').attr('title'); 
        var desc = next.find('img').attr('alt');    
             
        //Set the fade in effect for the next image, show class has higher z-index
        next.css({opacity: 0.0}).addClass('show').animate({opacity: 1.0}, 5000);
         
        //Hide the caption first, and then set and display the caption
        $('#slideshow-caption').slideToggle(1000, function () { 
            $('#slideshow-caption h3').html(title); 
            $('#slideshow-caption p').html(desc); 
            $('#slideshow-caption').slideToggle(1000); 
        }); 
     
        //Hide the current image
        current.animate({opacity: 0.0}, 1000).removeClass('show');
 
    }
 
}

// Accordion

$(document).ready(function() {
  $('div.accordion> div').hide();  
  $('div.accordion> h3').click(function() {
    $(this).next('div').slideToggle('fast')
    .siblings('div:visible').slideUp('fast');
  });

});


// SlideGallery
 $(function() {
    $("a.slide_gallery").hover(function() {

      var image = $(this).attr("rel");
      var desc = $(this).attr("alt");        

      $('#slide_gallery').fadeIn('fast');
      $('#slide_gallery img').attr('src', image)
      $('#slide_gallery img').attr('alt', desc)

      $('#slide_gallery div p').html($(this).attr('alt'));

      // make the caption appear
      $('#slide_gallery div.gallery-slideshow-caption').fade("slow")

      return false;
    });
});



//Friends Photos
// 
// $(function() {
// 	
// $(".image").click(function() {
// var image = $(this).attr("rel");	
// $('#image').hide();
// $('#image').fadeIn('slow');
// $('#image').html('<img src="' + image + '"/>');
// 
// $('#friends_comment').hide();
// $('#friends_comment').fadeIn('slow');
// $('#commenter').html($(this).attr('alt'));
// $('#friends_comment').html($(this).attr('comments'));
// 
// var new_data_id = $(this).attr('data-id');
// $('#comment_gallery_id').attr('value', new_data_id)
//     });
// });


//add and remove links for travel photos
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}


//fancybox, just add the class fancybox to the a link
$(document).ready(function() {
  $("a.fancybox").fancybox();
});