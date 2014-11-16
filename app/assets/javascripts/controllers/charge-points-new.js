Myapp.ChargePointsNewController = Ember.ObjectController.extend({
  actions: {
    create: function() {
      this.get('model').save();
      this.transitionToRoute('charge-points');
    },
    cancel: function() {
      this.get('model').deleteRecord();
      this.transitionToRoute('charge-points');
    }
  }
});
