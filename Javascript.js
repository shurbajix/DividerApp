const functions = require('firebase-functions');
const admin = require('firebase-admin');
const mqtt = require('mqtt');

// Initialize Firebase
admin.initializeApp();

// Create an MQTT client and connect to the broker
const client = mqtt.connect('mqtt://<broker_address>', {
  username: '<username>',
  password: '<password>'
});

// Subscribe to the "plc_data" topic
client.on('connect', () => {
  client.subscribe('plc_data');
});

// When a message is received on the "plc_data" topic, write the data to Firebase
client.on('message', (topic, message) => {
  const data = JSON.parse(message);
  admin.database().ref('plc_data').set(data);
});