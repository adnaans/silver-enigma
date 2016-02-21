Firebase = require("firebase")
var json = '{"result":true,"count":1}',
obj = JSON.parse(json);
var rootRef = new Firebase('https://nflhackathonthingy.firebaseio.com');

rootRef.set({
	[
  {
    "season": 2015,
    "week": 5,
    "teamId": "2700",
    "team": {
     "abbr": "HOU",
      "cityState": "Houston",
      "fullName": "Houston Texans",
      "nick": "Texans",
     }
},
    "teamPlayers": [
      {
        "nflId": 1234,

        "firstName": "string",
        "lastName": "string",
        "positionGroup": "string",
        "position": "string",
        "jerseyNumber": number,
        "height": "string",
        "weight": number,
      } 
    ]
  }
]

 });

