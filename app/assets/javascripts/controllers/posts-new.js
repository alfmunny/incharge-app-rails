Myapp.PostsNewController = Ember.ObjectController.extend({
  actions: {
    create: function() {
      this.get('model').save();
      this.transitionToRoute('posts');
    },
    cancel: function() {
      this.get('model').deleteRecord();
      this.transitionToRoute('posts');
    }
  }
});
