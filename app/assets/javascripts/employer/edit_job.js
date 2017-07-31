$(document).ready(function () {
  $('.next-step-2').on('click', function () {
    var caption_img = $('.caption-image').val();
    var title_job = $('.title-job').val();
    var text_job = $('.text-job').val();
    var fields = ['.caption-image', '.title-job', '.text-job'];
    $('.form-group').removeClass('has-error');
    if (caption_img && title_job && text_job && !unchecked_hiring_type()) {
      $('#step-1').hide();
      $('#step-2').slideDown();
      $('#a_step1').removeClass('selected').addClass('done');
      $('#a_step2').removeClass('disabled').addClass('selected');
    } else {
      $(fields).each(function (index, value) {
        if ($(value).val() == '') {
          $(value).closest('.form-group').addClass('has-error');
        }
      });
      if (unchecked_hiring_type()) {
        $('input[name="job[hiring_type_ids][]"]')
          .closest('.form-group').addClass('has-error');
      }
      $.growl.error({message: I18n.t('employer.jobs.new.step_1_danger')});
    }
  });

  $('.edit .buttonPrevious').click(function () {
    $('#step-2').hide();
    $('#a_step1').removeClass('done').addClass('selected');
    $('#a_step2').removeClass('selected').addClass('done');
    $(':submit').removeAttr('disabled');
  });

  $('.load-file').on('change', function () {
    image_preview($(this));
    $('.file-name-uploaded').val($(this).val());
  });

  $('body').on('focus', '.tt-input', function () {
    $("button").prop('disabled', true);
  }).blur(function () {
    $("button").prop('disabled', false);
  });
});

function image_preview(input) {
  var file = input[0].files[0];
  var reader = new FileReader();
  reader.readAsDataURL(file);
  reader.onload = function (_file) {
    $('#image_preview').html('<img src="' +
      _file.target.result + '" class="image-preview"/>');
  }
}

function unchecked_hiring_type() {
  var $check = true;
  $('input[name="job[hiring_type_ids][]"]').each(function (index, value) {
    if ($(this).is(':checked')) {
      $check = false;
    }
  });
  return $check;
}
