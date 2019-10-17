$(document).ready(function() {
  $('#event_field_id').select2();
  $('#event_professor_ids').select2();
  $('#event_keyword_ids').select2();

  $('#event_field_id').change(function() {
    $('#event_professor_ids').empty()
    $.post('/field_professors', {
        field_id: $('#event_field_id').val()
      }, function(f) {
      f.forEach(function(e) {
        $('#event_professor_ids').append(
          $('<option></option>')
            .val(e.id)
            .text(e.name)
        )
      })
    })
  })

  $('#q_keywords_id_in').select2();
});