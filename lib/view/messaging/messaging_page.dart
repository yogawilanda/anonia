import 'package:chat_bubbles/chat_bubbles.dart';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

//ChatBubble goes here
class ChatMessage extends StatelessWidget {
  const ChatMessage({
    required this.dateSent,
    required this.text,
    required this.animationController,
    required this.x,
    // required this.waktu,
    Key? key,
  }) : super(key: key);
  final String text;
  final AnimationController animationController;
  final DateTime x;
  final DateTime dateSent;

  // final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var timesent = DateFormat('hh:mm a').format(x);
    // bool isRecentlySent = true;

    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: 0.0,
      child: Column(
        children: [
          DateChip(date: x),
          Row(
            // crossAxisAlignment: CrossAxisAlignment.start,test
            children: [
              Expanded(
                // current username bubbles name
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      //Daily
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: const Text(
                          'Anonym',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),

                      //Text Container goes here
                      BubbleNormal(
                        tail: true,
                        bubbleRadius: 120,
                        seen: true,
                        text: text,
                        delivered: true,
                        sent: true,
                        isSender: true,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        color: Colors.blue,
                      ),

                      //TimeStamp
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: DateStamp(waktu: x)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DateStamp extends StatelessWidget {
  const DateStamp({
    required this.waktu,
    Key? key,
  }) : super(key: key);

  final DateTime waktu;

  @override
  Widget build(BuildContext context) {
    // var  nowLocal = DateTime.now();
    // (DateFormat('HH:mm:ss').format(nowLocal));
    var timesent = DateFormat('hh:mm a').format(waktu);

    return Align(
      alignment: Alignment.bottomRight,
      child: Text(timesent.toString()),
    );
  }
}

class DateSent extends StatelessWidget {
  const DateSent({
    required this.dalamHariIni,
    Key? key,
  }) : super(key: key);

  final DateTime dalamHariIni;

  @override
  Widget build(BuildContext context) {
    var nowLocal = DateTime.now();
    // (DateFormat('HH:mm:ss').format(nowLocal));

    return DateChip(date: nowLocal);
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
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    var message = ChatMessage(
      dateSent: DateTime.now(),
      text: text,
      x: DateTime.now(),
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
        centerTitle: true,
        //TODO: Make the Circled avatar not overfilling the appbar
        actions: <Widget>[
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/lisa.jpg'),
                ),
              ),
            ],
          ),
        ],
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

  _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        height: 70,
        child: Row(
          children: [
            attachFile(),
            emoticonButton(),
            // text composer/text editor.
            Flexible(
              child: Container(
                height: 70,
                padding: EdgeInsets.all(2),
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
                      borderRadius: BorderRadius.circular(15),
                      gapPadding: 10,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                    ),
                  ),
                  focusNode: _focusNode,
                ),
              ),
            ),

            sendButton(),
          ],
        ),
      ),
    );
  }

  attachFile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0),
      child: IconButton(
        icon: const Icon(Icons.add),
        onPressed:
            _isComposing ? () => _handleSubmitted(_textController.text) : null,
      ),
    );
  }

  emoticonButton() {
    return Container(
      // emoticon button
      margin: const EdgeInsets.symmetric(horizontal: 0.1),
      child: IconButton(
        icon: const Icon(Icons.emoji_emotions_rounded),
        color: Colors.white,
        splashColor: Colors.black,
        onPressed: () => Container(),
      ),
    );
  }

  sendButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: IconButton(
        icon: const Icon(Icons.send),
        onPressed:
            _isComposing ? () => _handleSubmitted(_textController.text) : null,
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
