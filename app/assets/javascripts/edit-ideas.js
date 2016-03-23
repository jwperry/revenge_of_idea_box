$(document).ready(function() {
  $('.ideas').on("click", ".edit-image", function() {
    hideButtons($(this).parent());
    showEditForms($(this).parent());
    showEditButtons($(this).parent());
  });
});

function hideButtons(parent) {
  $(parent).find('.idea-button').toggle();
};

function showEditForms(parent) {
  var title = parent.data('idea-title');
  var body = parent.data('idea-body');
  var editTitleForm = '<input class="edit-title-form" type="text" value="' + title + '" />';
  var editBodyForm = '<input class="edit-body-form" type="text" value="' + body + '" />';
  $(parent).find('.title-display').html(editTitleForm);
  $(parent).find('.body-display').html(editBodyForm);
};

function showEditButtons(parent) {
  var saveButton = '<input class="save-edit-btn edit-btn" type="button" value="Save" />';
  var cancelButton = '<input class="cancel-edit-btn edit-btn" type="button" value="Cancel" />';
  parent.append(saveButton).append(cancelButton);
};

$(document).ready(function() {
  $('.ideas').on("click", ".save-edit-btn", function() {
    var idea = { idea: { title: $(this).parent().find('.edit-title-form').val(),
                         body: $(this).parent().find('.edit-body-form').val() }
    };

    $.ajax({
      method: "PATCH",
      url: "/ideas/" + $(this).parent().data('idea-id'),
      data: idea
    }).done(createIdeaIndex);

  });

  $('.ideas').on("click", ".cancel-edit-btn", function() {
    $(this).parent().find('.title-display').html($(this).parent().data('idea-title'));
    $(this).parent().find('.body-display').html($(this).parent().data('idea-body'));    
    $(this).parent().find('.idea-button').toggle();
    $(this).parent().find('.edit-btn').remove();
  });
});
