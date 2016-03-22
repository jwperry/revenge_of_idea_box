$(document).ready(function() {
  $("#new-idea-submit").on("click", function() {
   var idea = {idea: { title: $("#new-title-field").val(),
                       body: $("#new-body-field").val() }
   };

   $.post("/ideas", idea);
   createIdeaIndex();
  });
});
