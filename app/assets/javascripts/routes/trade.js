Myapp.TradeRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('trade', params.trade_id);
  }
});
