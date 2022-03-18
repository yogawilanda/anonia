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
      body: Container(
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 19),
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
                        onPressed: () {},
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
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.all(22.0),
                          child: Text(
                            //value below will be replaced with text controller based where its user assign the value.
                            'This is a profile page description that will explain the user, it contains a maximal content of 80 words.',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
