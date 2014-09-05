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
  }.property('model.@each'),

  isAcceptedChanged: function () {
  }.observes('model.@each'),

  actions: {
  }
});
