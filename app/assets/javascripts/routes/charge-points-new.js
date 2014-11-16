Myapp.ChargePointsNewRoute = Ember.Route.extend({
  model: function() {
    return this.store.createRecord('charge-point', {
      status: 'Not Available'
    });
  }
});
