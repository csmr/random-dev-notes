/** Notes on express.js **/

// Routes

// parametrizing a route

app.get( '/showPlace/:place?', function( req, res ) { 
    res.send( req.param('place', 'Helsinki')); // if no param place, uses default Helsinki
});


// request-object
// source https://github.com/visionmedia/express/blob/master/lib/request.js

// req.get - any header value gotten
req.get('user-agent') 
req.get('')
  
req.accepted // content types
req.accepts('html', 'json') // which types are accepted
req.acceptLanguage


// response-object

// res -object
// res.attachment | .cookies | .clearCookies | .download | .links |  .sendfile
// json response
app.get( "/rawjsobj", function( req, res ) {
    res.json( { fooBar: 0, content: "message" } )    
})

// Optional content type
app.get( "/select", function( req, res ) {
    res.format({
        html: function() { res.send("<h1>Hi</h1>") },
        json: function() { res.json({ message: "body" }) },
        text: function() { res.send("sum text") }
        
    })    
})


app.get( "/newDirection", function( req, res ) {
    res.status( 302 ).redirect( "/home" ) // statuscode, new url
}

// couchdb

