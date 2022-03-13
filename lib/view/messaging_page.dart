import 'package:anonia/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:anonia/route/route.dart';
import '../route/route.dart' as route;

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
              // ignore: unrelated_type_equality_checks
              child: user.photoURL ==
                      const CircleAvatar(
                          backgroundImage: AssetImage('assets/lisa.jpg'))
                  ? const CircleAvatar(
                      backgroundImage: AssetImage('assets/lisa.jpg'),
                    )
                  : CircleAvatar(
                      backgroundImage: NetworkImage(
                          user.photoURL!), // <-Bubble circle avatar
                    ),
            ),
            Expanded(
              // current username bubbles name
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // this children need to be wrapped into chat bubbles.
                  if (user.displayName == "anonymous")
                    const Text('Anonym')
                  else
                    Text(
                      user.displayName!,
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

class ChatPage extends StatefulWidget {
  //implement userdata chat and data here

  const ChatPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = [];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final user = FirebaseAuth.instance.currentUser!;
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
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: user.photoURL == user.emailVerified
                    ? CircleAvatar(
                        child: Image.asset('assets/lisa.jpg'),
                      )
                    : CircleAvatar(
                        radius: 18,
                        backgroundImage: NetworkImage(user.photoURL!),
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
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
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
                textAlign: TextAlign.left,
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
                    borderRadius: BorderRadius.circular(0),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
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
