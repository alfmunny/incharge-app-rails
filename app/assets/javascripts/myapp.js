//= require ./store
//= require_tree ./mixins
//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./components
//= require_tree ./templates
//= require_tree ./routes
//= require ./router
//= require_self
//

Myapp.ApplicationAdapter = DS.ActiveModelAdapter.extend({
  namespace: 'api/v1'
});

Myapp.ChargePointSerializer = DS.ActiveModelSerializer.extend(DS.EmbeddedRecordsMixin).extend({
	attrs: {
		users: {serialize: 'ids', deserialize: 'ids'}
	}
});