$(document).ready(function() {
  var picture = $('#background').val();
  $('.intro-header').css('background-image', 'url(' + picture + ')');

  $('body').on('click', '.pagination-article .page-link', function(e){
    var company_id = $('#company-id').val();
    var url_request = '/companies/' + company_id;
    var url = $(this).attr('href');
    var match = url.match(/page=(\d+)/);
    var page_number;
    if (match)
      page_number = match[1];
    else
      page_number = 1;
    e.preventDefault();
    $.ajax({
      url: url_request,
      dataType: 'json',
      data: {page: page_number}
    })
    .done(function(data) {
      $('.show-article').html(data.company_articles);
      $('.pagination-article').html(data.pagination_company_articles);
    });
  });

  $('body').on('submit', '.new_company', function(event) {
    event.preventDefault();
    var self = $(this);
    var $form_object = new Form(self);
    var $button = new AppElement(self.find('.btn-create-company'));

    var start = function () {
      $button.default_loading();
      $form_object.clear_error();
    };
    var success = function (response) {
      window.location.replace(response.location);
    };
    var error = function (response) {
      $form_object.bootstrap_show_error('company', response.errors);
      $form_object.clear_password_field();
    };
    var complete = function () {
      $button.reset();
    };

    new AjaxFormRequest('json', $form_object)
      .request(start, success, error, complete, true);
  });
});
