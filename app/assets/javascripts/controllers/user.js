Myapp.UserController = Ember.ObjectController.extend({
  isEditing: false,
  vehicleAdding: false,
  chargePointAdding: false,
  transCounter: 0,
  // newVehicleName: "",
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
      if (window.confirm("All the records of the user will be deleted and can't be restored? \nAre you sure to delete this user? ")) {
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('users');
      }
    },
    addVehicle: function () {
      this.set('vehicleAdding', true);
    },
    doneVehicleAdding: function() {
      var vehicleName = this.get('vehicleName');
      var vehicles = this.get('all-vehicles');
      var vehicle = vehicles.findBy('name', vehicleName);
      var user = this.get('model');
      user.get('vehicles').pushObject(vehicle);
      user.save();
      this.set('vehicleAdding', false);
    },
    cancelVehicleAdding: function () {
      this.set('vehicleAdding', false);
    },

    deleteVehicle: function() {
      var allVehicles = this.get('all-vehicles');
      var user = this.get('model');
      $("button").click(function() {
        var vehicleName = $(this).siblings().text();
        // var userName = String(userNameString.match(/[^, ].*[^, ]/g));
        var vehicle = allVehicles.findBy('name', vehicleName);
        user.get('vehicles').removeObject(vehicle);
        user.save();
      });
    },

    addChargePoint: function () {
      this.set('chargePointAdding', true);
    },

    cancelChargePointAdding: function () {
      this.set('chargePointAdding', false);
    },

    doneChargePointAdding: function() {
      var chargePointName = this.get('chargePointName');
      var chargePoints = this.get('all-chargePoints');
      var chargePoint = chargePoints.findBy('name', chargePointName);
      var user = this.get('model');
      user.get('chargePoints').pushObject(chargePoint);
      user.save();
      this.set('chargePointAdding', false);
    },

    deleteChargePoint: function() {
      var allChargePoints = this.get('all-chargePoints');
      var user = this.get('model');
      $("button").click(function() {
        var chargePointName= $(this).siblings().text();
        // var userName = String(userNameString.match(/[^, ].*[^, ]/g));
        var chargePoint = allChargePoints.findBy('name', chargePointName);
        user.get('chargePoints').removeObject(chargePoint);
        user.save();
      });
    },

    countTrans: function() {
      var counter = this.get('transCounter');
      counter += 1;
      this.set('transCounter', counter);
    }
  }
});
