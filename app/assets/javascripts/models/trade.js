belongsTo = DS.belongsTo;
hasMany = DS.hasMany;

Myapp.Trade = DS.Model.extend({
  transactionId: DS.attr('string'),
  status: DS.attr('string'),
  energy: DS.attr('number'),
  bill: DS.attr('number'),
  createdAt: DS.attr('date'),
  updatedAt: DS.attr('date'),

  user: belongsTo('user'),
  chargePoint: belongsTo('chargePoint'),
  vehicle: belongsTo('vehicle'),
  records: hasMany('record')
});
