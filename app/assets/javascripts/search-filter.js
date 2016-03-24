$(document).ready(function() {
  $('#search-field').keyup(function() {
    var ideas = $('.idea');
    var term = $('#search-field').val().toLowerCase();
    
    if (term === "") {
      showAllIdeas(ideas);
    }
    else {
      showOnlyMatches(ideas, term);
    }

  });
});

function showOnlyMatches(ideas, term) {
  ideas.each(function() {
    var body = $(this).data('idea-body').toLowerCase();
    var title = $(this).data('idea-title').toLowerCase();
    if (body.indexOf(term) === -1 && title.indexOf(term) === -1){
      $(this).hide();
    }
    else {
      $(this).show();
    }
  });
};

function showAllIdeas(ideas) {
  ideas.each(function() {
    $(this).show();
  });
};
