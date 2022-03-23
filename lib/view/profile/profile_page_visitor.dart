import 'package:flutter/material.dart';

class ProfilePageVisitor extends StatelessWidget {
  const ProfilePageVisitor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(children: [
        // DraggableScrollableSheet(
        //   initialChildSize: 0.25,
        //   maxChildSize: 0.6,
        //   minChildSize: 0.1,
        //   snap: true,
        //   builder: (context, scrollController) {
        //     return Container(
        //       decoration: boxCustomDecoration(),
        //       child: ListView.builder(
        //         itemBuilder: (context, i) {
        //           return Container(
        //             child: Center(
        //                 child: Column(
        //               children: [],
        //             )),
        //           );
        //         },
        //       ),
        //     );
        //   },
        // )
      ]),
    );
  }

  boxCustomDecoration() {
    return BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadiusDirectional.only(
        topEnd: Radius.circular(60),
        topStart: Radius.circular(60),
      ),
    );
  }
}
