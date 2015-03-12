http = require('http')

http.createServer (req, res) ->
      res.end("ohai")
    .listen(3030)
