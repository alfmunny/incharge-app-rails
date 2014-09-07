Myapp.TradeController = Ember.ObjectController.extend({
  // timestamps: function () {
  //   var trade = this.get('model');
  //   var records = trade.get('records');
  //   for (var t = 0; t < records.length; t++){
  //
  //   }
  //   console.log(records);
  // }.property('model'),

  power_array: function () {
    var power = [];
    var model = this.get('model');
    var records = model.get('records');
    var records_array = records['content'];
    for (var t = 0; t < records_array.length; t++){
      var tmp = records_array[t];
      var p = tmp.get('power');
      power.push(p);
    }
    return power;
  }.property('model'),

  current_array: function () {
    var current = [];
    var model = this.get('model');
    var records = model.get('records');
    var records_array = records['content'];
    for (var t = 0; t < records_array.length; t++){
      var tmp = records_array[t];
      var c = tmp.get('current');
      current.push(c);
    }
    return current;
  }.property('model'),

  voltage_array: function () {
    var voltage = [];
    var model = this.get('model');
    var records = model.get('records');
    var records_array = records['content'];
    for (var t = 0; t < records_array.length; t++){
      var tmp = records_array[t];
      var v = tmp.get('voltage');
      voltage.push(v);
    }
    return voltage;
  }.property('model'),

  actions: {
    draw: function () {
      var model = this.get('model');
      var v = model.get('voltage_array');
      var c = model.get('current_array');
      var p = model.get('power_array');
      console.log(this.voltage_array);
    }
  }
});
