Myapp.Connector = DS.Model.extend({
  name: DS.attr('string'),
  chargePoint: DS.belongsTo('chargePoint'),
  trades: DS.hasMany('trade')
});
