$(document).ready(function() {
  $('.ideas').on("click", ".delete-image", function() {
   var ideaBox = $(this).parent();

   $.ajax({
    method: "DELETE",
    url: "/ideas/" + ideaBox.data("idea-id")
   }).done(function(){ ideaBox.hide("explode").remove(); });
   
  });
});
