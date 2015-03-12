express = require('express')
app     = express()
server  = require('http').Server(app)
io      = require('socket.io')(server)

server.listen(process.env.PORT || 3030)

app.use(express.static(__dirname + '/www'))

io.on 'connection', (socket) ->
  socket.emit 'products', []

  socket.on 'account:register'
  socket.on 'account:login'
  socket.on 'account:update'

  socket.on 'products:add', (product) ->
    console.log product

  socket.on 'products:edit', (productId, changes) ->
    console.log productId, changes

  socket.on 'products:delete', (productId) ->
    console.log productId

  socket.on 'cart:empty', ->

  socket.on 'cart:add', ->

  socket.on 'cart:update', ->

  socket.on 'cart:remove', ->

  socket.on 'checkout:complete', ->
    socket.emit('checkout:complete')

  socket.on 'geo:countries', ->
    []

  socket.on 'geo:regions', (country) ->
    []
