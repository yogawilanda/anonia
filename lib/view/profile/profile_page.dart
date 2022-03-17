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
      body: Container(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
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
                      icon: FaIcon(
                        FontAwesomeIcons.pencilAlt,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                'This is your name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                // decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(30), color: Colors.blue),
                // margin: const EdgeInsets.symmetric(horizontal: 24),
                child: ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.pencilAlt,
                        size: 12,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(
                height: 60,
              ),
              //Informations
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Age 26'),
                  Text('Age 26'),
                  Text('Age 26'),
                  Text('Age 26'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
