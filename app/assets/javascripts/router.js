// For more information see: http://emberjs.com/guides/routing/
Myapp.Router.map(function() {
  this.resource('posts', function() {
    this.resource('post', { path: ':post_id' });
  });
  this.resource('users', function() {
    this.resource('user', { path: ':user_id' });
  });
  this.resource('vehicles');
  this.resource('transactions');
  this.resource('about');
  this.resource('new');
});
