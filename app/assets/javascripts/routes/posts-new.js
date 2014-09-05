Myapp.PostsNewRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('post', {
      author: 'Yuanchen',
      publishedAt: new Date()
    });
  }
});
