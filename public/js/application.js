$(document).ready(function() {
  
  $('a.edit').on('click', function(e){
    e.preventDefault();
    var url = $(this).attr('href')
    var clicked = this
    $.get(url, function(data){
      $(clicked).next().html(data);
    });

    $('.edit_links a:first-child').on('click', function(e){
      e.preventDefault();
      var url = this.attr('href');
      console.log(url);
    });
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
