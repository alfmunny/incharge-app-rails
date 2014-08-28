Myapp.ChargePointView = Ember.View.extend({
  isAcceptedChanged: function () {
    this.rerender();
  }.observes('model')
});
