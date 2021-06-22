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

var menu =[
    {
      "id": 1,
      "value": 145
    },
    {
      "id": 2,
      "value": 130
    },
    {
      "id": 3,
      "value": 130
    },
    {
      "id": 4,
      "value": 120
    },
    {
      "id": 5,
      "value": 120
    },
    {
      "id": 6,
      "value": 140
    },
    {
      "id": 7,
      "value": 140
    },
    {
      "id": 8,
      "value": 120
    },
    {
      "id": 9,
      "value": 172
    },
    {
      "id": 10,
      "value": 150
    },
    {
      "id": 11,
      "value": 140
    },
    {
      "id": 12,
      "value": 130
    },
    {
      "id": 13,
      "value": 130
    },
    {
      "id": 14,
      "value": 110
    },
    {
      "id": 15,
      "value": 150
    },
    {
      "id": 16,
      "value": 120
    },
    {
      "id": 17,
      "value": 120
    },
    {
      "id": 18,
      "value": 150
    },
    {
      "id": 19,
      "value": 150
    },
    {
      "id": 20,
      "value": 140
    },
    {
      "id": 21,
      "value": 135
    },
    {
      "id": 22,
      "value": 130
    },
    {
      "id": 23,
      "value": 140
    },
    {
      "id": 24,
      "value": 150
    },
    {
      "id": 25,
      "value": 140
    },
    {
      "id": 26,
      "value": 160
    },
    {
      "id": 27,
      "value": 150
    },
    {
      "id": 28,
      "value": 110
    },
    {
      "id": 29,
      "value": 140
    },
    {
      "id": 30,
      "value": 130
    },
    {
      "id": 31,
      "value": 105
    },
    {
      "id": 32,
      "value": 120
    },
    {
      "id": 33,
      "value": 130
    },
    {
      "id": 34,
      "value": 125
    },
    {
      "id": 35,
      "value": 125
    },
    {
      "id": 36,
      "value": 142
    },
    {
      "id": 37,
      "value": 135
    },
    {
      "id": 38,
      "value": 150
    },
    {
      "id": 39,
      "value": 155
    },
    {
      "id": 40,
      "value": 160
    },
    {
      "id": 41,
      "value": 140
    },
    {
      "id": 42,
      "value": 130
    },
    {
      "id": 43,
      "value": 104
    },
    {
      "id": 44,
      "value": 130
    },
    {
      "id": 45,
      "value": 140
    },
    {
      "id": 46,
      "value": 120
    },
    {
      "id": 47,
      "value": 140
    },
    {
      "id": 48,
      "value": 138
    },
    {
      "id": 49,
      "value": 128
    },
    {
      "id": 50,
      "value": 138
    },
    {
      "id": 51,
      "value": 130
    },
    {
      "id": 52,
      "value": 120
    },
    {
      "id": 53,
      "value": 130
    },
    {
      "id": 54,
      "value": 108
    },
    {
      "id": 55,
      "value": 135
    },
    {
      "id": 56,
      "value": 134
    },
    {
      "id": 57,
      "value": 122
    },
    {
      "id": 58,
      "value": 115
    },
    {
      "id": 59,
      "value": 118
    },
    {
      "id": 60,
      "value": 128
    },
    {
      "id": 61,
      "value": 110
    },
    {
      "id": 62,
      "value": 108
    },
    {
      "id": 63,
      "value": 118
    },
    {
      "id": 64,
      "value": 135
    },
    {
      "id": 65,
      "value": 140
    },
    {
      "id": 66,
      "value": 138
    },
    {
      "id": 67,
      "value": 100
    },
    {
      "id": 68,
      "value": 130
    },
    {
      "id": 69,
      "value": 120
    },
    {
      "id": 70,
      "value": 124
    },
    {
      "id": 71,
      "value": 120
    },
    {
      "id": 72,
      "value": 94
    },
    {
      "id": 73,
      "value": 130
    },
    {
      "id": 74,
      "value": 140
    },
    {
      "id": 75,
      "value": 122
    },
    {
      "id": 76,
      "value": 135
    },
    {
      "id": 77,
      "value": 125
    },
    {
      "id": 78,
      "value": 140
    },
    {
      "id": 79,
      "value": 128
    },
    {
      "id": 80,
      "value": 105
    },
    {
      "id": 81,
      "value": 112
    },
    {
      "id": 82,
      "value": 128
    },
    {
      "id": 83,
      "value": 102
    },
    {
      "id": 84,
      "value": 152
    },
    {
      "id": 85,
      "value": 102
    },
    {
      "id": 86,
      "value": 115
    },
    {
      "id": 87,
      "value": 118
    },
    {
      "id": 88,
      "value": 101
    },
    {
      "id": 89,
      "value": 110
    },
    {
      "id": 90,
      "value": 100
    },
    {
      "id": 91,
      "value": 124
    },
    {
      "id": 92,
      "value": 132
    },
    {
      "id": 93,
      "value": 138
    },
    {
      "id": 94,
      "value": 132
    },
    {
      "id": 95,
      "value": 112
    },
    {
      "id": 96,
      "value": 142
    },
    {
      "id": 97,
      "value": 140
    },
    {
      "id": 98,
      "value": 108
    },
    {
      "id": 99,
      "value": 130
    },
    {
      "id": 100,
      "value": 130
    },
    {
      "id": 101,
      "value": 148
    },
    {
      "id": 102,
      "value": 178
    },
    {
      "id": 103,
      "value": 140
    },
    {
      "id": 104,
      "value": 120
    },
    {
      "id": 105,
      "value": 129
    },
    {
      "id": 106,
      "value": 120
    },
    {
      "id": 107,
      "value": 160
    },
    {
      "id": 108,
      "value": 138
    },
    {
      "id": 109,
      "value": 120
    },
    {
      "id": 110,
      "value": 110
    },
    {
      "id": 111,
      "value": 180
    },
    {
      "id": 112,
      "value": 150
    },
    {
      "id": 113,
      "value": 140
    },
    {
      "id": 114,
      "value": 110
    },
    {
      "id": 115,
      "value": 130
    },
    {
      "id": 116,
      "value": 120
    },
    {
      "id": 117,
      "value": 130
    },
    {
      "id": 118,
      "value": 120
    },
    {
      "id": 119,
      "value": 105
    },
    {
      "id": 120,
      "value": 138
    },
    {
      "id": 121,
      "value": 130
    },
    {
      "id": 122,
      "value": 138
    },
    {
      "id": 123,
      "value": 112
    },
    {
      "id": 124,
      "value": 108
    },
    {
      "id": 125,
      "value": 94
    },
    {
      "id": 126,
      "value": 118
    },
    {
      "id": 127,
      "value": 112
    },
    {
      "id": 128,
      "value": 152
    },
    {
      "id": 129,
      "value": 136
    },
    {
      "id": 130,
      "value": 120
    },
    {
      "id": 131,
      "value": 160
    },
    {
      "id": 132,
      "value": 134
    },
    {
      "id": 133,
      "value": 120
    },
    {
      "id": 134,
      "value": 110
    },
    {
      "id": 135,
      "value": 126
    },
    {
      "id": 136,
      "value": 130
    },
    {
      "id": 137,
      "value": 120
    },
    {
      "id": 138,
      "value": 128
    },
    {
      "id": 139,
      "value": 110
    },
    {
      "id": 140,
      "value": 128
    },
    {
      "id": 141,
      "value": 120
    },
    {
      "id": 142,
      "value": 115
    },
    {
      "id": 143,
      "value": 120
    },
    {
      "id": 144,
      "value": 106
    },
    {
      "id": 145,
      "value": 140
    },
    {
      "id": 146,
      "value": 156
    },
    {
      "id": 147,
      "value": 118
    },
    {
      "id": 148,
      "value": 150
    },
    {
      "id": 149,
      "value": 120
    },
    {
      "id": 150,
      "value": 130
    },
    {
      "id": 151,
      "value": 160
    },
    {
      "id": 152,
      "value": 112
    },
    {
      "id": 153,
      "value": 170
    },
    {
      "id": 154,
      "value": 146
    },
    {
      "id": 155,
      "value": 138
    },
    {
      "id": 156,
      "value": 130
    },
    {
      "id": 157,
      "value": 130
    },
    {
      "id": 158,
      "value": 122
    },
    {
      "id": 159,
      "value": 125
    },
    {
      "id": 160,
      "value": 130
    },
    {
      "id": 161,
      "value": 120
    },
    {
      "id": 162,
      "value": 132
    },
    {
      "id": 163,
      "value": 120
    },
    {
      "id": 164,
      "value": 138
    },
    {
      "id": 165,
      "value": 138
    },
    {
      "id": 166,
      "value": 160
    },
    {
      "id": 167,
      "value": 120
    },
    {
      "id": 168,
      "value": 140
    },
    {
      "id": 169,
      "value": 130
    },
    {
      "id": 170,
      "value": 140
    },
    {
      "id": 171,
      "value": 130
    },
    {
      "id": 172,
      "value": 110
    },
    {
      "id": 173,
      "value": 120
    },
    {
      "id": 174,
      "value": 132
    },
    {
      "id": 175,
      "value": 130
    },
    {
      "id": 176,
      "value": 110
    },
    {
      "id": 177,
      "value": 117
    },
    {
      "id": 178,
      "value": 140
    },
    {
      "id": 179,
      "value": 120
    },
    {
      "id": 180,
      "value": 150
    },
    {
      "id": 181,
      "value": 132
    },
    {
      "id": 182,
      "value": 150
    },
    {
      "id": 183,
      "value": 130
    },
    {
      "id": 184,
      "value": 112
    },
    {
      "id": 185,
      "value": 150
    },
    {
      "id": 186,
      "value": 112
    },
    {
      "id": 187,
      "value": 130
    },
    {
      "id": 188,
      "value": 124
    },
    {
      "id": 189,
      "value": 140
    },
    {
      "id": 190,
      "value": 110
    },
    {
      "id": 191,
      "value": 130
    },
    {
      "id": 192,
      "value": 128
    },
    {
      "id": 193,
      "value": 120
    },
    {
      "id": 194,
      "value": 145
    },
    {
      "id": 195,
      "value": 140
    },
    {
      "id": 196,
      "value": 170
    },
    {
      "id": 197,
      "value": 150
    },
    {
      "id": 198,
      "value": 125
    },
    {
      "id": 199,
      "value": 120
    },
    {
      "id": 200,
      "value": 110
    },
    {
      "id": 201,
      "value": 110
    },
    {
      "id": 202,
      "value": 125
    },
    {
      "id": 203,
      "value": 150
    },
    {
      "id": 204,
      "value": 180
    },
    {
      "id": 205,
      "value": 160
    },
    {
      "id": 206,
      "value": 128
    },
    {
      "id": 207,
      "value": 110
    },
    {
      "id": 208,
      "value": 150
    },
    {
      "id": 209,
      "value": 120
    },
    {
      "id": 210,
      "value": 140
    },
    {
      "id": 211,
      "value": 128
    },
    {
      "id": 212,
      "value": 120
    },
    {
      "id": 213,
      "value": 118
    },
    {
      "id": 214,
      "value": 145
    },
    {
      "id": 215,
      "value": 125
    },
    {
      "id": 216,
      "value": 132
    },
    {
      "id": 217,
      "value": 130
    },
    {
      "id": 218,
      "value": 130
    },
    {
      "id": 219,
      "value": 135
    },
    {
      "id": 220,
      "value": 130
    },
    {
      "id": 221,
      "value": 150
    },
    {
      "id": 222,
      "value": 140
    },
    {
      "id": 223,
      "value": 138
    },
    {
      "id": 224,
      "value": 200
    },
    {
      "id": 225,
      "value": 110
    },
    {
      "id": 226,
      "value": 145
    },
    {
      "id": 227,
      "value": 120
    },
    {
      "id": 228,
      "value": 120
    },
    {
      "id": 229,
      "value": 170
    },
    {
      "id": 230,
      "value": 125
    },
    {
      "id": 231,
      "value": 108
    },
    {
      "id": 232,
      "value": 165
    },
    {
      "id": 233,
      "value": 160
    },
    {
      "id": 234,
      "value": 120
    },
    {
      "id": 235,
      "value": 130
    },
    {
      "id": 236,
      "value": 140
    },
    {
      "id": 237,
      "value": 125
    },
    {
      "id": 238,
      "value": 140
    },
    {
      "id": 239,
      "value": 125
    },
    {
      "id": 240,
      "value": 126
    },
    {
      "id": 241,
      "value": 160
    },
    {
      "id": 242,
      "value": 174
    },
    {
      "id": 243,
      "value": 145
    },
    {
      "id": 244,
      "value": 152
    },
    {
      "id": 245,
      "value": 132
    },
    {
      "id": 246,
      "value": 124
    },
    {
      "id": 247,
      "value": 134
    },
    {
      "id": 248,
      "value": 160
    },
    {
      "id": 249,
      "value": 192
    },
    {
      "id": 250,
      "value": 140
    },
    {
      "id": 251,
      "value": 140
    },
    {
      "id": 252,
      "value": 132
    },
    {
      "id": 253,
      "value": 138
    },
    {
      "id": 254,
      "value": 100
    },
    {
      "id": 255,
      "value": 160
    },
    {
      "id": 256,
      "value": 142
    },
    {
      "id": 257,
      "value": 128
    },
    {
      "id": 258,
      "value": 144
    },
    {
      "id": 259,
      "value": 150
    },
    {
      "id": 260,
      "value": 120
    },
    {
      "id": 261,
      "value": 178
    },
    {
      "id": 262,
      "value": 112
    },
    {
      "id": 263,
      "value": 123
    },
    {
      "id": 264,
      "value": 108
    },
    {
      "id": 265,
      "value": 110
    },
    {
      "id": 266,
      "value": 112
    },
    {
      "id": 267,
      "value": 180
    },
    {
      "id": 268,
      "value": 118
    },
    {
      "id": 269,
      "value": 122
    },
    {
      "id": 270,
      "value": 130
    },
    {
      "id": 271,
      "value": 120
    },
    {
      "id": 272,
      "value": 134
    },
    {
      "id": 273,
      "value": 120
    },
    {
      "id": 274,
      "value": 100
    },
    {
      "id": 275,
      "value": 110
    },
    {
      "id": 276,
      "value": 125
    },
    {
      "id": 277,
      "value": 146
    },
    {
      "id": 278,
      "value": 124
    },
    {
      "id": 279,
      "value": 136
    },
    {
      "id": 280,
      "value": 138
    },
    {
      "id": 281,
      "value": 136
    },
    {
      "id": 282,
      "value": 128
    },
    {
      "id": 283,
      "value": 126
    },
    {
      "id": 284,
      "value": 152
    },
    {
      "id": 285,
      "value": 140
    },
    {
      "id": 286,
      "value": 140
    },
    {
      "id": 287,
      "value": 134
    },
    {
      "id": 288,
      "value": 154
    },
    {
      "id": 289,
      "value": 110
    },
    {
      "id": 290,
      "value": 128
    },
    {
      "id": 291,
      "value": 148
    },
    {
      "id": 292,
      "value": 114
    },
    {
      "id": 293,
      "value": 170
    },
    {
      "id": 294,
      "value": 152
    },
    {
      "id": 295,
      "value": 120
    },
    {
      "id": 296,
      "value": 140
    },
    {
      "id": 297,
      "value": 124
    },
    {
      "id": 298,
      "value": 164
    },
    {
      "id": 299,
      "value": 140
    },
    {
      "id": 300,
      "value": 110
    },
    {
      "id": 301,
      "value": 144
    },
    {
      "id": 302,
      "value": 130
    },
    {
      "id": 303,
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
  db.collection("heartRate").add({
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

