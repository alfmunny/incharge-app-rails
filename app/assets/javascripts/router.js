// For more information see: http://emberjs.com/guides/routing/
Myapp.Router.map(function() {
  this.resource('posts', function() {
    this.resource('post', { path: ':post_id' });
    this.route('new');
  });

  this.resource('users', function() {
    this.resource('user', { path: ':user_id' });
  });

  this.resource('vehicles', function() {
    this.resource('vehicle', { path: ':vehicle_id'});
  });

  this.resource('charge-points', function () {
    this.resource('charge-point', { path: ':charge_point_id' });
  });

  this.resource('transactions', function () {
    this.resource('transaction', { path: 'transaction_id' });
  });

  this.resource('about');
});
