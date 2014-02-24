$(document).ready(function() {

  $('.slide').hide().show('slow');
  

  $('input[type="submit"]').attr('disabled','disabled');
  $('input[type="text"]').keyup(function() {
    if($(this).val() != '') {
       $('input[type="submit"]').removeAttr('disabled');
    }
  });
  

  $('.edit_links').hide();
  $('.edit').on('click', function(e){
    e.preventDefault();
    console.log("stopped");
    $(this).next().toggle('slow');
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


