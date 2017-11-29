$(document).ready(function() {
  $('body').on('click', '.toggle-synchronize, .cancel-edit-synchronize', function(){
    $(this).closest('.col_full').find('.edit-synchronize').toggle('slow');
  })
});
