$(document).ready(function() {
  $('.payment-directly').on('click', function(){
    $('#show_old_information_'+ $(this).attr('id')).removeClass('display-none');
  });
})
