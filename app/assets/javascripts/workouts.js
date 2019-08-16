$(document).on('turbolinks:load', function() {

  $('#routine_routine_type_id').on('change', function() {
    var opt = $(this).find(':selected');
    var metric = opt.data('metric');
    var set_time = opt.data('set-time');
    var previous_lbs = opt.data('previous-lbs');
    var previous_reps = opt.data('previous-reps');
    var previous_minutes = opt.data('previous-minutes');
    var previous_distance = opt.data('previous-distance');

    // Show metric-relevant fields.
    $('.routine-field').addClass('d-none');
    $('#set_timer_button').addClass('d-none');
    switch (metric) {
      case 'distance':
        $('#routine_distance').closest('.form-group').removeClass('d-none');
        $('#routine_minutes').closest('.form-group').removeClass('d-none');
        break;
      case 'time':
        $('#routine_minutes').closest('.form-group').removeClass('d-none');
        $('#set_timer_button').removeClass('d-none');
        break;
      case 'weight':
        $('#routine_lbs').closest('.form-group').removeClass('d-none');
        $('#routine_reps').closest('.form-group').removeClass('d-none');
        break;
    }

    if (set_time !== undefined) {
      $('#set_timer_button').data('set-time', set_time);
    } else {
      $('#set-timer-value').removeData('set-time');
    }

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

    if (previous_distance !== undefined) {
      $('#previous_distance').html('Previous: ' + previous_distance).removeClass('d-none');
    } else {
      $('#previous_distance').html('').addClass('d-none');
    }
  });

});
