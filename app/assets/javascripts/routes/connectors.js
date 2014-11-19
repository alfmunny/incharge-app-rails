Myapp.ConnectorsRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('connector');
  }
});
