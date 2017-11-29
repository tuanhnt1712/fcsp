$(document).ready(function() {
  $('#paginator').on('click', 'a.page-link', function(e) {
    var url_request;
    e.preventDefault();
    url_request = $(this).attr('href');

    $.ajax({
      dataType: 'json',
      url: url_request,
      method: 'GET',
      success: function(data) {
        $('#jobs').html(data.jobs);
        $('#paginator').html(data.paginate);
        window.history.pushState('', '', url_request);
      }
    });
  });
})
