Myapp.UserController = Ember.ObjectController.extend({
  isEditing: false,
  vehicleAdding: false,
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
    doneVehicleAdding: function () {
      vehicleId = this.get('newVehicleId');
      this.set('vehicleAdding', false);
      var user = this.get('model');
      this.store.find('vehicle', vehicleId).then(function(vehicle) {
        user.get('vehicles').pushObject(vehicle);
        vehicle.get('users').pushObject(user);
        user.save();
        vehicle.save();
      });
    },
    cancelVehicleAdding: function () {
      this.set('vehicleAdding', false);
    }
  }
});
