Myapp.ChargePointsRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('charge-point', params.charge-point_id);
  }
});
