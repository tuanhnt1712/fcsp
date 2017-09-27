$(document).ready(function(){
  $('body').on('click', '.course-all', function(e){
    e.preventDefault();
    var id = $(this).attr('id');
    var id_user = $(this).data('user-id');
    $.ajax({
      url: id_user + '/courses/' + id,
      type: 'GET',
      dataType: 'json',
      success: function(result){
        $('body').find('#tab-information').html(result.html);
      }
    });
  });

  $('body').on('click', '.course-user', function(e){
    e.preventDefault();
    var id = $(this).attr('id');
    $.ajax({
      url: id,
      type: 'GET',
      dataType: 'json',
      success: function(result){
        $('body').find('#tab-information').html(result.html);
      }
    });
  });
});
