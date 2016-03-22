$(document).ready(function() {
  createIdeaIndex();
});

function displayIdea(idea) {
  var body = truncate(idea.body);
  return $('<div class="idea"><h4>Title: ' + idea.title + '</h4><h4>Quality: ' + idea.quality + '</h4><h4>Date: '+ idea.created_at + '</h4><h5>' + body + '</h5></div><br />');
};

function appendIdeas(ideas, target) {
  $(target).append(ideas.map(displayIdea));
};

function createIdeaIndex(target) {
  var target = $('.ideas');
  return $.getJSON('/ideas').then(function (all_ideas) {
    all_ideas.ideas.sort(chronSort);
    appendIdeas(all_ideas.ideas, target);
  });
};

function truncate(body) {
  if (body.length > 100) {
    for (var i = 99; i > 0; i--) {
      if (body[i] === " ") {
        return body.substring(0, i) + " ...";
      }
    }
  }
  else {
    return body;
  }
};

function chronSort(x, y) {
  x.created_at = new Date(x.created_at);
  y.created_at = new Date(y.created_at);
  return (y.created_at - x.created_at);
};
