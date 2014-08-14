Ember.Handlebars.helper('date', function(input) {
  return moment(input).format('MMMM Do YYYY, hh:mm:ss');
});