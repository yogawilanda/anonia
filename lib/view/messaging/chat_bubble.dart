import 'package:flutter/material.dart';

import 'package:chat_bubbles/chat_bubbles.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage(
      {Key? key, required this.text, required this.animationController})
      : super(key: key);

  final String text;
  final AnimationController animationController;
  final now = DateTime.now;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(curve: Curves.bounceIn, parent: animationController),
      axisAlignment: 0.0,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              // margin: EdgeInsets.only(right: 16.0),
              child: BubbleNormal(
                text: text,
                isSender: true,
                color: Colors.blue,
                tail: true,
                textStyle: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Container(
              child: DateChip(
                date: DateTime.now(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class ChatBubblesPack extends StatelessWidget {
//   const ChatBubblesPack({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [BubbleNormal(text: text)],
//       ),
//     );
//   }
// }
