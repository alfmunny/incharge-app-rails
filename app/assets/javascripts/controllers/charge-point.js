Myapp.ChargePointController = Ember.ObjectController.extend({
  needs: ['vehicles'],
  isAccepted: function () {
    var chargePoint = this.get('model');
    var status = chargePoint.get('status');
    if(status == "Accepted") {
      return true;
    } else {
      return false;
    }
  }.property('model'),

  actions: {
    reset: function () {
      chargePoint = this.get('model');
      chargePoint.set('status', 'Not Available');
      this.set('isAccepted', false);
      this.get('model').save();
      this.transitionToRoute('charge-point');
    }
  }
});
