attr = DS.attr;
belongsTo = DS.belongsTo;

Myapp.Record = DS.Model.extend({
  power: attr('number'),
  current: attr('number'),
  voltage: attr('number'),
  createdAt: attr('date'),

  trade: belongsTo('trade')
});
