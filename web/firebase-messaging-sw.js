importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

const firebaseConfig= {
            apiKey: "AIzaSyDyKlOgQYlduhum6w_T088i-Yf6Z8wOh4U",
            authDomain: "avaliacao-individual-adc.firebaseapp.com",
            databaseURL: "https://avaliacao-individual-adc-default-rtdb.europe-west1.firebasedatabase.app",
            projectId: "avaliacao-individual-adc",
            storageBucket: "avaliacao-individual-adc.appspot.com",
            messagingSenderId: "653232880008",
            appId: "1:653232880008:web:95c4a07ac28cf2f550a23d",
            measurementId: "G-1L53X9DYY1"
};

firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});