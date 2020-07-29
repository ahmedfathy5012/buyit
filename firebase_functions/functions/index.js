const functions = require('firebase-functions');
const admin = require('firebase-admin');
const { DataSnapshot } = require('firebase-functions/lib/providers/database');
admin.initializeApp(functions.config().functions);

exports.notifyTrigger=functions.firestore.document('notify/{notifyId}').onCreate 
(
    async (snapshot,context)=>
    {
         var payload= {notification: {body: 'buy it', title: 'buy it'}, data: {click_action: 'FLUTTER_NOTIFICATION_CLICK', message: 'myValue'}}
           const response = await admin.messaging().sendToTopic('ADMIN',payload);
    }
);


exports.finishTrigger=functions.firestore.document('finish/{finishId}').onCreate 
(
    async (snapshot,context)=>
    {
        var tokens = [];
        tokens.push(snapshot.data().token);
         var payload= {notification: {body: 'Order Ready', title: 'Your Order Is Ready Now'}, data: {click_action: 'FLUTTER_NOTIFICATION_CLICK', message: 'Your Order Is Ready'}}
           const response = await admin.messaging().sendToDevice(tokens,payload);
    }
);