$(document).ready(function(){
  $('body').on('click', '.course-all', function(e){
    e.preventDefault();
    var id_course = $(this).data('course-id');
    var id_user = $(this).data('user-id');
    var url = '/users/' + id_user + '/courses/' + id_course;
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: function(result){
        $('#tab-information').html(result.html);
        window.history.pushState("", "", url);
      }
    });
  });
});
