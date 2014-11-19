Myapp.ConnectorController = Ember.ObjectController.extend({
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
      if (window.confirm("Are you sure to delete this connector?")) {
        this.get('model').deleteRecord();
        this.get('model').save();
        this.transitionToRoute('connectors');
      }
    }
  }
});
