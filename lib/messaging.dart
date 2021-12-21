// Copyright 2017, 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license
// that can be found in the LICENSE file.

// import 'package:flutter/cupertino.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:anonia/route/route.dart';
import 'route/route.dart' as route;
import 'person_data.dart';

// class ChatMessage {
//   String messageText;
//   String imageURL;
//   String time;
//   ChatUsers(
//       {@required this.name,
//       @required this.messageText,
//       @required this.imageURL,
//       @required this.time});
// }

class ChatMessage extends StatelessWidget {
  ChatMessage({
    required this.text,
    required this.animationController,
    Key? key,
  }) : super(key: key);
  final String text;
  final AnimationController animationController;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/hotelmacau.png'),
                // backgroundImage: AssetImage('assets/hotelmacau.png'),
                // ),
                // child: Text(
                //   angka[index][0],
                //   style: TextStyle(fontSize: 20),
                // ),
                //child: Text(_name[0])
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // this children need to be wrapped into chat bubbles.
                  Text(
                    user.displayName!, // <--- current username bubbles name
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      text,
                      style: const TextStyle(color: Colors.black87),
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

class ChatScreen extends StatefulWidget {
  //implement userdata chat and data here

  const ChatScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    var message = ChatMessage(
      text: text,
      animationController: AnimationController(
        duration: const Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }

  //this is how the user can send CRUD to database. but dont use it yet.
  // void sendMessage() async {
  //   FocusScope.of(context).unfocus();

  //   // await FirebaseApi.uploadMessage(widget.idUser, message); <-- this one should be imported its API first
  //   //to open its FirebaseApi.uploadMessage, it's should be imported already
  //   //should create API folder and create a page which contain
  //   //class of Firebase API
  //   //here it is the source code https://github.com/JohannesMilke/firebase_chat_example/blob/master/lib/api/firebase_api.dart
  //   //inside of its code, there is Message Class to parse its json which contain idUser,urlAvatar, userName, message, and createAt.
  //   //refUser is ... study this.
  //   // to configure it. it is on FireStore that store the message.
  //   //because this need a connection to firebase API, This should be built based on stream builder.
  //   // to create chat bubble based on whose represent it, create
  //   //isMe == stuff. its on source code message_widget.dart
  //   //stream builder had to initiate FirebaseFireStore.instance.

  //   // _textController.clear(); <-- this should subtitute the code above. so i disabled it for now.
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 8,
        title: const Text('Someone\'s name'),
        //TODO: Make the Circled avatar not overfilling the appbar
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(
                    'assets/hotelmacau.png',
                    //fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (context, index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: _buildTextComposer(),
            ),
          ],
        ),
        decoration: Theme.of(context).platform == TargetPlatform.iOS
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[200]!),
                ),
              )
            : null,
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: IconButton(
                icon: const Icon(Icons.add),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
            // text composer/text editor.
            Flexible(
              child: TextField(
                controller: _textController,
                onChanged: (text) {
                  setState(() {
                    _isComposing = text.isNotEmpty;
                  });
                },
                onSubmitted: _isComposing ? _handleSubmitted : null,
                decoration: InputDecoration.collapsed(
                    hintText: 'Send a message',
                    filled: true,
                    // todo: fix this border to be bigger than its text.
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(width: 0),
                      gapPadding: 10,
                    )
                    //if the method above wont display as its will, back to the below way.
                    // OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(300),
                    //   borderSide: const BorderSide(
                    //     width: 10,
                    //   ),
                    // ),
                    ),
                focusNode: _focusNode,
              ),
            ),

            Container(
              // emoticon button
              margin: const EdgeInsets.symmetric(horizontal: 0.1),
              child: IconButton(
                icon: const Icon(Icons.emoji_emotions_rounded),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
            Container(
              // send icon button
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: _isComposing
                    ? () => _handleSubmitted(_textController.text)
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }
}
