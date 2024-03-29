exports = module.exports = function(io) {
  io.on('connection', function(socket) {
    console.log("CONNECTION MADE")
    socket.join('Lobby');
    socket.on('chat mounted', function(user) {
      console.log("CHAT MOUNTED")
      socket.emit('receive socket', socket.id)
    })
    socket.on('leave channel', function(channel) {
      socket.leave(channel)
    })
    socket.on('join channel', function(channel) {
      socket.join(channel.name)
    })
    socket.on('new message', function(msg) {
      console.log("NEW MESSAGE")
      socket.broadcast.to(msg.channelID).emit('new bc message', msg);
    });
    socket.on('new channel', function(channel) {
      socket.broadcast.emit('new channel', channel)
    });
    socket.on('typing', function (data) {
      console.log("TYPING")
      socket.broadcast.to(data.channel).emit('typing bc', data.user);
    });
    socket.on('stop typing', function (data) {
      console.log("STOP TYPING")
      socket.broadcast.to(data.channel).emit('stop typing bc', data.user);
    });
    socket.on('new private channel', function(socketID, channel) {
      socket.broadcast.to(socketID).emit('receive private channel', channel);
    })
  });
}