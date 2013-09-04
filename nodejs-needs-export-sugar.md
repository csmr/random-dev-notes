Bored of writing "exports" and function names over and over again?
==================================================================

Bored of hunting for missing commas after function bodies?
----------------------------------------------------------

Actually, I dont give a fulcrum if you are, I am fed up with this crap!

You should be able to define variables and functions as normal, and then export them to the module.exports with simple call:

´´´javascript
  // simply one call 
  export( funcName, variName, etCetera )
  // declare funcName -function, var variName etc below...
```


* Two fold problem:

1. access the arguments -object and generate an object like:

```javascript
  { funcName: funcName,
    variName: variName,
    etCetera: etCetera
  }
```

  - problems: when passing values to function as arguments, variables are expressions
  - iow the arg object ends up with the value, not variable reference
  - Simplest solution is to use an array of strings (at least for vars)

2. bind this object to module.exports dynamically

```javascript
  function bindObjToThisExport( obj ) { 
    this.exports = ob;
  };
  
  bindObjectToThis.apply( module, theRefsObject )
```

Solution model
```javascript
function exportsToContext() {
var alen = arguments
for (var a = 0; a < alen; a++) {
this.exports[el] = arguments[a]);
});
}
 
var foo = 1, bar = 2, zoo = function() { return "z" };
 
function export( argArr ) {
exportsToContext.apply( module, [this].join( argArr) );
}
```
