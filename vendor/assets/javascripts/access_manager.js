//     Access Manager 0.1.0
//     (c) 2014
//     Access Manager may be freely distributed under the MIT license.

$(function () {
  var userActions = jQuery.parseJSON($('#current_user_actions').val());

  _.each($('[data-required-action]'), function (val) {
    var requiredActions = $(val).data('required-action').split(',');

    if (_.intersection(userActions, requiredActions).length == 0) {
      $(val).remove();
    }
  });

  _.each($('[data-menu=submenu]'), function (val) {
    if ($(val).find('[data-required-action]').length == 0) {
      $(val).remove();
    }
  });

  _.each($('[data-menu=menu]'), function (val) {
    if ($(val).find('[data-required-action]').length == 0) {
      $(val).remove();
    }
  });
});
