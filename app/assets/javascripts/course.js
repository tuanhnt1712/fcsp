$(document).ready(function(){
  $('body').on('click', '.course-all', function(e){
    e.preventDefault();
    var id_course = $(this).data('course-id');
    var id_user = $(this).data('user-id');
    $.ajax({
      url: id_user + '/courses/' + id_course,
      type: 'GET',
      dataType: 'json',
      success: function(result){
        $('#tab-information').html(result.html);
      }
    });
  });

  $('body').on('click', '.course-user', function(e){
    e.preventDefault();
    var id_user = $(this).data('user-id');
    var id_course = $(this).data('course-id');
    $.ajax({
      url: id_user + '/courses/' + id_course,
      type: 'GET',
      dataType: 'json',
      success: function(result){
        $('#tab-information').html(result.html);
      }
    });
  });
});
