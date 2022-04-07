import 'package:anonia/model/dummy_list.dart';
// import 'package:anonia/route/route.dart';
// import 'package:anonia/widget/show_dialog.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore import 'route/route.dart' as route;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  Widget customSearchBar = const Text('Looking something?');
  Icon iconSearchButton = const Icon(Icons.search);

  final List<Dummy> personData = [
    Dummy(
        personName: "Lisa",
        imageUrl: "assets/lisa.jpg",
        textMessage: "Yo! You Up Mate?",
        timeStamp: "sekarang"),
    Dummy(
        personName: "Abah Hamed",
        imageUrl: "assets/abah-hamed.jpg",
        textMessage: "Sehat kan antum?",
        timeStamp: "22.03"),
    Dummy(
        personName: "Brian USA",
        imageUrl: "assets/rich-brian-1.jpg",
        textMessage: "Eh kemarin project lo lancar bro?",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Osas",
        imageUrl: "assets/Osas.jpg",
        textMessage:
            "Tanggal 25 tolong ambil filenya sekaligus deliv ke saya ya",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Demian Google Dev",
        imageUrl: "assets/Demian.jpg",
        textMessage: "Kapan main lagi ke kantor?",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Lisa",
        imageUrl: "assets/lisa.jpg",
        textMessage: "Yo! You Up Mate?",
        timeStamp: "sekarang"),
    Dummy(
        personName: "Abah Hamed",
        imageUrl: "assets/abah-hamed.jpg",
        textMessage: "Sehat kan antum?",
        timeStamp: "22.03"),
    Dummy(
        personName: "Brian USA",
        imageUrl: "assets/rich-brian-1.jpg",
        textMessage: "Eh kemarin project lo lancar bro?",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Osas",
        imageUrl: "assets/Osas.jpg",
        textMessage:
            "Tanggal 25 tolong ambil filenya sekaligus deliv ke saya ya",
        timeStamp: "kemarin"),
    Dummy(
        personName: "Demian Google Dev",
        imageUrl: "assets/Demian.jpg",
        textMessage: "Kapan main lagi ke kantor?",
        timeStamp: "kemarin"),
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
          actions: [iconButtonSearch()],
        ),
        body: Container(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //search circle avatar
            children: [
              SizedBox(
                height: 110,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        circleAvatarScroller(context)),
              ),

              //
              Expanded(
                child: ListView.builder(
                  itemCount: personData.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(personData[index].imageUrl),
                    ),
                    title: Text(personData[index].personName),
                    subtitle: Text(personData[index].textMessage),
                    trailing: Text(personData[index].timeStamp),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  circleAvatarScroller(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          // this containers will load its circle avatar
          Container(
            height: 75,
            margin: EdgeInsets.symmetric(vertical: 6),
            child: ListView.builder(
              itemBuilder: (context, index) => const AvatarFormat(),
              scrollDirection: Axis.horizontal,
              itemCount: 16,
              // padding: EdgeInsets.symmetric(horizontal: 10),
              shrinkWrap: true,
            ),
            // decoration: const BoxDecoration(),
          ),
          Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }

  IconButton iconButtonSearch() {
    return IconButton(
        onPressed: () {
          setState(() {});
        },
        icon: iconSearchButton);
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
        backgroundImage: NetworkImage(
            'https://statik.tempo.co/data/2021/10/06/id_1056414/1056414_720.jpg'),
      ),
    );
  }
}
