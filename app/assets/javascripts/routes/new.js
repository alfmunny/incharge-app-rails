Myapp.NewRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('post', {
      author: 'Yuanchen',
      published_at: new Date()
    });
  }
});