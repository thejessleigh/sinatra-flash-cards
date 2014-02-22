$(document).ready(function() {

  $('a.edit').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href')
    var clicked = this
    $.get(url, function(data){
      $(clicked).next().html(data);
      $('#delete_deck').on('click', function(e){
        e.preventDefault();
        $.get($(this).attr('href'),function(data){
          $('.container').html(data);
        });
      });
    });
  });

  $('#delete_deck').on('click', function(e){
    e.preventDefault();
    $.get($(this).attr('href'),function(data){
      $('.container').html(data);
    });
  });

  $('#view_stats').on('click',function(e){
    e.preventDefault();
    var url = $(this).attr('href');
    $.get(url,function(data){
      $('#view_stats').attr('style', "display:none;");
      $('.container').append(data);
    })
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
