Myapp.TradeView = Ember.View.extend({
  didInsertElement: function () {
    var dispatcher = new WebSocketRails('localhost:3000/websocket');

    channel = dispatcher.subscribe('posts');
    channel.bind('new', function(post) {
      console.log('a new post about '+post.title+' arrived!');

    });
  }
});
