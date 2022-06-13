import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          // backgroundColor: Colors.transparent,
          title: Text('Profile'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        //todo:wrap this into draggable widget
        body: Stack(
          children: [
            Center(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://w0.peakpx.com/wallpaper/260/402/HD-wallpaper-lisa-asian-band-beautiful-beauty-black-hair-blackpink-portrait-pretty-singer.jpg',
                      ),
                      fit: BoxFit.fitHeight)),
            )),
            ScrollableProfile(),
          ],
        ));
  }
}

class ScrollableProfile extends StatelessWidget {
  const ScrollableProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.25,
      maxChildSize: 0.6,
      minChildSize: 0.1,
      snap: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(90), topEnd: Radius.circular(60))),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 1,
            itemBuilder: (BuildContext context, int i) {
              return Container(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 90,
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          const CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/lisa.jpg'),
                          ),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.pencilAlt,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Lisa',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),

                      //Tweak Buttons
                      Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30), color: Colors.blue),
                        // margin: const EdgeInsets.symmetric(horizontal: 24),
                        child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          buttonPadding:
                              const EdgeInsets.symmetric(horizontal: 19),
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue,
                              ),
                              child: IconButton(
                                color: Colors.white,
                                hoverColor: Colors.amber,
                                onPressed: () {
                                  print('button pressed');
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.pencilAlt,
                                  size: 22,
                                ),
                              ),
                            ),
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue,
                              ),
                              child: IconButton(
                                color: Colors.white,
                                hoverColor: Colors.amber,
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.settings,
                                  size: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 60,
                      ),
                      //Informations
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

void profileDescDraggable(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) {
      return Container(
        color: Colors.blue[100],
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage('assets/lisa.jpg'),
                        ),
                        CircleAvatar(
                          child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.pencilAlt,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'This is your name',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    //Tweak Buttons
                    Container(
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(30), color: Colors.blue),
                      // margin: const EdgeInsets.symmetric(horizontal: 24),
                      child: ButtonBar(
                        alignment: MainAxisAlignment.center,
                        buttonPadding:
                            const EdgeInsets.symmetric(horizontal: 19),
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              color: Colors.white,
                              hoverColor: Colors.amber,
                              onPressed: () {
                                print('button pressed');
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.pencilAlt,
                                size: 22,
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.blue,
                            ),
                            child: IconButton(
                              color: Colors.white,
                              hoverColor: Colors.amber,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 60,
                    ),
                    //Informations
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
