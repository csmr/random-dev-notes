/** Notes on express.js **/

// Routes

// parametrizing a route

app.get( '/showPlace/:place?', function( req, res ) { 
    res.send( req.param('place', 'Helsinki')); // if no param place, uses default Helsinki
});


// request-object
// source https://github.com/visionmedia/express/blob/master/lib/request.js

// request parameters
req.query.parFoo // http://www.ufo.fi?parFoo=1

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

// redirect
app.get( "/newDirection", function( req, res ) {
    res.status( 302 ).redirect( "/home" ) // statuscode, new url
}


/*** CouchDB ***/

// get Cradle
npm install -S cradle
cradle = require('cradle')

// 0. config conn
cradle.setup( configObj )

// 1. open server conn
var conn = new( cradle.Connection )
var serverReport = { 
    info: conn.info(),
    stats: conn.stats(),
    databases: conn.databases(),
    lastConfig: conn.config()
}

// 2. create db
var db = conn.database('sumBase')
db.exists( function( err, exists ) { 
    if ( !err && !exists ) db.create() 
}

// 3. use db 
db.info()
db.all() // dumps the contents of databas

// operations 
//  - in couch- get/put/post/delete
//  - in cradle-  get/save/view/delete
db.get( 'documentNameFoo', handlerFunc ) 
db.view( 'sum/pathTo/aDoc', iteratorFunc )
db.save( 'another/pathTo/oneDoc', docObjRef )
db.delete( 'docN', docRevision, respHandlerFunc )
db.merge( 'theDocument', { someField: "newValue" }, handlFunc ) // update single field value

// erase database
db.destroy()
