import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User? loggedInUser;
final messageTextController = TextEditingController();

class ChatScreen extends StatefulWidget {
  static String routeName = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String messageText;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
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
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                // messageTextController.clear();
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
            MessageBuilder(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      setState(() {
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': loggedInUser?.email ?? 'Unknown',
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        // _firestore.collection('messages').add({
                        //   'text': messageText,
                        //   'sender': loggedInUser?.email ?? 'Unknown',
                        // });
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

class MessageBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        // stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final messages = snapshot.data!.docs;
          List<MessageBubble> messageBubbles = [];

          for (var message in messages) {
            final data = message.data() as Map<String, dynamic>;
            final messageText = data['text'] ?? '';
            final messageSender = data['sender'] ?? 'Unknown';

            final currentUser = loggedInUser?.email ?? 'Unknown';
            if (currentUser == messageSender) {}

            final messageWidget = MessageBubble(
              isMe: currentUser == messageSender,
              sender: messageSender,
              text: messageText,
            );

            messageBubbles.add(messageWidget);
          }

          return ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            children: messageBubbles,
          );
        },
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble({required this.sender, required this.text, required this.isMe});

  String sender;
  String text;
  bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text('@' + '$sender',
              style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400)),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
            color: isMe ? Colors.yellow : Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                text,
                style: TextStyle(
                    color: isMe ? Colors.green : Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
