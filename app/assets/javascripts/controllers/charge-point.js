Myapp.ChargePointController = Ember.ObjectController.extend({
  isAccepted: function () {
    var chargePoint = this.get('model');
    var status = chargePoint.get('status');
    if(status == "Accepted") {
      console.log('right');
      return true;
    } else {
      return false;
    }
  }.property('model.@each'),

  isAcceptedChanged: function () {
    console.log('hello');
    
  }.observes('model.@each'),

  actions: {
  }
});
