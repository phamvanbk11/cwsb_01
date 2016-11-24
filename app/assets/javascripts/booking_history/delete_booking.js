$(document).ready(function(){
  var delete_booking = $('.delete-booking');
  delete_booking.on('click',function(){
    var id_booking = $(this).attr('id');
    bootbox.confirm("Are you sure?", function(result){
      if(result){
        var current_booking_id = id_booking.split('-')[1];
        delete_booking_with_id(current_booking_id);
      }
    });
  });
});

function delete_booking_with_id(booking_id){
  $.ajax({
    type: 'DELETE',
    dataType: 'json',
    url: '/bookings/' + booking_id,
    success: function(data){
      location.reload();
    },
    error: function(XMLHttpRequest, textStatus, errorThrown){
      alert('some error' + textStatus + ' | ' + errorThrown);
    }
  });
}
