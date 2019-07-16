$(document).on('turbolinks:load', function() {

  $('#routine_routine_type_id').on('change', function() {
    var opt = $(this).find(':selected');
    var previous_lbs = opt.data('previous-lbs');
    var previous_reps = opt.data('previous-reps');
    var previous_minutes = opt.data('previous-minutes');

    if (previous_lbs !== undefined) {
      $('#previous_lbs').html('Previous: ' + previous_lbs).removeClass('d-none');
    } else {
      $('#previous_lbs').html('').addClass('d-none');
    }

    if (previous_reps !== undefined) {
      $('#previous_reps').html('Previous: ' + previous_reps).removeClass('d-none');
    } else {
      $('#previous_reps').html('').addClass('d-none');
    }

    if (previous_minutes !== undefined) {
      $('#previous_minutes').html('Previous: ' + previous_minutes).removeClass('d-none');
    } else {
      $('#previous_minutes').html('').addClass('d-none');
    }
  });

});
