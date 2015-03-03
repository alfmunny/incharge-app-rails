attr = DS.attr;
hasMany = DS.hasMany;
Myapp.User = DS.Model.extend({
  idTag: attr('string'),
  name: attr('string'),
  expiryDate: attr('date'),
  email: attr('string'),
  company: attr('string'),
  password: attr('string'),
  //avatar: attr('string')

  vehicles: hasMany('vehicle'),
  chargePoints: hasMany('chargePoint', { async: true }),
  trades: hasMany('trade')
});
