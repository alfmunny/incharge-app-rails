Myapp.ChargePointRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('charge-point', params.charge_point_id);
  }
});
