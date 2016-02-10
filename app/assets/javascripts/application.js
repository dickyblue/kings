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



//fancybox, just add the class fancybox to the a link
$(document).ready(function() {
  $("a.fancybox").fancybox({
	helpers: {
	 title: {
	 type: "inside",
	 position: "bottom"
	 },
	},
});
});