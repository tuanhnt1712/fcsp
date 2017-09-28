$(document).ready(function() {
  $('body').on('click', '.subject-all', function(e){
    e.preventDefault();
    var id_course = $(this).data('course-id');
    var id_subject = $(this).data('subject-id');
    var id_user = $(this).data('user-id');
    $.ajax({
      url: id_user + '/courses/' + id_course + '/subjects/' + id_subject,
      type: 'GET',
      dataType: 'json',
      success: function(result){
        $('#tab-information').html(result.html);
      }
    });
  });
});
