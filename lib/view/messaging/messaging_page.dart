import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:jiffy/jiffy.dart';

import 'package:flutter/material.dart';

import 'package:anonia/route/route.dart' as route;

//ChatBubble goes here
class ChatMessage extends StatelessWidget {
  ChatMessage({
    required this.text,
    required this.animationController,
    Key? key,
  }) : super(key: key);
  final String text;
  final AnimationController animationController;
  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    DateTime inDetails = DateTime.now().subtract(const Duration(minutes: 1));
    String jiffyhourly = Jiffy().EEEE.toString();

    bool isRecentlySent = true;

    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Center(
              child: DateChip(
                date: now,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  // current username bubbles name
                  child: Container(
                    margin: EdgeInsets.all(8),
                    // padding: EdgeInsets.symmetric(vertical: 9),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('Anonym'),

                        //Text Container goes here
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(inDetails.toString()),
                            Flexible(
                              child: BubbleNormal(
                                tail: true,
                                bubbleRadius: 20,
                                seen: true,
                                text: text,
                                delivered: true,
                                sent: true,
                                isSender: true,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//This is Page that represents messaging layout
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
  // final user = FirebaseAuth.instance.currentUser!;
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
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/lisa.jpg'),
                ),

                //  user.photoURL == user.emailVerified? CircleAvatar(
                //         child: Image.asset('assets/lisa.jpg'),
                //       )
                //     : CircleAvatar(
                //         radius: 18,
                //         backgroundImage: NetworkImage(user.photoURL!),
                //       ),
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
            //chat bubble generates here
            Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (context, index) => _messages[index],
                itemCount: _messages.length,
              ),
            ),
            const Divider(height: 1.0),

            //text composer
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
                decoration: InputDecoration(
                  hintText: 'Send a message',
                  filled: true,
                  // todo: fix this border to be bigger than its text.
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 2,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
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
