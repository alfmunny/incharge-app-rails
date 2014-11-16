Myapp.SignInController = Ember.Controller.extend({
  actions : {
    signIn: function() {
      var controller = this;
      return Ember.$.post('/supervisors/sign_in.json',
        {
          supervisor:
          {
            email: this.get('email'),
            password: this.get('password')
          }
        },
        function(data) {
          location.reload();
        },
        'json'
      ).fail(function() {
        alert("sign in failed!");
      }
      );
    }
  }
});
