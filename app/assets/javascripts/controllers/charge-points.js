Myapp.ChargePointsController = Ember.ArrayController.extend({
  needs:['charge-point'],
  sortProperties: ['name'],
  sortAscending: true,
  isAccepted: true,

  isAccepted: function () {
    return true;
  }.property('@each.status')
});
