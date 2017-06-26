(function() {
  App.room = App.cable.subscriptions.create('MessageChannel', {
    connected: function() {},
    disconnected: function() {},
    received: function(data) {
    }
  });
}).call(this);
