$(document).ready(function(){
  $("form.button_to").submit(function(){
    $(this).ajaxSubmit({
      success: hide_button($(this))
    });

    return false;
  })

  function hide_button(submitted_form){
    submitted_form.closest("tr").find("td.approved").html("Yes")
    submitted_form.remove();
  }
});
