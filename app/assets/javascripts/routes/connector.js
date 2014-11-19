Myapp.ConnectorRoute = Ember.Route.extend({
  model: function (params) {
    return this.store.find('connector', params.connector_id);
  }
});
