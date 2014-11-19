Myapp.ConnectorsNewRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('connector', {
    });
  }
});
