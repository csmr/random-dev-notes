Bored of writing "exports" and function names over and over again?
==================================================================

Bored of hunting for missing commas after function bodies?
----------------------------------------------------------

Actually, I dont give a fulcrum if you are, I am fed up with this crap!

You should be able to define variables and functions as normal, and then export them to the module.exports with simple call:

´´´export( funcName, variName, etCetera )


* Two fold problem:

1. access the arguments -object and generate an object like:

``´javascript
  { funcName: funcName,
    variName: variName,
    etCetera: etCetera
  }
  
2. bind this object to module.exports dynamically

```javascript
  function bindObjToThisExport( obj ) { 
    this.exports = ob;
  };
  bindObjectToThis.apply( module, theRefsObject )
