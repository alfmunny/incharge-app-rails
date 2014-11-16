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
  },

  isEditing: false,
  actions: {
    edit: function() {
      this.set('isEditing', true);
    },
    cancel: function() {
      this.set('isEditing', false);
    },
    doneEditing: function() {
      this.set('isEditing', false);
      this.get('model').save();
    },
    destroy: function() {
      if (window.confirm("Are you sure to delete this charge point?")) {
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('charge-points');
      }
    }
  }
});
