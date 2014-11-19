Myapp.SimulatorController = Ember.ObjectController.extend({

  transactino_id: 0,

  actions: {
    boot_notification: function () {
      $.ajax({
          type: "GET",
          data: {"charge_point_vendor": "InCharge"},
          url: "http://localhost:3000/api/v1/charge_points/1/boot_notification",
          contentType: "appliaction/json",
          dataType: "json",
          success: function(data) {
            $('#simulator-screen').val(JSON.stringify(data, undefined, 2));
          }
      });
    },

    heartbeat: function () {
      $.ajax({
          type: "GET",
          data: {},
          url: "http://localhost:3000/api/v1/charge_points/1/heartbeat",
          contentType: "appliaction/json",
          dataType: "json",
          success: function(data) {
            $('#simulator-screen').val(JSON.stringify(data, undefined, 2));
          }
      });
    },

    authorize: function() {
      $.ajax({
          type: "GET",
          data: {"id_tag": "YZ08142014"},
          url: "http://localhost:3000/api/v1/charge_points/1/authorize",
          contentType: "appliaction/json",
          dataType: "json",
          success: function(data) {
            $('#simulator-screen').val(JSON.stringify(data, undefined, 2));
          }
      });
    },

    start_transaction: function() {
      var id = 0;
      $.ajax({
          type: "GET",
          data: {"id_tag": "YZ08142014", "connector_id": 1, "meter_start": 0, "vehicle_id": 1 },
          url: "http://localhost:3000/api/v1/charge_points/1/start_transaction",
          async: false,
          dataType: "json",
          success: function(data) {
            id = data.transaction_id;
            $('#simulator-screen').val(JSON.stringify(data, undefined, 2));
          }
      });
      this.set('transaction_id', id);
      // var d = this.get('transaction_id');
      // console.log(d);
    },

    meter_values: function() {
      var id = this.get('transaction_id');
      var power = Math.round((Math.random() * 10 + 10)*100)/100;
      var current = Math.round((Math.random() * 30 + 10)*100)/100;
      $.ajax({
          type: "GET",
          data: {"connector_id": 1, "transaction_id": id, "values": { "power": power, "current": current } },
          url: "http://localhost:3000/api/v1/charge_points/1/meter_values",
          contentType: "appliaction/json",
          dataType: "json",
          success: function(data) {
            $('#simulator-screen').val(JSON.stringify(data, undefined, 2));
          }
      });
    },

    stop_transaction: function() {
      var id = this.get('transaction_id');
      var meter_stop = Math.round((Math.random() * 30 + 10)*100)/100;
      var bill = Math.round((Math.random() * 10 + 8)*100)/100;
      var energy = Math.round((Math.random() * 10 + 20)*100)/100;
      $.ajax({
          type: "GET",
          data: {"meter_stop": meter_stop, "transaction_id": id, "transaction_data": { "bill": bill, "energy": energy} },
          url: "http://localhost:3000/api/v1/charge_points/1/stop_transaction",
          contentType: "appliaction/json",
          dataType: "json",
          success: function(data) {
            $('#simulator-screen').val(JSON.stringify(data, undefined, 2));
          }
      });
    }
  }
});
