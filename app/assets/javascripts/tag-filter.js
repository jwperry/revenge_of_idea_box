$(document).ready(function() {
  $('.tag').on("click", function() {
    var ideas = $('.idea');
    var term = this.innerHTML;
    showOnlyTagMatches(ideas, term);
  });
  
  $('.clear-tags').on("click", function() {
    var ideas = $('.idea');
    ideas.each(function() {
      $(this).show();
    });
  });
});

function showOnlyTagMatches(ideas, term) {
  ideas.each(function() {
    filterOnTag.call(this, term)
  });
};


function filterOnTag(term) {
  var tags = $(this).find('.tags-display')[0].innerHTML
  if (tags.indexOf(term) === -1){
    $(this).hide();
  }
  else {
    $(this).show();
  }
};
