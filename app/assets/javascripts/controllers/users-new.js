Myapp.UsersNewController = Ember.ObjectController.extend({
  actions: {
    create: function() {
      this.get('model').save();
      this.transitionToRoute('users');
    },
    cancel: function() {
      this.get('model').deleteRecord();
      this.transitionToRoute('users');
    }
  }
});
