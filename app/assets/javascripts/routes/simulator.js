Myapp.SimulatorRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('charge-point');
  }
});
