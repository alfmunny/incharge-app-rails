Myapp.UserRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('user', params.user_id);
  },
  setupController: function(controller, model) {
  	controller.set('content', model);
  	controller.set('all-chargePoints', this.store.find('chargePoint'));
  	controller.set('all-vehicles', this.store.find('vehicle'));
  }
});
