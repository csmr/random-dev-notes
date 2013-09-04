SoMe-auth and Sessions
======================
aka _succinct guide handling clients as known users with Node.js, Express and Passport_

- prerequisites:
  - add to your package.json
    - express
    - passport
    - passport-strategyNameHere
  - or `$ node install -S express passport passport-strategyNameHere`


What, passport?
-------------------------
- modular.
- for each application unique authentication strategies.



Sessions with passport
----------------------
- To use passport with express, use this req/init order:
```javascript
app.configure( function() {
  ...
  express.session({ secret: 'raBoof' })
  passport.initialize()
  passport.session()
...
});
```

### Strategies
- Strategies must be installed, required and configured.
- `require('passport-local')`
- Strategy config should implement a verify callback.
- A verify callback should check for valid credentials, then invoke done accordingly.
```javascript
    passport.use(new LocalStrategy( 
      function( usern, pw, done ) ) {
        // handle server exeptions, return done(err)
        // handle auth fails, return done(null, false, { message: 'Bad username.'})
        // if succ
        return done(null, user)
      }
    }
```

### Authentication
- You authenticate the user first, then use session variables.
- `passport.authenticate('local', obj|cbF)`
- replace local with suitable strategy.
- Callback object can specify _redirects_, _session_ and _flash messages_.
- Redirects specified in obj properties `successRedirect` and `failureRedirect`.
- Sessions can be disabled by setting bool _session_ to false.
- Flash messages require _connect-flash_ middleware in express 3.x.
- Flash messages with obj properties `successFlash` and `failureFlash`, boolean or string for msg.
- Custom callback function takes args `err`, `user`, `info`. With custom callback session setup and redirects are not automagic.

* Fail
  - passport responds with 401 Unauthorized.
  - custom callback will receive `err` and `info`, `user` will be set false; must call `req.login()` & send response.
* Success
  - If succeeds, session is generated.
  - custom callback gets `user` and `info` (?).

### Sessions and cookies
- Passport maintains a session with a unique cookie.
- `User` instances are de/serialized from/to session.
- Must implement `passport.serializeUser( function( user, done) {})` and `passport.deserializeUser( function( id, done) {})`


Cookies
-------
