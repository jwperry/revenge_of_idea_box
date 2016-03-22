$(document).ready(function() {
  createIdeaIndex();
});

function displayIdea(idea) {
  return $('<div><h4>Title: ' + idea.title + '</h4><h4>Quality: ' + idea.quality + '</h4><h5>' + idea.body + '</h5></div><br>').addClass('idea');
};

function appendIdeas(ideas, target) {
  $(target).append(ideas.map(displayIdea));
};

function createIdeaIndex(target) {
  var target = $('.ideas');
  return $.getJSON('/ideas').then(function (all_ideas) {
    appendIdeas(all_ideas.ideas, target);
  });
};
