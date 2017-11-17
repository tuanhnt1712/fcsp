$(document).ready(function() {
  var sectionIds = {};
  $('.row-edit').each(function(){
    sectionIds[$(this).attr('id')] = $(this).first().offset().top - 140;
  });

  $(window).scroll(function(event){
    var scrolled, row;
    scrolled = $(this).scrollTop();
    for (key in sectionIds){
      if (scrolled >= sectionIds[key]){
        $('.nav-btn').removeClass('orange-text');
        row = $('[data-row-id=' + key + ']');
        row.addClass('orange-text');
      }
    }
  });

  $('.nav-btn').click(function(){
    var name, id, top;
    $(this).addClass('orange-text');
    name = $(this).attr('data-row-id');
    id = '#' + name;
    top = $(id).first().offset().top - 60;
    $('html, body').animate({scrollTop: top + 'px'}, 300);
  });
});
