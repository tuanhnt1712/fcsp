$(document).ready(function () {
  var skills_suggest = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/skills?name=%QUERY',
      type: 'GET',
      filter: function (data) {
        return data;
      },
      wildcard: "%QUERY"
    },
  });
  skills_suggest.initialize();

  $('#job_list_skills').tagsinput({
    typeaheadjs: {
      name: 'skills_suggest',
      displayKey: 'name',
      valueKey: 'name',
      highlight: true,
      templates: {
        empty: '<div class="skills-suggest no-match">'+
        I18n.t('employer.jobs.skill_suggest.no_match') +'</div>',
        suggestion: function (data) {
          return '<div class="skills-suggest">' + data.name + '</div>';
        }
      },
      source: skills_suggest.ttAdapter(),
    }
  });

  $('.tt-input').focus(function () {
    $(this).keydown(function (e) {
      if (e.keyCode == 13 || e.keyCode == 8) {
        $('.skills-suggest').remove();
      }
    }).blur(function(){
      $(this).val('');
      $('.skills-suggest').remove();
    });
  });

  $('body').on('typeahead:asyncrequest', function () {
    $('.fa-spinner').removeClass('hide');
  }).on('typeahead:asynccancel typeahead:asyncreceive', function () {
    $('.fa-spinner').addClass('hide');
  });
});
