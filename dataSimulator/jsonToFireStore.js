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

var heartRateData = [
  {
    "id": 1,
    "value": 145
  },
  {
    "id": 2,
    "value": 17
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

var allData = [
  {
    "id": 1,
    "trestbps": 145,
    "chol": 233,
    "fbs": 1,
    "restecg": 0,
    "thalach": 150,
    "oldpeak": 2.3,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 2,
    "trestbps": 130,
    "chol": 250,
    "fbs": 0,
    "restecg": 1,
    "thalach": 187,
    "oldpeak": 3.5,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 3,
    "trestbps": 130,
    "chol": 204,
    "fbs": 0,
    "restecg": 0,
    "thalach": 172,
    "oldpeak": 1.4,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 4,
    "trestbps": 120,
    "chol": 236,
    "fbs": 0,
    "restecg": 1,
    "thalach": 178,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 5,
    "trestbps": 120,
    "chol": 354,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 6,
    "trestbps": 140,
    "chol": 192,
    "fbs": 0,
    "restecg": 1,
    "thalach": 148,
    "oldpeak": 0.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 7,
    "trestbps": 140,
    "chol": 294,
    "fbs": 0,
    "restecg": 0,
    "thalach": 153,
    "oldpeak": 1.3,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 8,
    "trestbps": 120,
    "chol": 263,
    "fbs": 0,
    "restecg": 1,
    "thalach": 173,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 9,
    "trestbps": 172,
    "chol": 199,
    "fbs": 1,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 0.5,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 10,
    "trestbps": 150,
    "chol": 168,
    "fbs": 0,
    "restecg": 1,
    "thalach": 174,
    "oldpeak": 1.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 11,
    "trestbps": 140,
    "chol": 239,
    "fbs": 0,
    "restecg": 1,
    "thalach": 160,
    "oldpeak": 1.2,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 12,
    "trestbps": 130,
    "chol": 275,
    "fbs": 0,
    "restecg": 1,
    "thalach": 139,
    "oldpeak": 0.2,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 13,
    "trestbps": 130,
    "chol": 266,
    "fbs": 0,
    "restecg": 1,
    "thalach": 171,
    "oldpeak": 0.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 14,
    "trestbps": 110,
    "chol": 211,
    "fbs": 0,
    "restecg": 0,
    "thalach": 144,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 15,
    "trestbps": 150,
    "chol": 283,
    "fbs": 1,
    "restecg": 0,
    "thalach": 162,
    "oldpeak": 1,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 16,
    "trestbps": 120,
    "chol": 219,
    "fbs": 0,
    "restecg": 1,
    "thalach": 158,
    "oldpeak": 1.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 17,
    "trestbps": 120,
    "chol": 340,
    "fbs": 0,
    "restecg": 1,
    "thalach": 172,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 18,
    "trestbps": 150,
    "chol": 226,
    "fbs": 0,
    "restecg": 1,
    "thalach": 114,
    "oldpeak": 2.6,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 19,
    "trestbps": 150,
    "chol": 247,
    "fbs": 0,
    "restecg": 1,
    "thalach": 171,
    "oldpeak": 1.5,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 20,
    "trestbps": 140,
    "chol": 239,
    "fbs": 0,
    "restecg": 1,
    "thalach": 151,
    "oldpeak": 1.8,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 21,
    "trestbps": 135,
    "chol": 234,
    "fbs": 0,
    "restecg": 1,
    "thalach": 161,
    "oldpeak": 0.5,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 22,
    "trestbps": 130,
    "chol": 233,
    "fbs": 0,
    "restecg": 1,
    "thalach": 179,
    "oldpeak": 0.4,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 23,
    "trestbps": 140,
    "chol": 226,
    "fbs": 0,
    "restecg": 1,
    "thalach": 178,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 24,
    "trestbps": 150,
    "chol": 243,
    "fbs": 1,
    "restecg": 1,
    "thalach": 137,
    "oldpeak": 1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 25,
    "trestbps": 140,
    "chol": 199,
    "fbs": 0,
    "restecg": 1,
    "thalach": 178,
    "oldpeak": 1.4,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 26,
    "trestbps": 160,
    "chol": 302,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 0.4,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 27,
    "trestbps": 150,
    "chol": 212,
    "fbs": 1,
    "restecg": 1,
    "thalach": 157,
    "oldpeak": 1.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 28,
    "trestbps": 110,
    "chol": 175,
    "fbs": 0,
    "restecg": 1,
    "thalach": 123,
    "oldpeak": 0.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 29,
    "trestbps": 140,
    "chol": 417,
    "fbs": 1,
    "restecg": 0,
    "thalach": 157,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 30,
    "trestbps": 130,
    "chol": 197,
    "fbs": 1,
    "restecg": 0,
    "thalach": 152,
    "oldpeak": 1.2,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 31,
    "trestbps": 105,
    "chol": 198,
    "fbs": 0,
    "restecg": 1,
    "thalach": 168,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 32,
    "trestbps": 120,
    "chol": 177,
    "fbs": 0,
    "restecg": 1,
    "thalach": 140,
    "oldpeak": 0.4,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 33,
    "trestbps": 130,
    "chol": 219,
    "fbs": 0,
    "restecg": 0,
    "thalach": 188,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 34,
    "trestbps": 125,
    "chol": 273,
    "fbs": 0,
    "restecg": 0,
    "thalach": 152,
    "oldpeak": 0.5,
    "slope": 0,
    "ca": 1
  },
  {
    "id": 35,
    "trestbps": 125,
    "chol": 213,
    "fbs": 0,
    "restecg": 0,
    "thalach": 125,
    "oldpeak": 1.4,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 36,
    "trestbps": 142,
    "chol": 177,
    "fbs": 0,
    "restecg": 0,
    "thalach": 160,
    "oldpeak": 1.4,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 37,
    "trestbps": 135,
    "chol": 304,
    "fbs": 1,
    "restecg": 1,
    "thalach": 170,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 38,
    "trestbps": 150,
    "chol": 232,
    "fbs": 0,
    "restecg": 0,
    "thalach": 165,
    "oldpeak": 1.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 39,
    "trestbps": 155,
    "chol": 269,
    "fbs": 0,
    "restecg": 1,
    "thalach": 148,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 40,
    "trestbps": 160,
    "chol": 360,
    "fbs": 0,
    "restecg": 0,
    "thalach": 151,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 41,
    "trestbps": 140,
    "chol": 308,
    "fbs": 0,
    "restecg": 0,
    "thalach": 142,
    "oldpeak": 1.5,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 42,
    "trestbps": 130,
    "chol": 245,
    "fbs": 0,
    "restecg": 0,
    "thalach": 180,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 43,
    "trestbps": 104,
    "chol": 208,
    "fbs": 0,
    "restecg": 0,
    "thalach": 148,
    "oldpeak": 3,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 44,
    "trestbps": 130,
    "chol": 264,
    "fbs": 0,
    "restecg": 0,
    "thalach": 143,
    "oldpeak": 0.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 45,
    "trestbps": 140,
    "chol": 321,
    "fbs": 0,
    "restecg": 0,
    "thalach": 182,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 46,
    "trestbps": 120,
    "chol": 325,
    "fbs": 0,
    "restecg": 1,
    "thalach": 172,
    "oldpeak": 0.2,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 47,
    "trestbps": 140,
    "chol": 235,
    "fbs": 0,
    "restecg": 0,
    "thalach": 180,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 48,
    "trestbps": 138,
    "chol": 257,
    "fbs": 0,
    "restecg": 0,
    "thalach": 156,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 49,
    "trestbps": 128,
    "chol": 216,
    "fbs": 0,
    "restecg": 0,
    "thalach": 115,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 50,
    "trestbps": 138,
    "chol": 234,
    "fbs": 0,
    "restecg": 0,
    "thalach": 160,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 51,
    "trestbps": 130,
    "chol": 256,
    "fbs": 0,
    "restecg": 0,
    "thalach": 149,
    "oldpeak": 0.5,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 52,
    "trestbps": 120,
    "chol": 302,
    "fbs": 0,
    "restecg": 0,
    "thalach": 151,
    "oldpeak": 0.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 53,
    "trestbps": 130,
    "chol": 231,
    "fbs": 0,
    "restecg": 1,
    "thalach": 146,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 54,
    "trestbps": 108,
    "chol": 141,
    "fbs": 0,
    "restecg": 1,
    "thalach": 175,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 55,
    "trestbps": 135,
    "chol": 252,
    "fbs": 0,
    "restecg": 0,
    "thalach": 172,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 56,
    "trestbps": 134,
    "chol": 201,
    "fbs": 0,
    "restecg": 1,
    "thalach": 158,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 57,
    "trestbps": 122,
    "chol": 222,
    "fbs": 0,
    "restecg": 0,
    "thalach": 186,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 58,
    "trestbps": 115,
    "chol": 260,
    "fbs": 0,
    "restecg": 0,
    "thalach": 185,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 59,
    "trestbps": 118,
    "chol": 182,
    "fbs": 0,
    "restecg": 0,
    "thalach": 174,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 60,
    "trestbps": 128,
    "chol": 303,
    "fbs": 0,
    "restecg": 0,
    "thalach": 159,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 61,
    "trestbps": 110,
    "chol": 265,
    "fbs": 1,
    "restecg": 0,
    "thalach": 130,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 62,
    "trestbps": 108,
    "chol": 309,
    "fbs": 0,
    "restecg": 1,
    "thalach": 156,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 63,
    "trestbps": 118,
    "chol": 186,
    "fbs": 0,
    "restecg": 0,
    "thalach": 190,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 64,
    "trestbps": 135,
    "chol": 203,
    "fbs": 0,
    "restecg": 1,
    "thalach": 132,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 65,
    "trestbps": 140,
    "chol": 211,
    "fbs": 1,
    "restecg": 0,
    "thalach": 165,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 66,
    "trestbps": 138,
    "chol": 183,
    "fbs": 0,
    "restecg": 1,
    "thalach": 182,
    "oldpeak": 1.4,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 67,
    "trestbps": 100,
    "chol": 222,
    "fbs": 0,
    "restecg": 1,
    "thalach": 143,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 68,
    "trestbps": 130,
    "chol": 234,
    "fbs": 0,
    "restecg": 0,
    "thalach": 175,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 69,
    "trestbps": 120,
    "chol": 220,
    "fbs": 0,
    "restecg": 1,
    "thalach": 170,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 70,
    "trestbps": 124,
    "chol": 209,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 71,
    "trestbps": 120,
    "chol": 258,
    "fbs": 0,
    "restecg": 0,
    "thalach": 147,
    "oldpeak": 0.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 72,
    "trestbps": 94,
    "chol": 227,
    "fbs": 0,
    "restecg": 1,
    "thalach": 154,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 73,
    "trestbps": 130,
    "chol": 204,
    "fbs": 0,
    "restecg": 0,
    "thalach": 202,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 74,
    "trestbps": 140,
    "chol": 261,
    "fbs": 0,
    "restecg": 0,
    "thalach": 186,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 75,
    "trestbps": 122,
    "chol": 213,
    "fbs": 0,
    "restecg": 1,
    "thalach": 165,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 76,
    "trestbps": 135,
    "chol": 250,
    "fbs": 0,
    "restecg": 0,
    "thalach": 161,
    "oldpeak": 1.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 77,
    "trestbps": 125,
    "chol": 245,
    "fbs": 1,
    "restecg": 0,
    "thalach": 166,
    "oldpeak": 2.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 78,
    "trestbps": 140,
    "chol": 221,
    "fbs": 0,
    "restecg": 1,
    "thalach": 164,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 79,
    "trestbps": 128,
    "chol": 205,
    "fbs": 1,
    "restecg": 1,
    "thalach": 184,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 80,
    "trestbps": 105,
    "chol": 240,
    "fbs": 0,
    "restecg": 0,
    "thalach": 154,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 81,
    "trestbps": 112,
    "chol": 250,
    "fbs": 0,
    "restecg": 1,
    "thalach": 179,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 82,
    "trestbps": 128,
    "chol": 308,
    "fbs": 0,
    "restecg": 0,
    "thalach": 170,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 83,
    "trestbps": 102,
    "chol": 318,
    "fbs": 0,
    "restecg": 1,
    "thalach": 160,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 84,
    "trestbps": 152,
    "chol": 298,
    "fbs": 1,
    "restecg": 1,
    "thalach": 178,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 85,
    "trestbps": 102,
    "chol": 265,
    "fbs": 0,
    "restecg": 0,
    "thalach": 122,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 86,
    "trestbps": 115,
    "chol": 564,
    "fbs": 0,
    "restecg": 0,
    "thalach": 160,
    "oldpeak": 1.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 87,
    "trestbps": 118,
    "chol": 277,
    "fbs": 0,
    "restecg": 1,
    "thalach": 151,
    "oldpeak": 1,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 88,
    "trestbps": 101,
    "chol": 197,
    "fbs": 1,
    "restecg": 1,
    "thalach": 156,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 89,
    "trestbps": 110,
    "chol": 214,
    "fbs": 0,
    "restecg": 1,
    "thalach": 158,
    "oldpeak": 1.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 90,
    "trestbps": 100,
    "chol": 248,
    "fbs": 0,
    "restecg": 0,
    "thalach": 122,
    "oldpeak": 1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 91,
    "trestbps": 124,
    "chol": 255,
    "fbs": 1,
    "restecg": 1,
    "thalach": 175,
    "oldpeak": 0,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 92,
    "trestbps": 132,
    "chol": 207,
    "fbs": 0,
    "restecg": 1,
    "thalach": 168,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 93,
    "trestbps": 138,
    "chol": 223,
    "fbs": 0,
    "restecg": 1,
    "thalach": 169,
    "oldpeak": 0,
    "slope": 2,
    "ca": 4
  },
  {
    "id": 94,
    "trestbps": 132,
    "chol": 288,
    "fbs": 1,
    "restecg": 0,
    "thalach": 159,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 95,
    "trestbps": 112,
    "chol": 160,
    "fbs": 0,
    "restecg": 1,
    "thalach": 138,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 96,
    "trestbps": 142,
    "chol": 226,
    "fbs": 0,
    "restecg": 0,
    "thalach": 111,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 97,
    "trestbps": 140,
    "chol": 394,
    "fbs": 0,
    "restecg": 0,
    "thalach": 157,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 98,
    "trestbps": 108,
    "chol": 233,
    "fbs": 1,
    "restecg": 1,
    "thalach": 147,
    "oldpeak": 0.1,
    "slope": 2,
    "ca": 3
  },
  {
    "id": 99,
    "trestbps": 130,
    "chol": 315,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 1.9,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 100,
    "trestbps": 130,
    "chol": 246,
    "fbs": 1,
    "restecg": 0,
    "thalach": 173,
    "oldpeak": 0,
    "slope": 2,
    "ca": 3
  },
  {
    "id": 101,
    "trestbps": 148,
    "chol": 244,
    "fbs": 0,
    "restecg": 0,
    "thalach": 178,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 102,
    "trestbps": 178,
    "chol": 270,
    "fbs": 0,
    "restecg": 0,
    "thalach": 145,
    "oldpeak": 4.2,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 103,
    "trestbps": 140,
    "chol": 195,
    "fbs": 0,
    "restecg": 1,
    "thalach": 179,
    "oldpeak": 0,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 104,
    "trestbps": 120,
    "chol": 240,
    "fbs": 1,
    "restecg": 1,
    "thalach": 194,
    "oldpeak": 0.8,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 105,
    "trestbps": 129,
    "chol": 196,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 106,
    "trestbps": 120,
    "chol": 211,
    "fbs": 0,
    "restecg": 0,
    "thalach": 115,
    "oldpeak": 1.5,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 107,
    "trestbps": 160,
    "chol": 234,
    "fbs": 1,
    "restecg": 0,
    "thalach": 131,
    "oldpeak": 0.1,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 108,
    "trestbps": 138,
    "chol": 236,
    "fbs": 0,
    "restecg": 0,
    "thalach": 152,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 109,
    "trestbps": 120,
    "chol": 244,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 1.1,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 110,
    "trestbps": 110,
    "chol": 254,
    "fbs": 0,
    "restecg": 0,
    "thalach": 159,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 111,
    "trestbps": 180,
    "chol": 325,
    "fbs": 0,
    "restecg": 1,
    "thalach": 154,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 112,
    "trestbps": 150,
    "chol": 126,
    "fbs": 1,
    "restecg": 1,
    "thalach": 173,
    "oldpeak": 0.2,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 113,
    "trestbps": 140,
    "chol": 313,
    "fbs": 0,
    "restecg": 1,
    "thalach": 133,
    "oldpeak": 0.2,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 114,
    "trestbps": 110,
    "chol": 211,
    "fbs": 0,
    "restecg": 1,
    "thalach": 161,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 115,
    "trestbps": 130,
    "chol": 262,
    "fbs": 0,
    "restecg": 1,
    "thalach": 155,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 116,
    "trestbps": 120,
    "chol": 215,
    "fbs": 0,
    "restecg": 1,
    "thalach": 170,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 117,
    "trestbps": 130,
    "chol": 214,
    "fbs": 0,
    "restecg": 0,
    "thalach": 168,
    "oldpeak": 2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 118,
    "trestbps": 120,
    "chol": 193,
    "fbs": 0,
    "restecg": 0,
    "thalach": 162,
    "oldpeak": 1.9,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 119,
    "trestbps": 105,
    "chol": 204,
    "fbs": 0,
    "restecg": 1,
    "thalach": 172,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 120,
    "trestbps": 138,
    "chol": 243,
    "fbs": 0,
    "restecg": 0,
    "thalach": 152,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 121,
    "trestbps": 130,
    "chol": 303,
    "fbs": 0,
    "restecg": 1,
    "thalach": 122,
    "oldpeak": 2,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 122,
    "trestbps": 138,
    "chol": 271,
    "fbs": 0,
    "restecg": 0,
    "thalach": 182,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 123,
    "trestbps": 112,
    "chol": 268,
    "fbs": 0,
    "restecg": 0,
    "thalach": 172,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 124,
    "trestbps": 108,
    "chol": 267,
    "fbs": 0,
    "restecg": 0,
    "thalach": 167,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 125,
    "trestbps": 94,
    "chol": 199,
    "fbs": 0,
    "restecg": 1,
    "thalach": 179,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 126,
    "trestbps": 118,
    "chol": 210,
    "fbs": 0,
    "restecg": 1,
    "thalach": 192,
    "oldpeak": 0.7,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 127,
    "trestbps": 112,
    "chol": 204,
    "fbs": 0,
    "restecg": 1,
    "thalach": 143,
    "oldpeak": 0.1,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 128,
    "trestbps": 152,
    "chol": 277,
    "fbs": 0,
    "restecg": 1,
    "thalach": 172,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 129,
    "trestbps": 136,
    "chol": 196,
    "fbs": 0,
    "restecg": 0,
    "thalach": 169,
    "oldpeak": 0.1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 130,
    "trestbps": 120,
    "chol": 269,
    "fbs": 0,
    "restecg": 0,
    "thalach": 121,
    "oldpeak": 0.2,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 131,
    "trestbps": 160,
    "chol": 201,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 132,
    "trestbps": 134,
    "chol": 271,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 133,
    "trestbps": 120,
    "chol": 295,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 134,
    "trestbps": 110,
    "chol": 235,
    "fbs": 0,
    "restecg": 1,
    "thalach": 153,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 135,
    "trestbps": 126,
    "chol": 306,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 136,
    "trestbps": 130,
    "chol": 269,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 137,
    "trestbps": 120,
    "chol": 178,
    "fbs": 1,
    "restecg": 1,
    "thalach": 96,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 138,
    "trestbps": 128,
    "chol": 208,
    "fbs": 1,
    "restecg": 0,
    "thalach": 140,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 139,
    "trestbps": 110,
    "chol": 201,
    "fbs": 0,
    "restecg": 1,
    "thalach": 126,
    "oldpeak": 1.5,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 140,
    "trestbps": 128,
    "chol": 263,
    "fbs": 0,
    "restecg": 1,
    "thalach": 105,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 141,
    "trestbps": 120,
    "chol": 295,
    "fbs": 0,
    "restecg": 0,
    "thalach": 157,
    "oldpeak": 0.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 142,
    "trestbps": 115,
    "chol": 303,
    "fbs": 0,
    "restecg": 1,
    "thalach": 181,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 143,
    "trestbps": 120,
    "chol": 209,
    "fbs": 0,
    "restecg": 1,
    "thalach": 173,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 144,
    "trestbps": 106,
    "chol": 223,
    "fbs": 0,
    "restecg": 1,
    "thalach": 142,
    "oldpeak": 0.3,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 145,
    "trestbps": 140,
    "chol": 197,
    "fbs": 0,
    "restecg": 2,
    "thalach": 116,
    "oldpeak": 1.1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 146,
    "trestbps": 156,
    "chol": 245,
    "fbs": 0,
    "restecg": 0,
    "thalach": 143,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 147,
    "trestbps": 118,
    "chol": 242,
    "fbs": 0,
    "restecg": 1,
    "thalach": 149,
    "oldpeak": 0.3,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 148,
    "trestbps": 150,
    "chol": 240,
    "fbs": 0,
    "restecg": 1,
    "thalach": 171,
    "oldpeak": 0.9,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 149,
    "trestbps": 120,
    "chol": 226,
    "fbs": 0,
    "restecg": 1,
    "thalach": 169,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 150,
    "trestbps": 130,
    "chol": 180,
    "fbs": 0,
    "restecg": 1,
    "thalach": 150,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 151,
    "trestbps": 160,
    "chol": 228,
    "fbs": 0,
    "restecg": 0,
    "thalach": 138,
    "oldpeak": 2.3,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 152,
    "trestbps": 112,
    "chol": 149,
    "fbs": 0,
    "restecg": 1,
    "thalach": 125,
    "oldpeak": 1.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 153,
    "trestbps": 170,
    "chol": 227,
    "fbs": 0,
    "restecg": 0,
    "thalach": 155,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 154,
    "trestbps": 146,
    "chol": 278,
    "fbs": 0,
    "restecg": 0,
    "thalach": 152,
    "oldpeak": 0,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 155,
    "trestbps": 138,
    "chol": 220,
    "fbs": 0,
    "restecg": 1,
    "thalach": 152,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 156,
    "trestbps": 130,
    "chol": 197,
    "fbs": 0,
    "restecg": 1,
    "thalach": 131,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 157,
    "trestbps": 130,
    "chol": 253,
    "fbs": 0,
    "restecg": 1,
    "thalach": 179,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 158,
    "trestbps": 122,
    "chol": 192,
    "fbs": 0,
    "restecg": 1,
    "thalach": 174,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 159,
    "trestbps": 125,
    "chol": 220,
    "fbs": 0,
    "restecg": 1,
    "thalach": 144,
    "oldpeak": 0.4,
    "slope": 1,
    "ca": 4
  },
  {
    "id": 160,
    "trestbps": 130,
    "chol": 221,
    "fbs": 0,
    "restecg": 0,
    "thalach": 163,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 161,
    "trestbps": 120,
    "chol": 240,
    "fbs": 0,
    "restecg": 1,
    "thalach": 169,
    "oldpeak": 0,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 162,
    "trestbps": 132,
    "chol": 342,
    "fbs": 0,
    "restecg": 1,
    "thalach": 166,
    "oldpeak": 1.2,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 163,
    "trestbps": 120,
    "chol": 157,
    "fbs": 0,
    "restecg": 1,
    "thalach": 182,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 164,
    "trestbps": 138,
    "chol": 175,
    "fbs": 0,
    "restecg": 1,
    "thalach": 173,
    "oldpeak": 0,
    "slope": 2,
    "ca": 4
  },
  {
    "id": 165,
    "trestbps": 138,
    "chol": 175,
    "fbs": 0,
    "restecg": 1,
    "thalach": 173,
    "oldpeak": 0,
    "slope": 2,
    "ca": 4
  },
  {
    "id": 166,
    "trestbps": 160,
    "chol": 286,
    "fbs": 0,
    "restecg": 0,
    "thalach": 108,
    "oldpeak": 1.5,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 167,
    "trestbps": 120,
    "chol": 229,
    "fbs": 0,
    "restecg": 0,
    "thalach": 129,
    "oldpeak": 2.6,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 168,
    "trestbps": 140,
    "chol": 268,
    "fbs": 0,
    "restecg": 0,
    "thalach": 160,
    "oldpeak": 3.6,
    "slope": 0,
    "ca": 2
  },
  {
    "id": 169,
    "trestbps": 130,
    "chol": 254,
    "fbs": 0,
    "restecg": 0,
    "thalach": 147,
    "oldpeak": 1.4,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 170,
    "trestbps": 140,
    "chol": 203,
    "fbs": 1,
    "restecg": 0,
    "thalach": 155,
    "oldpeak": 3.1,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 171,
    "trestbps": 130,
    "chol": 256,
    "fbs": 1,
    "restecg": 0,
    "thalach": 142,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 172,
    "trestbps": 110,
    "chol": 229,
    "fbs": 0,
    "restecg": 1,
    "thalach": 168,
    "oldpeak": 1,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 173,
    "trestbps": 120,
    "chol": 284,
    "fbs": 0,
    "restecg": 0,
    "thalach": 160,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 174,
    "trestbps": 132,
    "chol": 224,
    "fbs": 0,
    "restecg": 0,
    "thalach": 173,
    "oldpeak": 3.2,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 175,
    "trestbps": 130,
    "chol": 206,
    "fbs": 0,
    "restecg": 0,
    "thalach": 132,
    "oldpeak": 2.4,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 176,
    "trestbps": 110,
    "chol": 167,
    "fbs": 0,
    "restecg": 0,
    "thalach": 114,
    "oldpeak": 2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 177,
    "trestbps": 117,
    "chol": 230,
    "fbs": 1,
    "restecg": 1,
    "thalach": 160,
    "oldpeak": 1.4,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 178,
    "trestbps": 140,
    "chol": 335,
    "fbs": 0,
    "restecg": 1,
    "thalach": 158,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 179,
    "trestbps": 120,
    "chol": 177,
    "fbs": 0,
    "restecg": 0,
    "thalach": 120,
    "oldpeak": 2.5,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 180,
    "trestbps": 150,
    "chol": 276,
    "fbs": 0,
    "restecg": 0,
    "thalach": 112,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 181,
    "trestbps": 132,
    "chol": 353,
    "fbs": 0,
    "restecg": 1,
    "thalach": 132,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 182,
    "trestbps": 150,
    "chol": 225,
    "fbs": 0,
    "restecg": 0,
    "thalach": 114,
    "oldpeak": 1,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 183,
    "trestbps": 130,
    "chol": 330,
    "fbs": 0,
    "restecg": 0,
    "thalach": 169,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 184,
    "trestbps": 112,
    "chol": 230,
    "fbs": 0,
    "restecg": 0,
    "thalach": 165,
    "oldpeak": 2.5,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 185,
    "trestbps": 150,
    "chol": 243,
    "fbs": 0,
    "restecg": 0,
    "thalach": 128,
    "oldpeak": 2.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 186,
    "trestbps": 112,
    "chol": 290,
    "fbs": 0,
    "restecg": 0,
    "thalach": 153,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 187,
    "trestbps": 130,
    "chol": 253,
    "fbs": 0,
    "restecg": 1,
    "thalach": 144,
    "oldpeak": 1.4,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 188,
    "trestbps": 124,
    "chol": 266,
    "fbs": 0,
    "restecg": 0,
    "thalach": 109,
    "oldpeak": 2.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 189,
    "trestbps": 140,
    "chol": 233,
    "fbs": 0,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0.6,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 190,
    "trestbps": 110,
    "chol": 172,
    "fbs": 0,
    "restecg": 0,
    "thalach": 158,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 191,
    "trestbps": 130,
    "chol": 305,
    "fbs": 0,
    "restecg": 1,
    "thalach": 142,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 192,
    "trestbps": 128,
    "chol": 216,
    "fbs": 0,
    "restecg": 0,
    "thalach": 131,
    "oldpeak": 2.2,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 193,
    "trestbps": 120,
    "chol": 188,
    "fbs": 0,
    "restecg": 1,
    "thalach": 113,
    "oldpeak": 1.4,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 194,
    "trestbps": 145,
    "chol": 282,
    "fbs": 0,
    "restecg": 0,
    "thalach": 142,
    "oldpeak": 2.8,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 195,
    "trestbps": 140,
    "chol": 185,
    "fbs": 0,
    "restecg": 0,
    "thalach": 155,
    "oldpeak": 3,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 196,
    "trestbps": 170,
    "chol": 326,
    "fbs": 0,
    "restecg": 0,
    "thalach": 140,
    "oldpeak": 3.4,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 197,
    "trestbps": 150,
    "chol": 231,
    "fbs": 0,
    "restecg": 1,
    "thalach": 147,
    "oldpeak": 3.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 198,
    "trestbps": 125,
    "chol": 254,
    "fbs": 1,
    "restecg": 1,
    "thalach": 163,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 199,
    "trestbps": 120,
    "chol": 267,
    "fbs": 0,
    "restecg": 1,
    "thalach": 99,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 200,
    "trestbps": 110,
    "chol": 248,
    "fbs": 0,
    "restecg": 0,
    "thalach": 158,
    "oldpeak": 0.6,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 201,
    "trestbps": 110,
    "chol": 197,
    "fbs": 0,
    "restecg": 0,
    "thalach": 177,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 202,
    "trestbps": 125,
    "chol": 258,
    "fbs": 0,
    "restecg": 0,
    "thalach": 141,
    "oldpeak": 2.8,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 203,
    "trestbps": 150,
    "chol": 270,
    "fbs": 0,
    "restecg": 0,
    "thalach": 111,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 204,
    "trestbps": 180,
    "chol": 274,
    "fbs": 1,
    "restecg": 0,
    "thalach": 150,
    "oldpeak": 1.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 205,
    "trestbps": 160,
    "chol": 164,
    "fbs": 0,
    "restecg": 0,
    "thalach": 145,
    "oldpeak": 6.2,
    "slope": 0,
    "ca": 3
  },
  {
    "id": 206,
    "trestbps": 128,
    "chol": 255,
    "fbs": 0,
    "restecg": 1,
    "thalach": 161,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 207,
    "trestbps": 110,
    "chol": 239,
    "fbs": 0,
    "restecg": 0,
    "thalach": 142,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 208,
    "trestbps": 150,
    "chol": 258,
    "fbs": 0,
    "restecg": 0,
    "thalach": 157,
    "oldpeak": 2.6,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 209,
    "trestbps": 120,
    "chol": 188,
    "fbs": 0,
    "restecg": 1,
    "thalach": 139,
    "oldpeak": 2,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 210,
    "trestbps": 140,
    "chol": 177,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 211,
    "trestbps": 128,
    "chol": 229,
    "fbs": 0,
    "restecg": 0,
    "thalach": 150,
    "oldpeak": 0.4,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 212,
    "trestbps": 120,
    "chol": 260,
    "fbs": 0,
    "restecg": 1,
    "thalach": 140,
    "oldpeak": 3.6,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 213,
    "trestbps": 118,
    "chol": 219,
    "fbs": 0,
    "restecg": 1,
    "thalach": 140,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 214,
    "trestbps": 145,
    "chol": 307,
    "fbs": 0,
    "restecg": 0,
    "thalach": 146,
    "oldpeak": 1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 215,
    "trestbps": 125,
    "chol": 249,
    "fbs": 1,
    "restecg": 0,
    "thalach": 144,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 216,
    "trestbps": 132,
    "chol": 341,
    "fbs": 1,
    "restecg": 0,
    "thalach": 136,
    "oldpeak": 3,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 217,
    "trestbps": 130,
    "chol": 263,
    "fbs": 0,
    "restecg": 1,
    "thalach": 97,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 218,
    "trestbps": 130,
    "chol": 330,
    "fbs": 1,
    "restecg": 0,
    "thalach": 132,
    "oldpeak": 1.8,
    "slope": 2,
    "ca": 3
  },
  {
    "id": 219,
    "trestbps": 135,
    "chol": 254,
    "fbs": 0,
    "restecg": 0,
    "thalach": 127,
    "oldpeak": 2.8,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 220,
    "trestbps": 130,
    "chol": 256,
    "fbs": 1,
    "restecg": 0,
    "thalach": 150,
    "oldpeak": 0,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 221,
    "trestbps": 150,
    "chol": 407,
    "fbs": 0,
    "restecg": 0,
    "thalach": 154,
    "oldpeak": 4,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 222,
    "trestbps": 140,
    "chol": 217,
    "fbs": 0,
    "restecg": 1,
    "thalach": 111,
    "oldpeak": 5.6,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 223,
    "trestbps": 138,
    "chol": 282,
    "fbs": 1,
    "restecg": 0,
    "thalach": 174,
    "oldpeak": 1.4,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 224,
    "trestbps": 200,
    "chol": 288,
    "fbs": 1,
    "restecg": 0,
    "thalach": 133,
    "oldpeak": 4,
    "slope": 0,
    "ca": 2
  },
  {
    "id": 225,
    "trestbps": 110,
    "chol": 239,
    "fbs": 0,
    "restecg": 1,
    "thalach": 126,
    "oldpeak": 2.8,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 226,
    "trestbps": 145,
    "chol": 174,
    "fbs": 0,
    "restecg": 1,
    "thalach": 125,
    "oldpeak": 2.6,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 227,
    "trestbps": 120,
    "chol": 281,
    "fbs": 0,
    "restecg": 0,
    "thalach": 103,
    "oldpeak": 1.4,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 228,
    "trestbps": 120,
    "chol": 198,
    "fbs": 0,
    "restecg": 1,
    "thalach": 130,
    "oldpeak": 1.6,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 229,
    "trestbps": 170,
    "chol": 288,
    "fbs": 0,
    "restecg": 0,
    "thalach": 159,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 230,
    "trestbps": 125,
    "chol": 309,
    "fbs": 0,
    "restecg": 1,
    "thalach": 131,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 231,
    "trestbps": 108,
    "chol": 243,
    "fbs": 0,
    "restecg": 1,
    "thalach": 152,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 232,
    "trestbps": 165,
    "chol": 289,
    "fbs": 1,
    "restecg": 0,
    "thalach": 124,
    "oldpeak": 1,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 233,
    "trestbps": 160,
    "chol": 289,
    "fbs": 0,
    "restecg": 0,
    "thalach": 145,
    "oldpeak": 0.8,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 234,
    "trestbps": 120,
    "chol": 246,
    "fbs": 0,
    "restecg": 0,
    "thalach": 96,
    "oldpeak": 2.2,
    "slope": 0,
    "ca": 1
  },
  {
    "id": 235,
    "trestbps": 130,
    "chol": 322,
    "fbs": 0,
    "restecg": 0,
    "thalach": 109,
    "oldpeak": 2.4,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 236,
    "trestbps": 140,
    "chol": 299,
    "fbs": 0,
    "restecg": 1,
    "thalach": 173,
    "oldpeak": 1.6,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 237,
    "trestbps": 125,
    "chol": 300,
    "fbs": 0,
    "restecg": 0,
    "thalach": 171,
    "oldpeak": 0,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 238,
    "trestbps": 140,
    "chol": 293,
    "fbs": 0,
    "restecg": 0,
    "thalach": 170,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 239,
    "trestbps": 125,
    "chol": 304,
    "fbs": 0,
    "restecg": 0,
    "thalach": 162,
    "oldpeak": 0,
    "slope": 2,
    "ca": 3
  },
  {
    "id": 240,
    "trestbps": 126,
    "chol": 282,
    "fbs": 0,
    "restecg": 0,
    "thalach": 156,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 241,
    "trestbps": 160,
    "chol": 269,
    "fbs": 0,
    "restecg": 1,
    "thalach": 112,
    "oldpeak": 2.9,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 242,
    "trestbps": 174,
    "chol": 249,
    "fbs": 0,
    "restecg": 1,
    "thalach": 143,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 243,
    "trestbps": 145,
    "chol": 212,
    "fbs": 0,
    "restecg": 0,
    "thalach": 132,
    "oldpeak": 2,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 244,
    "trestbps": 152,
    "chol": 274,
    "fbs": 0,
    "restecg": 1,
    "thalach": 88,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 245,
    "trestbps": 132,
    "chol": 184,
    "fbs": 0,
    "restecg": 0,
    "thalach": 105,
    "oldpeak": 2.1,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 246,
    "trestbps": 124,
    "chol": 274,
    "fbs": 0,
    "restecg": 0,
    "thalach": 166,
    "oldpeak": 0.5,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 247,
    "trestbps": 134,
    "chol": 409,
    "fbs": 0,
    "restecg": 0,
    "thalach": 150,
    "oldpeak": 1.9,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 248,
    "trestbps": 160,
    "chol": 246,
    "fbs": 0,
    "restecg": 1,
    "thalach": 120,
    "oldpeak": 0,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 249,
    "trestbps": 192,
    "chol": 283,
    "fbs": 0,
    "restecg": 0,
    "thalach": 195,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 250,
    "trestbps": 140,
    "chol": 254,
    "fbs": 0,
    "restecg": 0,
    "thalach": 146,
    "oldpeak": 2,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 251,
    "trestbps": 140,
    "chol": 298,
    "fbs": 0,
    "restecg": 1,
    "thalach": 122,
    "oldpeak": 4.2,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 252,
    "trestbps": 132,
    "chol": 247,
    "fbs": 1,
    "restecg": 0,
    "thalach": 143,
    "oldpeak": 0.1,
    "slope": 1,
    "ca": 4
  },
  {
    "id": 253,
    "trestbps": 138,
    "chol": 294,
    "fbs": 1,
    "restecg": 1,
    "thalach": 106,
    "oldpeak": 1.9,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 254,
    "trestbps": 100,
    "chol": 299,
    "fbs": 0,
    "restecg": 0,
    "thalach": 125,
    "oldpeak": 0.9,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 255,
    "trestbps": 160,
    "chol": 273,
    "fbs": 0,
    "restecg": 0,
    "thalach": 125,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 256,
    "trestbps": 142,
    "chol": 309,
    "fbs": 0,
    "restecg": 0,
    "thalach": 147,
    "oldpeak": 0,
    "slope": 1,
    "ca": 3
  },
  {
    "id": 257,
    "trestbps": 128,
    "chol": 259,
    "fbs": 0,
    "restecg": 0,
    "thalach": 130,
    "oldpeak": 3,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 258,
    "trestbps": 144,
    "chol": 200,
    "fbs": 0,
    "restecg": 0,
    "thalach": 126,
    "oldpeak": 0.9,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 259,
    "trestbps": 150,
    "chol": 244,
    "fbs": 0,
    "restecg": 1,
    "thalach": 154,
    "oldpeak": 1.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 260,
    "trestbps": 120,
    "chol": 231,
    "fbs": 0,
    "restecg": 1,
    "thalach": 182,
    "oldpeak": 3.8,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 261,
    "trestbps": 178,
    "chol": 228,
    "fbs": 1,
    "restecg": 1,
    "thalach": 165,
    "oldpeak": 1,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 262,
    "trestbps": 112,
    "chol": 230,
    "fbs": 0,
    "restecg": 1,
    "thalach": 160,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 263,
    "trestbps": 123,
    "chol": 282,
    "fbs": 0,
    "restecg": 1,
    "thalach": 95,
    "oldpeak": 2,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 264,
    "trestbps": 108,
    "chol": 269,
    "fbs": 0,
    "restecg": 1,
    "thalach": 169,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 265,
    "trestbps": 110,
    "chol": 206,
    "fbs": 0,
    "restecg": 0,
    "thalach": 108,
    "oldpeak": 0,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 266,
    "trestbps": 112,
    "chol": 212,
    "fbs": 0,
    "restecg": 0,
    "thalach": 132,
    "oldpeak": 0.1,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 267,
    "trestbps": 180,
    "chol": 327,
    "fbs": 0,
    "restecg": 2,
    "thalach": 117,
    "oldpeak": 3.4,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 268,
    "trestbps": 118,
    "chol": 149,
    "fbs": 0,
    "restecg": 0,
    "thalach": 126,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 3
  },
  {
    "id": 269,
    "trestbps": 122,
    "chol": 286,
    "fbs": 0,
    "restecg": 0,
    "thalach": 116,
    "oldpeak": 3.2,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 270,
    "trestbps": 130,
    "chol": 283,
    "fbs": 1,
    "restecg": 0,
    "thalach": 103,
    "oldpeak": 1.6,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 271,
    "trestbps": 120,
    "chol": 249,
    "fbs": 0,
    "restecg": 0,
    "thalach": 144,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 272,
    "trestbps": 134,
    "chol": 234,
    "fbs": 0,
    "restecg": 1,
    "thalach": 145,
    "oldpeak": 2.6,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 273,
    "trestbps": 120,
    "chol": 237,
    "fbs": 0,
    "restecg": 1,
    "thalach": 71,
    "oldpeak": 1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 274,
    "trestbps": 100,
    "chol": 234,
    "fbs": 0,
    "restecg": 1,
    "thalach": 156,
    "oldpeak": 0.1,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 275,
    "trestbps": 110,
    "chol": 275,
    "fbs": 0,
    "restecg": 0,
    "thalach": 118,
    "oldpeak": 1,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 276,
    "trestbps": 125,
    "chol": 212,
    "fbs": 0,
    "restecg": 1,
    "thalach": 168,
    "oldpeak": 1,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 277,
    "trestbps": 146,
    "chol": 218,
    "fbs": 0,
    "restecg": 1,
    "thalach": 105,
    "oldpeak": 2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 278,
    "trestbps": 124,
    "chol": 261,
    "fbs": 0,
    "restecg": 1,
    "thalach": 141,
    "oldpeak": 0.3,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 279,
    "trestbps": 136,
    "chol": 319,
    "fbs": 1,
    "restecg": 0,
    "thalach": 152,
    "oldpeak": 0,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 280,
    "trestbps": 138,
    "chol": 166,
    "fbs": 0,
    "restecg": 0,
    "thalach": 125,
    "oldpeak": 3.6,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 281,
    "trestbps": 136,
    "chol": 315,
    "fbs": 0,
    "restecg": 1,
    "thalach": 125,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 282,
    "trestbps": 128,
    "chol": 204,
    "fbs": 1,
    "restecg": 1,
    "thalach": 156,
    "oldpeak": 1,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 283,
    "trestbps": 126,
    "chol": 218,
    "fbs": 1,
    "restecg": 1,
    "thalach": 134,
    "oldpeak": 2.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 284,
    "trestbps": 152,
    "chol": 223,
    "fbs": 0,
    "restecg": 1,
    "thalach": 181,
    "oldpeak": 0,
    "slope": 2,
    "ca": 0
  },
  {
    "id": 285,
    "trestbps": 140,
    "chol": 207,
    "fbs": 0,
    "restecg": 0,
    "thalach": 138,
    "oldpeak": 1.9,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 286,
    "trestbps": 140,
    "chol": 311,
    "fbs": 0,
    "restecg": 1,
    "thalach": 120,
    "oldpeak": 1.8,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 287,
    "trestbps": 134,
    "chol": 204,
    "fbs": 0,
    "restecg": 1,
    "thalach": 162,
    "oldpeak": 0.8,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 288,
    "trestbps": 154,
    "chol": 232,
    "fbs": 0,
    "restecg": 0,
    "thalach": 164,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 289,
    "trestbps": 110,
    "chol": 335,
    "fbs": 0,
    "restecg": 1,
    "thalach": 143,
    "oldpeak": 3,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 290,
    "trestbps": 128,
    "chol": 205,
    "fbs": 0,
    "restecg": 2,
    "thalach": 130,
    "oldpeak": 2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 291,
    "trestbps": 148,
    "chol": 203,
    "fbs": 0,
    "restecg": 1,
    "thalach": 161,
    "oldpeak": 0,
    "slope": 2,
    "ca": 1
  },
  {
    "id": 292,
    "trestbps": 114,
    "chol": 318,
    "fbs": 0,
    "restecg": 2,
    "thalach": 140,
    "oldpeak": 4.4,
    "slope": 0,
    "ca": 3
  },
  {
    "id": 293,
    "trestbps": 170,
    "chol": 225,
    "fbs": 1,
    "restecg": 0,
    "thalach": 146,
    "oldpeak": 2.8,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 294,
    "trestbps": 152,
    "chol": 212,
    "fbs": 0,
    "restecg": 0,
    "thalach": 150,
    "oldpeak": 0.8,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 295,
    "trestbps": 120,
    "chol": 169,
    "fbs": 0,
    "restecg": 1,
    "thalach": 144,
    "oldpeak": 2.8,
    "slope": 0,
    "ca": 0
  },
  {
    "id": 296,
    "trestbps": 140,
    "chol": 187,
    "fbs": 0,
    "restecg": 0,
    "thalach": 144,
    "oldpeak": 4,
    "slope": 2,
    "ca": 2
  },
  {
    "id": 297,
    "trestbps": 124,
    "chol": 197,
    "fbs": 0,
    "restecg": 1,
    "thalach": 136,
    "oldpeak": 0,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 298,
    "trestbps": 164,
    "chol": 176,
    "fbs": 1,
    "restecg": 0,
    "thalach": 90,
    "oldpeak": 1,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 299,
    "trestbps": 140,
    "chol": 241,
    "fbs": 0,
    "restecg": 1,
    "thalach": 123,
    "oldpeak": 0.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 300,
    "trestbps": 110,
    "chol": 264,
    "fbs": 0,
    "restecg": 1,
    "thalach": 132,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 0
  },
  {
    "id": 301,
    "trestbps": 144,
    "chol": 193,
    "fbs": 1,
    "restecg": 1,
    "thalach": 141,
    "oldpeak": 3.4,
    "slope": 1,
    "ca": 2
  },
  {
    "id": 302,
    "trestbps": 130,
    "chol": 131,
    "fbs": 0,
    "restecg": 1,
    "thalach": 115,
    "oldpeak": 1.2,
    "slope": 1,
    "ca": 1
  },
  {
    "id": 303,
    "trestbps": 130,
    "chol": 236,
    "fbs": 0,
    "restecg": 0,
    "thalach": 174,
    "oldpeak": 0,
    "slope": 1,
    "ca": 1
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

function addRateData(number){
  var id = heartRateData[i].id;
  var value = heartRateData[i].value;
  db.collection("heartRateSimulation").doc('simulation').set({
      id: id,
      value: value,
  }).then(function(docRef) {
      console.log("Send Rate");
  })
  .catch(function(error) {
      console.error("Error adding Rate: ", error);
  });
}

function addWatchData(number){
  var id = allData[j].id;
  var trestbps = allData[j].trestbps;
  var chol = allData[j].chol;
  var fbs = allData[j].fbs;
  var restecg = allData[j].restecg;
  var thalach = allData[j].thalach;
  var oldpeak = allData[j].oldpeak;
  var slope = allData[j].slope;
  var ca = allData[j].ca;
  db.collection("watchSimulation").doc('simulation').set({
      id: id,
      trestbps: trestbps,
      chol: chol,
      fbs: fbs,
      restecg: restecg,
      thalach: thalach,
      oldpeak: oldpeak,
      slope: slope,
      ca: ca,
  }).then(function(docRef) {
      console.log("Watch Data Send");
  })
  .catch(function(error) {
      console.error("Error adding Watch Data: ", error);
  });
}


var i = -1;
var j = -1;
schedule.scheduleJob('* * * * *', () => {
  addRateData(i++);
  addWatchData(j++);
})

