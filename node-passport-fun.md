SoMe-auth and Sessions
======================
aka _succinct guide handling clients as known users with node.js, express.js and passport.js_

### What, passport?

- modular.
- for each application unique authentication strategies.
- prerequisites:
  - node.js & npm, app scaffold.
  - add to your package.json:
        - express
        - passport
        - passport-strategyNameHere

  - same as `$ node install -S express passport passport-local passport-strategyNameHere`

### Sessions with passport

- To use passport with express, conf modules in this order:

```javascript
app.configure( function() {

  ...
  express.session({ secret: 'raBoof' })
  passport.initialize()
  passport.session()
  ...
});

````

#### Strategies
- Strategies must be installed, required and configured.
- Strategy config should implement a verify callback.
- A verify callback should check for valid credentials, then invoke done accordingly.

```javascript
  require('passport-local')
  
  // example strategy config
  passport.use( new LocalStrategy( 
    function( username, pw, done ) ) {
      // handle server exeptions, return done(err)
      // handle auth fails, return done(null, false, { message: 'Bad username.'})
      // if succ
      return done(null, user)
    }
  }
```

#### Authentication
- You authenticate the user first, then use session variables.
- `passport.authenticate('local', obj|cbF)`
- replace local with suitable strategy.
- Arg object `obj` can specify _redirects_, _session_ and _flash messages_.
- Redirects specified in obj properties `successRedirect` and `failureRedirect`.
- Sessions can be disabled by setting bool _session_ to false.
- Flash messages require `connect-flash` middleware in express 3.x.
- Flash messages with obj properties `successFlash` and `failureFlash`, boolean or string for msg.
- Custom callback function takes args `err`, `user`, `info`. With custom callback session setup and redirects are not automagic.
* Fail
  - passport responds with 401 Unauthorized.
  - custom callback will receive `err` and `info`, `user` will be set false; must call `req.login()` & send response.
* Success
  - If succeeds, session is generated.
  - custom callback gets `user` and `info` (?).

#### Sessions and cookies
- Passport maintains a session with a unique cookie - no need to transmit credenteals.
- `User` instances are de/serialized from/to session.
- Must implement `passport.serializeUser( function( user, done) {})` and `passport.deserializeUser( function( id, done) {})`
- in the argument function have `user` to userId-hsh and `userId` to `user`-obj logic of the app.

### Using OAuth 2.0
- First get authorization details from your provider: f.ex. authorization & access token -urls, plus client ID & secret.

1. Implement strategy
  - Require the strategy module, and implement a new strategy with `new OAuth2Strategy( argObj, verifyFunc )`.
  - verify -callbacks `refreshToken` argument may be undefined, `profile` contains the user profile data from provider.

```javascript
  ...
  var passport = require('passport'), 
  
  OAuth2Stg = require('passport-oauth').OAuth2Strategy,
  
  stgArgs = { 
      authorizationURL: 'https://www.provider.com/oauth2/authorize',
      tokenURL: 'https://www.provider.com/oauth2/token',
      clientID: '123-456-789',
      clientSecret: 'shhh-its-a-secret',
      callbackURL: 'https://www.example.com/auth/provider/callback'
  },
  
  verifyFunc = function( accessToken, refreshTokent, profile, done ) {
      User.findOrCreate( ... , function(err, user) {
        done(err, user)
      });
  }

  passport.use( 'provider', new OAuth2Strategy( argObj, verifyFunc ) )

```

2. Set up routes
  - passport OAuth2 requires 2 routes: providers authentication url and the return url for the app.
  - _Scope_ of the access to provider can be provided with arg obj property `scope`. See provider Api doc.
  - Multiple scopes as arr: `scope: ['email','photo']`

```javascript
    
    app.get( '/auth/provider', passport.authenticate('provider', { scope: 'email' }) ) 
    app.get( '/auth/provider/returm', passport.authenticate('', { successRedirect: '/app', failureRedirect: '/log' }) )

```

3. Add a link to a page: 

```html

<a href="/auth/provider">Log In with OAuth 2.0 Provider</a>

```

