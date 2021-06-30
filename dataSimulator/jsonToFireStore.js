const firebase = require("firebase");
const schedule = require("node-schedule");

// Required for side-effects
require("firebase/firestore");

// Initialize Cloud Firestore through Firebase
firebase.initializeApp({
    apiKey: "AIzaSyDTwY8YenoZKkZgNEloNKDYDjkvR_sC3DA",
    authDomain: "yourstech",
    projectId: "healthcareproject-7e1ad"
  });
  
var db = firebase.firestore();

var menu = [
  {
    "id": 1,
    "value": 145
  },
  {
    "id": 2,
    "value": 20
  },
  {
    "id": 3,
    "value": 130
  },
  {
    "id": 4,
    "value": 130
  },
  {
    "id": 5,
    "value": 120
  },
  {
    "id": 6,
    "value": 0
  },
  {
    "id": 7,
    "value": 120
  },
  {
    "id": 8,
    "value": 140
  },
  {
    "id": 9,
    "value": 140
  },
  {
    "id": 10,
    "value": 120
  },
  {
    "id": 11,
    "value": 172
  },
  {
    "id": 12,
    "value": 0
  },
  {
    "id": 13,
    "value": 150
  },
  {
    "id": 14,
    "value": 140
  },
  {
    "id": 15,
    "value": 130
  },
  {
    "id": 16,
    "value": 130
  },
  {
    "id": 17,
    "value": 110
  },
  {
    "id": 18,
    "value": 150
  },
  {
    "id": 19,
    "value": 120
  },
  {
    "id": 20,
    "value": 120
  },
  {
    "id": 21,
    "value": 150
  },
  {
    "id": 22,
    "value": 150
  },
  {
    "id": 23,
    "value": 140
  },
  {
    "id": 24,
    "value": 135
  },
  {
    "id": 25,
    "value": 130
  },
  {
    "id": 26,
    "value": 140
  },
  {
    "id": 27,
    "value": 150
  },
  {
    "id": 28,
    "value": 140
  },
  {
    "id": 29,
    "value": 160
  },
  {
    "id": 30,
    "value": 150
  },
  {
    "id": 31,
    "value": 110
  },
  {
    "id": 32,
    "value": 140
  },
  {
    "id": 33,
    "value": 130
  },
  {
    "id": 34,
    "value": 105
  },
  {
    "id": 35,
    "value": 120
  },
  {
    "id": 36,
    "value": 130
  },
  {
    "id": 37,
    "value": 125
  },
  {
    "id": 38,
    "value": 125
  },
  {
    "id": 39,
    "value": 142
  },
  {
    "id": 40,
    "value": 135
  },
  {
    "id": 41,
    "value": 150
  },
  {
    "id": 42,
    "value": 155
  },
  {
    "id": 43,
    "value": 160
  },
  {
    "id": 44,
    "value": 140
  },
  {
    "id": 45,
    "value": 130
  },
  {
    "id": 46,
    "value": 104
  },
  {
    "id": 47,
    "value": 130
  },
  {
    "id": 48,
    "value": 140
  },
  {
    "id": 49,
    "value": 120
  },
  {
    "id": 50,
    "value": 140
  },
  {
    "id": 51,
    "value": 22
  },
  {
    "id": 52,
    "value": 12
  },
  {
    "id": 53,
    "value": 0
  },
  {
    "id": 54,
    "value": 138
  },
  {
    "id": 55,
    "value": 128
  },
  {
    "id": 56,
    "value": 138
  },
  {
    "id": 57,
    "value": 130
  },
  {
    "id": 58,
    "value": 120
  },
  {
    "id": 59,
    "value": 130
  },
  {
    "id": 60,
    "value": 108
  },
  {
    "id": 61,
    "value": 135
  },
  {
    "id": 62,
    "value": 134
  },
  {
    "id": 63,
    "value": 122
  },
  {
    "id": 64,
    "value": 115
  },
  {
    "id": 65,
    "value": 118
  },
  {
    "id": 66,
    "value": 128
  },
  {
    "id": 67,
    "value": 110
  },
  {
    "id": 68,
    "value": 108
  },
  {
    "id": 69,
    "value": 118
  },
  {
    "id": 70,
    "value": 135
  },
  {
    "id": 71,
    "value": 140
  },
  {
    "id": 72,
    "value": 138
  },
  {
    "id": 73,
    "value": 100
  },
  {
    "id": 74,
    "value": 130
  },
  {
    "id": 75,
    "value": 120
  },
  {
    "id": 76,
    "value": 124
  },
  {
    "id": 77,
    "value": 120
  },
  {
    "id": 78,
    "value": 94
  },
  {
    "id": 79,
    "value": 130
  },
  {
    "id": 80,
    "value": 140
  },
  {
    "id": 81,
    "value": 122
  },
  {
    "id": 82,
    "value": 135
  },
  {
    "id": 83,
    "value": 125
  },
  {
    "id": 84,
    "value": 140
  },
  {
    "id": 85,
    "value": 128
  },
  {
    "id": 86,
    "value": 105
  },
  {
    "id": 87,
    "value": 112
  },
  {
    "id": 88,
    "value": 128
  },
  {
    "id": 89,
    "value": 102
  },
  {
    "id": 90,
    "value": 152
  },
  {
    "id": 91,
    "value": 102
  },
  {
    "id": 92,
    "value": 115
  },
  {
    "id": 93,
    "value": 118
  },
  {
    "id": 94,
    "value": 101
  },
  {
    "id": 95,
    "value": 110
  },
  {
    "id": 96,
    "value": 100
  },
  {
    "id": 97,
    "value": 124
  },
  {
    "id": 98,
    "value": 132
  },
  {
    "id": 99,
    "value": 138
  },
  {
    "id": 100,
    "value": 132
  },
  {
    "id": 101,
    "value": 112
  },
  {
    "id": 102,
    "value": 142
  },
  {
    "id": 103,
    "value": 140
  },
  {
    "id": 104,
    "value": 108
  },
  {
    "id": 105,
    "value": 130
  },
  {
    "id": 106,
    "value": 130
  },
  {
    "id": 107,
    "value": 148
  },
  {
    "id": 108,
    "value": 178
  },
  {
    "id": 109,
    "value": 140
  },
  {
    "id": 110,
    "value": 120
  },
  {
    "id": 111,
    "value": 129
  },
  {
    "id": 112,
    "value": 120
  },
  {
    "id": 113,
    "value": 160
  },
  {
    "id": 114,
    "value": 138
  },
  {
    "id": 115,
    "value": 120
  },
  {
    "id": 116,
    "value": 110
  },
  {
    "id": 117,
    "value": 180
  },
  {
    "id": 118,
    "value": 150
  },
  {
    "id": 119,
    "value": 140
  },
  {
    "id": 120,
    "value": 110
  },
  {
    "id": 121,
    "value": 130
  },
  {
    "id": 122,
    "value": 120
  },
  {
    "id": 123,
    "value": 130
  },
  {
    "id": 124,
    "value": 120
  },
  {
    "id": 125,
    "value": 105
  },
  {
    "id": 126,
    "value": 138
  },
  {
    "id": 127,
    "value": 130
  },
  {
    "id": 128,
    "value": 138
  },
  {
    "id": 129,
    "value": 112
  },
  {
    "id": 130,
    "value": 108
  },
  {
    "id": 131,
    "value": 94
  },
  {
    "id": 132,
    "value": 118
  },
  {
    "id": 133,
    "value": 112
  },
  {
    "id": 134,
    "value": 152
  },
  {
    "id": 135,
    "value": 136
  },
  {
    "id": 136,
    "value": 120
  },
  {
    "id": 137,
    "value": 160
  },
  {
    "id": 138,
    "value": 134
  },
  {
    "id": 139,
    "value": 120
  },
  {
    "id": 140,
    "value": 110
  },
  {
    "id": 141,
    "value": 126
  },
  {
    "id": 142,
    "value": 130
  },
  {
    "id": 143,
    "value": 120
  },
  {
    "id": 144,
    "value": 128
  },
  {
    "id": 145,
    "value": 110
  },
  {
    "id": 146,
    "value": 128
  },
  {
    "id": 147,
    "value": 120
  },
  {
    "id": 148,
    "value": 115
  },
  {
    "id": 149,
    "value": 120
  },
  {
    "id": 150,
    "value": 106
  },
  {
    "id": 151,
    "value": 140
  },
  {
    "id": 152,
    "value": 156
  },
  {
    "id": 153,
    "value": 118
  },
  {
    "id": 154,
    "value": 150
  },
  {
    "id": 155,
    "value": 120
  },
  {
    "id": 156,
    "value": 130
  },
  {
    "id": 157,
    "value": 160
  },
  {
    "id": 158,
    "value": 112
  },
  {
    "id": 159,
    "value": 170
  },
  {
    "id": 160,
    "value": 146
  },
  {
    "id": 161,
    "value": 138
  },
  {
    "id": 162,
    "value": 130
  },
  {
    "id": 163,
    "value": 130
  },
  {
    "id": 164,
    "value": 122
  },
  {
    "id": 165,
    "value": 125
  },
  {
    "id": 166,
    "value": 130
  },
  {
    "id": 167,
    "value": 120
  },
  {
    "id": 168,
    "value": 132
  },
  {
    "id": 169,
    "value": 120
  },
  {
    "id": 170,
    "value": 138
  },
  {
    "id": 171,
    "value": 138
  },
  {
    "id": 172,
    "value": 160
  },
  {
    "id": 173,
    "value": 120
  },
  {
    "id": 174,
    "value": 140
  },
  {
    "id": 175,
    "value": 130
  },
  {
    "id": 176,
    "value": 140
  },
  {
    "id": 177,
    "value": 130
  },
  {
    "id": 178,
    "value": 110
  },
  {
    "id": 179,
    "value": 120
  },
  {
    "id": 180,
    "value": 132
  },
  {
    "id": 181,
    "value": 130
  },
  {
    "id": 182,
    "value": 110
  },
  {
    "id": 183,
    "value": 117
  },
  {
    "id": 184,
    "value": 140
  },
  {
    "id": 185,
    "value": 120
  },
  {
    "id": 186,
    "value": 150
  },
  {
    "id": 187,
    "value": 132
  },
  {
    "id": 188,
    "value": 150
  },
  {
    "id": 189,
    "value": 130
  },
  {
    "id": 190,
    "value": 112
  },
  {
    "id": 191,
    "value": 150
  },
  {
    "id": 192,
    "value": 112
  },
  {
    "id": 193,
    "value": 130
  },
  {
    "id": 194,
    "value": 124
  },
  {
    "id": 195,
    "value": 140
  },
  {
    "id": 196,
    "value": 110
  },
  {
    "id": 197,
    "value": 130
  },
  {
    "id": 198,
    "value": 128
  },
  {
    "id": 199,
    "value": 120
  },
  {
    "id": 200,
    "value": 145
  },
  {
    "id": 201,
    "value": 140
  },
  {
    "id": 202,
    "value": 170
  },
  {
    "id": 203,
    "value": 150
  },
  {
    "id": 204,
    "value": 125
  },
  {
    "id": 205,
    "value": 120
  },
  {
    "id": 206,
    "value": 110
  },
  {
    "id": 207,
    "value": 110
  },
  {
    "id": 208,
    "value": 125
  },
  {
    "id": 209,
    "value": 150
  },
  {
    "id": 210,
    "value": 180
  },
  {
    "id": 211,
    "value": 160
  },
  {
    "id": 212,
    "value": 128
  },
  {
    "id": 213,
    "value": 110
  },
  {
    "id": 214,
    "value": 150
  },
  {
    "id": 215,
    "value": 120
  },
  {
    "id": 216,
    "value": 140
  },
  {
    "id": 217,
    "value": 128
  },
  {
    "id": 218,
    "value": 120
  },
  {
    "id": 219,
    "value": 118
  },
  {
    "id": 220,
    "value": 145
  },
  {
    "id": 221,
    "value": 125
  },
  {
    "id": 222,
    "value": 132
  },
  {
    "id": 223,
    "value": 130
  },
  {
    "id": 224,
    "value": 130
  },
  {
    "id": 225,
    "value": 135
  },
  {
    "id": 226,
    "value": 130
  },
  {
    "id": 227,
    "value": 150
  },
  {
    "id": 228,
    "value": 140
  },
  {
    "id": 229,
    "value": 138
  },
  {
    "id": 230,
    "value": 200
  },
  {
    "id": 231,
    "value": 110
  },
  {
    "id": 232,
    "value": 145
  },
  {
    "id": 233,
    "value": 120
  },
  {
    "id": 234,
    "value": 120
  },
  {
    "id": 235,
    "value": 170
  },
  {
    "id": 236,
    "value": 125
  },
  {
    "id": 237,
    "value": 108
  },
  {
    "id": 238,
    "value": 165
  },
  {
    "id": 239,
    "value": 160
  },
  {
    "id": 240,
    "value": 120
  },
  {
    "id": 241,
    "value": 130
  },
  {
    "id": 242,
    "value": 140
  },
  {
    "id": 243,
    "value": 125
  },
  {
    "id": 244,
    "value": 140
  },
  {
    "id": 245,
    "value": 125
  },
  {
    "id": 246,
    "value": 126
  },
  {
    "id": 247,
    "value": 160
  },
  {
    "id": 248,
    "value": 174
  },
  {
    "id": 249,
    "value": 145
  },
  {
    "id": 250,
    "value": 152
  },
  {
    "id": 251,
    "value": 132
  },
  {
    "id": 252,
    "value": 124
  },
  {
    "id": 253,
    "value": 134
  },
  {
    "id": 254,
    "value": 160
  },
  {
    "id": 255,
    "value": 192
  },
  {
    "id": 256,
    "value": 140
  },
  {
    "id": 257,
    "value": 140
  },
  {
    "id": 258,
    "value": 132
  },
  {
    "id": 259,
    "value": 138
  },
  {
    "id": 260,
    "value": 100
  },
  {
    "id": 261,
    "value": 160
  },
  {
    "id": 262,
    "value": 142
  },
  {
    "id": 263,
    "value": 128
  },
  {
    "id": 264,
    "value": 144
  },
  {
    "id": 265,
    "value": 150
  },
  {
    "id": 266,
    "value": 120
  },
  {
    "id": 267,
    "value": 178
  },
  {
    "id": 268,
    "value": 112
  },
  {
    "id": 269,
    "value": 123
  },
  {
    "id": 270,
    "value": 108
  },
  {
    "id": 271,
    "value": 110
  },
  {
    "id": 272,
    "value": 112
  },
  {
    "id": 273,
    "value": 180
  },
  {
    "id": 274,
    "value": 118
  },
  {
    "id": 275,
    "value": 122
  },
  {
    "id": 276,
    "value": 130
  },
  {
    "id": 277,
    "value": 120
  },
  {
    "id": 278,
    "value": 134
  },
  {
    "id": 279,
    "value": 120
  },
  {
    "id": 280,
    "value": 100
  },
  {
    "id": 281,
    "value": 110
  },
  {
    "id": 282,
    "value": 125
  },
  {
    "id": 283,
    "value": 146
  },
  {
    "id": 284,
    "value": 124
  },
  {
    "id": 285,
    "value": 136
  },
  {
    "id": 286,
    "value": 138
  },
  {
    "id": 287,
    "value": 136
  },
  {
    "id": 288,
    "value": 128
  },
  {
    "id": 289,
    "value": 126
  },
  {
    "id": 290,
    "value": 152
  },
  {
    "id": 291,
    "value": 140
  },
  {
    "id": 292,
    "value": 140
  },
  {
    "id": 293,
    "value": 134
  },
  {
    "id": 294,
    "value": 154
  },
  {
    "id": 295,
    "value": 110
  },
  {
    "id": 296,
    "value": 128
  },
  {
    "id": 297,
    "value": 148
  },
  {
    "id": 298,
    "value": 114
  },
  {
    "id": 299,
    "value": 170
  },
  {
    "id": 300,
    "value": 152
  },
  {
    "id": 301,
    "value": 120
  },
  {
    "id": 302,
    "value": 140
  },
  {
    "id": 303,
    "value": 124
  },
  {
    "id": 304,
    "value": 164
  },
  {
    "id": 305,
    "value": 140
  },
  {
    "id": 306,
    "value": 110
  },
  {
    "id": 307,
    "value": 144
  },
  {
    "id": 308,
    "value": 130
  },
  {
    "id": 309,
    "value": 130
  }
]


function getCurrentDate(){
  let date_ob = new Date();
  let day = ("0" + date_ob.getDate()).slice(-2);
  let month = ("0" + (date_ob.getMonth() + 1)).slice(-2);
  let year = date_ob.getFullYear();
  let hours = ("0" + date_ob.getHours()).slice(-2);
  let minutes = ("0" + date_ob.getMinutes()).slice(-2);
  let seconds = ("0" + date_ob.getSeconds()).slice(-2);
  let date = day + "/" + month + "/" + year + " " + hours + ":" + minutes + ":" + seconds;

  return date;
}

function addData(number){
  var id = menu[i].id;
  var value = menu[i].value;
  db.collection("heartRateSimulation").add({
      id: id,
      value: value,
  }).then(function(docRef) {
      console.log("Document written with ID: ", docRef.id);
  })
  .catch(function(error) {
      console.error("Error adding document: ", error);
  });
}


var i = -1;
schedule.scheduleJob('* * * * *', () => {
  addData(i++);
})

