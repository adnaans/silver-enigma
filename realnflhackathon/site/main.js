var myFirebaseRef = new Firebase("https://nflhackathonthing.firebaseio.com/");
myFirebaseRef.child("concussion").on("value", function(snapshot)){

}


[
  {
    "season": number,
    "week": number,
    "teamId": "string",
    "team": {
     "abbr": "string",
      "cityState": "string",
      "fullName": "string",
      "nick": "string",
     }
},
    "teamPlayers": [
      {
        "nflId": number,
        "displayName": "string",
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
