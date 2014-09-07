attr = DS.attr;
hasMany = DS.hasMany;
Myapp.User = DS.Model.extend({
  name: attr('string'),
  expiryDate: attr('date'),
  email: attr('string'),
  company: attr('string'),
  //avatar: attr('string')

  vehicles: hasMany('vehicle'),
  chargePoints: hasMany('chargePoint'),
  trades: hasMany('trade')
});
