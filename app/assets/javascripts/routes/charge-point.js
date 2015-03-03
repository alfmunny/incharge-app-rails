Myapp.ChargePointRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('charge-point', params.charge_point_id);
  },
  setupController: function(controller, model) {
  	controller.set('content', model);
  	controller.set('all-users', this.store.find('user'));
  }
});
