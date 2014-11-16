Myapp.VehiclesNewController = Ember.ObjectController.extend({
  actions: {
    create: function() {
      this.get('model').save();
      this.transitionToRoute('vehicles');
    },
    cancel: function() {
      this.get('model').deleteRecord();
      this.transitionToRoute('vehicles');
    }
  }
});
