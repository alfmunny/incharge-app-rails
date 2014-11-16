Myapp.UserController = Ember.ObjectController.extend({
  isEditing: false,
  actions: {
    edit: function() {
      this.set('isEditing', true);
    },
    cancel: function() {
      this.set('isEditing', false);
    },
    doneEditing: function() {
      this.set('isEditing', false);
      this.get('model').save();
    },
    destroy: function() {
      if (window.confirm("All the records of the user will be deleted and can't be restored? \nAre you sure to delete this user? ")) {
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('users');
      }
    }
  }
});
