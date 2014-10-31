Myapp.TradeView = Ember.View.extend({
  didInsertElement: function () {
    this._super();
    Ember.run.scheduleOnce('afterRender', this, this.drawChart);
  },

  drawChart: function () {
    var power = this.get('controller.power_array');
    var current = this.get('controller.current_array');
    var voltage = this.get('controller.voltage_array');
    $(function () {
      $('#records-chart').highcharts({
          chart: {
            type: 'column'
          },
          title: {
              text: 'Charging Recordings',
              //x: -20 //center
          },
          subtitle: {
              text: '',
              //x: -20
          },
          xAxis: {
          },
          yAxis: [{
              title: {
                  text: ''
              },
              plotLines: [{
                  value: 0,
                  width: 1,
                  color: '#808080'
              }]
          }],

          tooltip: {
          },

          legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'middle',
              borderWidth: 0
          },
          series: [{
              name: 'Power',
              data: power,
              tooltip: {
                valueSuffix: ' kW'
              }
          }, {
              name: 'Current',
              data: current,
              tooltip: {
                valueSuffix: ' A'
              }
          }]
      });
  });
  }
});
