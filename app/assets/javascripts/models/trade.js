belongsTo = DS.belongsTo;
hasMany = DS.hasMany;

Myapp.Trade = DS.Model.extend({
  transactionId: DS.attr('string'),
  status: DS.attr('string'),
  energy: DS.attr('number'),
  bill: DS.attr('number'),
  meterStart: DS.attr('number'),
  meterStop: DS.attr('number'),
  timestamp: DS.attr('date'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),

  user: belongsTo('user'),
  chargePoint: belongsTo('chargePoint'),
  connector: belongsTo('connector'),
  vehicle: belongsTo('vehicle'),
  records: hasMany('record')
});
