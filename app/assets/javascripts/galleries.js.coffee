# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

# jQuery ->
#   $('#new_gallery').fileupload
#     dataType: "script"
#     add: (e, data) ->
#       types = /(\.|\/)(gif|jpe?g|png)$/i
#       file = data.files[0]
#       if types.test(file.type) || types.test(file.name)
#         data.context = $(tmpl("template-upload", file))
#         $('#new_gallery').append(data.context)
#         data.submit()
#       else
#         alert("#{file.name} is not a gif, jpeg, or png image file")
#     progress: (e, data) ->
#       if data.context
#         progress = parseInt(data.loaded / data.total * 100, 10)
#         data.context.find('.bar').css('width', progress + '%')



# jQuery ->
#   if $('.pagination').length
#     $('#append_and_paginate').prepend('<a id="append_more_results" href="javascript:void(0);">Show more photos</a>');
#     $('#append_more_results').click ->
#       url = $('.pagination .next_page').attr('href')
#       if url
#         $('.pagination').text('Fetching more products...')
#         $.getScript(url)


jQuery ->
  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 100
        $('.pagination').text("Fetching more products...")
        $.getScript(url)
    $(window).scroll()