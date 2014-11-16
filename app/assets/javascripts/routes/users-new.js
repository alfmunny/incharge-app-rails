Myapp.UsersNewRoute = Ember.Route.extend({
  model: function() {
    var text = "";
    var number = "0123456789";
    var letter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 2; i++ )
        text += letter.charAt(Math.floor(Math.random() * letter.length));

    for( var i=0; i < 8; i++ )
        text += number.charAt(Math.floor(Math.random() * number.length));
    var random_idTag = text;

    var expiry_date = new Date();
    expiry_date.setMonth(expiry_date.getMonth() + 12);
    return this.store.createRecord('user', {
      // idTag: function() {
      //   return 10000
      // },
      // expiryDate: function() {
      //   var x = 12;
      //   var CurrentDate = new Date();
      //   CurrentDate.setMonth(CurrentDate.getMonth() + x);
      //   return CurrentDate;
      // }
      expiryDate: expiry_date,
      idTag: random_idTag
    });
  }
});
