import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore import 'route/route.dart' as route;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  final List<String> personData = [
    "Januari",
    "Fabruari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember"
  ];

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
            decoration: const BoxDecoration(
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
                  decoration: const BoxDecoration(
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
    return Center(
      child: Container(
        width: 75.0,
        height: 75.0,
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://statik.tempo.co/data/2021/10/06/id_1056414/1056414_720.jpg'),
        ),
      ),
    );
  }
}
