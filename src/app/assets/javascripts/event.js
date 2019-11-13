$(function() {
  function load() {
    $('.select2').select2();
  
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
  }
  document.addEventListener("turbolinks:load", load);
  $(document).ready(load);
});