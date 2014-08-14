var showdown = new Showdown.converter();
Ember.Handlebars.helper('markdown', function(input) {
  if (input) {
    return new Handlebars.SafeString(showdown.makeHtml(input));
  }
});