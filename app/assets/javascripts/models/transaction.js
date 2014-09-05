belongsTo = DS.belongsTo;

Myapp.Transaction = DS.Model.extend({
  transactionId: DS.attr('string'),
  status: DS.attr('string'),
  energy: DS.attr('number'),
  bill: DS.attr('number'),
  created_at: DS.attr('date'),
  updated_at: DS.attr('date'),

  user: belongsTo('user'),
  chargePoint: belongsTo('chargePoint'),
  vehicle: belongsTo('vehicle')
});
