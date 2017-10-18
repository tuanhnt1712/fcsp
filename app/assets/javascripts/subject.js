$(document).ready(function() {
  $('body').on('click', '.subject-all', function(e){
    e.preventDefault();
    var id_course = $(this).data('course-id');
    var id_subject = $(this).data('subject-id');
    var id_user = $(this).data('user-id');
    var url = '/users/' + id_user + '/courses/' + id_course + '/subjects/' + id_subject;
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
