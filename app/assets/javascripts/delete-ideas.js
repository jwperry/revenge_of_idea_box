$(document).ready(function() {
  $('.ideas').on("click", ".delete-image", function() {

   $.ajax({
    method: "DELETE",
    url: "/ideas/" + $(this).parent().data("idea-id")
   });
   
   $(this).parent().remove();
  });
});
