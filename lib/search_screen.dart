import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'route/route.dart' as route;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3,
                    color: Colors.amber,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                )),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Divider(
                  height: 8,
                  thickness: 2,
                  color: Colors.grey[200],
                ),
                // this containers will load its circle avatar
                Container(
                  child: ListView.separated(
                    itemBuilder: (context, index) => const AvatarFormat(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 16,
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                  ),
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// AvatarCustomFormatter
class AvatarFormat extends StatelessWidget {
  const AvatarFormat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,
      height: 75.0,
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: const CircleAvatar(
        backgroundImage: NetworkImage('{YOUR_IMAGE}'),
      ),
    );
  }
}

// testing code//
// Container(
//         margin: const EdgeInsets.all(10.0),
//         ref https://daily-dev-tips.com/posts/flutter-scrollable-horizontal-avatar-list/
//         child: ListView.separated(
//           itemBuilder: (context, index) => const AvatarFormat(),
//           scrollDirection: Axis.horizontal,
//           itemCount: 16,
//           separatorBuilder: (BuildContext context, int index) {
//             return const SizedBox(
//               width: 10,
//             );
//           },
//         ),
//         if the implementation fail, put it here #12
        
//       ),

// builder: (context) {
//   return Scaffold(
//     appBar: AppBar(
//       // toolbarHeight: 65,
//       flexibleSpace: Container(
//         color: Colors.amber,
//         child: TextField(
//           textAlign: TextAlign.start,
//           controller: _searchController,
//           decoration: InputDecoration(
//               // contentPadding: const EdgeInsets.symmetric(
//               //     vertical: 10, horizontal: 10),
//               filled: true,
//               fillColor: Colors.amber[100],
//               prefixIcon: const Icon(Icons.search, color: Colors.amber),
//               // border: const OutlineInputBorder(
//               //   borderRadius: BorderRadius.all(
//               //     Radius.circular(5),
//               //   ),
//               // ),
//               hintStyle: const TextStyle(color: Colors.black38),
//               hintText: "Search"),
//         ),
//       ),
//     ),
//   );
// },

// if the implementation fails, back it up to its code #12
// child: Column(
//           children: [
//             const Text('Header Box'),
//             Row(
//               //TODO: Stylize circle avatar so it can be swiped horizontally.
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: const [
//                 ///reference: https://www.codegrepper.com/code-examples/whatever/how+to+add+space+between+circle+avatar+in+flutter
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.transparent,
//                   radius: 30,
//                 ),
//                 CircleAvatar(),
//                 CircleAvatar(),
//                 CircleAvatar(),
//                 CircleAvatar(),
//               ],
//             ),
//           ],
//         ),
