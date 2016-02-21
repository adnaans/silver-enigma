Firebase = require("firebase")
var json = '{"result":true,"count":1}',
obj = JSON.parse(json);
var rootRef = new Firebase('https://silver-enigma.firebaseio.com/ghana.json');

rootRef.set({
      "Joe":"Seph"
 });