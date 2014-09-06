hasMany = DS.hasMany;
attr = DS.attr;

Myapp.Vehicle = DS.Model.extend({
  vehicleType: attr('string'),
  name: attr('string'),
  createdAt: attr('date'),

  users: hasMany('user'),
  transactions: hasMany('transaction'),
  chargePoints: hasMany('chargePoint')
});
