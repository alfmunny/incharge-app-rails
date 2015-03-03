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

  isEditing: false,
  nameIsEditing: false,
  isAddingNewUser: false,
  isAddingNewConnector: false,
  isAddingNewVehicle: false,

  actions: {
    addNewUser: function() {
      this.set('isAddingNewUser', true);
    },
    doneUserAdding: function() {
      this.set('isAddingNewUser', false);
    },
    cancelUserAdding: function() {
      this.set('isAddingNewUser', false);
    },

    addNewConnector: function() {
      this.set('isAddingNewConnector', true);
    },
    doneConnectorAdding: function() {
      this.set('isAddingNewConnector', false);
    },
    cancelConnectorAdding: function() {
      this.set('isAddingNewConnector', false);
    },

    addNewVehicle: function() {
      this.set('isAddingNewVehicle', true);
    },
    doneVehicleAdding: function() {
      this.set('isAddingNewVehicle', false);
    },
    cancelVehicleAdding: function() {
      this.set('isAddingNewVehicle', false);
    },
    editName: function () {
      this.set('nameIsEditing', true);
    },
    doneNameEditing: function () {
      this.set('nameIsEditing', false);
      this.get('model').save();
    },
    cancelNameEditing: function () {
      this.set('nameIsEditing', false);
    },
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
    },
    reset: function () {
      chargePoint = this.get('model');
      chargePoint.set('status', 'Not Available');
      this.set('isAccepted', false);
      this.get('model').save();
      this.transitionToRoute('charge-point');
    },
    updateUsers: function() {
      var chargePoint = this.get('model');
      var newUser = this.get('newUser');
      var allUser = this.get('all-users');
      var user = allUser.findBy('name', newUser);
      chargePoint.get('users').pushObject(user);
      user.save();
      chargePoint.save();
      this.set('isAddingNewUser', false);
    },
    deleteUser: function() {
      var allUser = this.get('all-users');
      var chargePoint = this.get('model');
      $("button").click(function() {
        var userName = $(this).siblings().text();
        // var userName = String(userNameString.match(/[^, ].*[^, ]/g));
        var user = allUser.findBy('name', userName);
        chargePoint.get('users').removeObject(user);
        chargePoint.save();
      });
    },

    updateConnectors: function() {
      var chargePoint = this.get('model');
      var newConnector = this.get('newConnector');
      var allConnectors = this.get('all-connectors');
      var connector = allConnectors.findBy('name', newConnector);
      chargePoint.get('connectors').pushObject(connector);
      connector.save();
      chargePoint.save();
      this.set('isAddingNewConnector', false);
    },

    deleteConnector: function() {
      var allConnectors = this.get('all-connectors');
      var chargePoint = this.get('model');
      $("button").click(function() {
        var connectorName = $(this).siblings().text();
        // var userName = String(userNameString.match(/[^, ].*[^, ]/g));
        var connector = allConnectors.findBy('name', connectorName);
        chargePoint.get('connectors').removeObject(connector);
        chargePoint.save();
      });
    },

    updateVehicles: function() {
      var chargePoint = this.get('model');
      var newVehicle = this.get('newVehicle');
      var allVehicles = this.get('all-vehicles');
      var vehicle = allVehicles.findBy('name', newVehicle);
      chargePoint.get('vehicles').pushObject(vehicle);
      vehicle.save();
      chargePoint.save();
      this.set('isAddingNewVehicle', false);
    },

    deleteVehicle: function() {
      var allVehicles = this.get('all-vehicles');
      var chargePoint = this.get('model');
      $("button").click(function() {
        var vehicleName = $(this).siblings().text();
        // var userName = String(userNameString.match(/[^, ].*[^, ]/g));
        var vehicle = allVehicles.findBy('name', vehicleName);
        chargePoint.get('vehicles').removeObject(vehicle);
        chargePoint.save();
      });
    }
  }
});
