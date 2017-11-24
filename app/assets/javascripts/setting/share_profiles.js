$(document).ready(function(){
  arr = $('.li-users');
  $('#search').keyup(function(){
    for (var i = 0; i < arr.length; i++){
      id = arr[i].id;
      $('#'+id).show();
      if (arr[i].innerText.includes($('#search').val()) == false)
        $('#'+id).hide();
    }
  });
  $('#select_all').click(function(){
    if(this.checked){
      $('.li-users :checkbox').each(function(){
        this.checked = true;
      });
    }
    else {
      $('.li-users :checkbox').each(function(){
        this.checked = false;
      });
    }
  });
  $('.toggle-info').click(function(){
    $('#toggle-info-contact').toggle('slow');
  });
});
