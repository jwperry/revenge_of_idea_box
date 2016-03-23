$(document).ready(function() {
  $('.ideas').on("click", ".thumbs-down-image", function() {

   $.ajax({
    method: "PATCH",
    url: "/ideas/" + $(this).parent().data("idea-id"),
    data: { idea: { ratingChange: -1 } }
   }).done(createIdeaIndex);
   
  });

  $('.ideas').on("click", ".thumbs-up-image", function() {

   $.ajax({
    method: "PATCH",
    url: "/ideas/" + $(this).parent().data("idea-id"),
    data: { idea: { ratingChange: 1 } }

   }).done(createIdeaIndex);
   
  });

});
