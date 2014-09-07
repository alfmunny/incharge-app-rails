Myapp.TradesRoute = Ember.Route.extend({
  model: function() {
    return this.store.find('trade');
  }
});
