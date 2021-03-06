// For more information see: http://emberjs.com/guides/routing/
Myapp.Router.map(function() {
  this.resource('posts', function() {
    this.resource('post', { path: ':post_id' });
    this.route('new');
  });

  this.resource('users', function() {
    this.resource('user', { path: ':user_id' });
    this.route('new');
  });

  this.resource('vehicles', function() {
    this.resource('vehicle', { path: ':vehicle_id'});
    this.route('new');
  });

  this.resource('charge-points', function () {
    this.resource('charge-point', { path: ':charge_point_id' });
    this.route('new');
  });

  this.resource('trades');
  this.resource('trade', { path: '/trades/:trade_id' });

  this.resource('connectors', function () {
    this.resource('connector', { path: ':connector_id'});
    this.route('new');
  });

  this.resource('records');
  this.resource('simulator');

  this.route('sign-in');
  this.route('sign-up');
  this.route('sign-out');

  this.resource('about');
});

Myapp.Router.reopen({
});
