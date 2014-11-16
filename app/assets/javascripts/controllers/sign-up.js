Myapp.SignUpController = Ember.Controller.extend({
  actions: {
    signUp: function () {
      var user = this.store.createRecord('user', {
        name: this.get('name'),
        email: this.get('email')
        // password: this.get('password')
      });
      user.save().then(function() {
        console.log("User created");
      }, function(){
        console.error("User not saved");
      });
    },
    errors: function (error) {
        console.log(error.message);
    }
  }
});
