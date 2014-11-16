Myapp.VehiclesNewRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('vehicle', {
    });
  }
});
