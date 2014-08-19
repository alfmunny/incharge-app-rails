Myapp.VehiclesRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('vehicle');
  }
});
