Myapp.ChargePointsController = Ember.ArrayController.extend({
  needs:['charge-point', 'connectors'],
  sortProperties: ['name'],
  sortAscending: true,
  isAccepted: true,

  isAccepted: function () {
    return true;
  }.property('@each.status')
});
