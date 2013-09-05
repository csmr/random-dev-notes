// Notes on express.js

// Routes

// parametrizing a route

app.get( "/showPlace/:place?, function( req, res ) { 
    res.send( req.param('place', 'Helsinki')); // if no param place, uses default Helsinki
})


// request-object
// source https://github.com/visionmedia/express/blob/master/lib/request.js

// req.get
  req.get("user-agent")
  req.get("")
  
req.accepted // content types
req.accepts("html", "json") // which types are accepted
req.acceptLanguage

// couchdb

