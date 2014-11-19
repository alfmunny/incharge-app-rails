Myapp.ConnectorsNewController = Ember.ObjectController.extend({
  actions: {
    create: function() {
      this.get('model').save();
      this.transitionToRoute('connectors');
    },
    cancel: function() {
      this.get('model').deleteRecord();
      this.transitionToRoute('connectors');
    }
  }
});
