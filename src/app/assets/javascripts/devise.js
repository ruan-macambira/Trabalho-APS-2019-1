$(function() {
  function load() {
    $('#user_type').change(function(e) {
      switch($('#user_type').val()) {
        case 'Student':
          $('#form-professor').prop('hidden', true);
          $('#form-student').prop('hidden', false);
          $('#user_title').val(null);
          $('#user_field_id').val(null);
          break;
        case 'Professor':
          $('#form-professor').prop('hidden', false);
          $('#form-student').prop('hidden', true);
          $('#user_registration').val(null);
          break;
        default:
          $('#form-professor').prop('hidden', true);
          $('#form-student').prop('hidden', true);
          $('#user_title').val(null);
          $('#user_field_id').val(null);
          $('#user_registration').val(null);
          break;
      }
    });
  }
  document.addEventListener("turbolinks:load", load);
  $(document).ready(load);
});