var express = require('express'),
    app = express();

var router = new express.Router();

router.get('/', function(req, res) {
  res.send('Hello World!');
});

app.use('/', router);

var server = app.listen(3300, function() {
  console.log('Server listening at http://localhost:3300')
});
