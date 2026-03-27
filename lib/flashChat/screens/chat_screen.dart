import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageText;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch(e){
      print(e);
    }
  }

  // void getMessage() async {
  //   final messages = await _firestore.collection('messages').get();
  //   for( var message in messages.docs){
  //     print(message.data());
  //   }
  // }

  void messageStream() async {
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      for( var message in snapshot.docs){
        print(message.data());
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close,color: Colors.black,),
              onPressed: () {
                messageStream();
                // _auth.signOut();
                // Navigator.pop(context);
              }),
        ],
        title: Text(
            '⚡️Chat',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final messages = snapshot.data!.docs;
                List<Text> messageWidgets = [];

                for (var message in messages) {
                  final data = message.data() as Map<String, dynamic>;
                  final messageText = data['text'];
                  final messageSender = data['sender'];

                  final messageWidget =
                  Text('$messageText from $messageSender');

                  messageWidgets.add(messageWidget);
                }

                return Column(
                  children: messageWidgets,
                );

                // else if (snapshot.hasError) {
                //   return Text('Something went wrong');
                // }
              },
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser.email,
                        });
                        print(messageText);
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
