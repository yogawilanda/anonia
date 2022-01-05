import 'package:anonia/model/dummy_list.dart';
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
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 80,
                child: ListView.builder(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        circleAvatarScroller(context)),
              ),
              Flexible(
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

          // CustomScrollView(
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: SizedBox(
          //         height: 300,
          //         child: circleAvatarScroller(context),
          //       ),
          //     ),
          //   ],
          // )

          // circleAvatarScroller(context),
        ));
  }

  Expanded circleAvatarScroller(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // decoration: const BoxDecoration(
        //     color: Colors.white,
        //     boxShadow: [
        //       BoxShadow(
        //         blurRadius: 3,
        //         color: Colors.amber,
        //         offset: Offset(0, 1),
        //       ),
        //     ],
        //     borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(12),
        //       bottomRight: Radius.circular(12),
        //       topLeft: Radius.circular(0),
        //       topRight: Radius.circular(0),
        //     )),
        child: Column(
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
                shrinkWrap: true,
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
