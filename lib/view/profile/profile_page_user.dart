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
        //todo:wrap this into draggable widget
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://i.pinimg.com/originals/ec/38/22/ec382251c6bb0d1ce7f174fd536c0870.jpg'),
                  fit: BoxFit.fitWidth)),
        ),
        SafeArea(
          child: Container(
            margin: const EdgeInsets.all(0),
            child: ButtonBar(
              alignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 15, top: 15),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.blue,
                  ),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      print('button pressed');
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.pencilAlt,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const ScrollableProfile(),
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
    return Stack(
      children: [
        DraggableScrollableSheet(
          expand: true,
          initialChildSize: 0.1,
          maxChildSize: 0.5,
          minChildSize: 0.1,
          snap: true,
          builder: (BuildContext context, ScrollController scrollController) {
            return Stack(
              children: [
                Positioned(
                  left: 225,
                  top: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.angleUp,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(134, 27, 28, 29),
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(90),
                      topEnd: Radius.circular(90),
                    ),
                  ),
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int i) {
                      return Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  child: const Text(
                                    'Lisa "Blackpink" Manoban',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 30),
                                child: Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Stack(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      children: [
                                        const CircleAvatar(
                                          radius: 100,
                                          backgroundImage:
                                              AssetImage('assets/lisa.jpg'),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: CircleAvatar(
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: const FaIcon(
                                                FontAwesomeIcons.pencilAlt,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              //Tweak Buttons

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
                ),
              ],
            );
          },
        ),
      ],
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
              margin: const EdgeInsets.all(0),
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
                      color: Colors.transparent,
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
