$('#event_field_id').change(function() {
  $('#event_professor_ids').empty()
  $.post('field_professors', function(f) {
    f.forEach(function(e) {
      $('#event_professor_ids').append(
        $(`<option></option>`)
          .val(e.id)
          .text(e.name)
      )
    })
  })
})