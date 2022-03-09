import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
<<<<<<< HEAD:lib/view/settings_page.dart
import 'language_page.dart';
// import 'route/route.dart' as route;
=======
import 'language_screen.dart';
>>>>>>> master:lib/settings_page.dart

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lockInBackground = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings UI')),
      body: SettingsList(
        sections: [
          SettingsSection(
<<<<<<< HEAD:lib/view/settings_page.dart
            title: Text('Common'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                trailing: Text('English'),
=======
            title: const Text('Common'),
            tiles: [
              SettingsTile(
                title: const Text('Language'),
                description: const Text('English'),
>>>>>>> master:lib/settings_page.dart
                leading: const Icon(Icons.language),
                onPressed: (context) {
                  MaterialPageRoute(builder: (_) => const LanguagesScreen());
                },
                //move this
                // const LanguagesScreen()
              ),
              SettingsTile(
                  onPressed: (context) {
                    MaterialPageRoute(builder: (_) => const LanguagesScreen());
                  },
<<<<<<< HEAD:lib/view/settings_page.dart
                  title: Text('Environment'),
                  trailing: Text('Production'),
=======
                  title: const Text('Environment'),
                  description: const Text(''),
>>>>>>> master:lib/settings_page.dart
                  leading: const Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
<<<<<<< HEAD:lib/view/settings_page.dart
            title: Text('Account'),
            tiles: [
              SettingsTile(
                  title: Text('Phone number'), leading: Icon(Icons.phone)),
              SettingsTile(title: Text('Email'), leading: Icon(Icons.email)),
              SettingsTile(
                  title: Text('Sign out'), leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: Text('Security'),
            tiles: [
              SettingsTile(
                title: Text('Account Privacy'),
                trailing: Text('Set how your privacy is configured'),
=======
            title: const Text('Account'),
            tiles: [
              SettingsTile(
                  title: const Text('Phone number'), leading: const Icon(Icons.phone)),
              SettingsTile(title: const Text('Email'), leading: const Icon(Icons.email)),
              SettingsTile(
                  title: const Text('Sign out'), leading: const Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: const Text('Security'),
            tiles: [
              SettingsTile(
                title: const Text('Account Privacy'),
                description: const Text('Set how your privacy is configured'),
>>>>>>> master:lib/settings_page.dart
                onPressed: (context) {},
                leading: const Icon(Icons.privacy_tip),
              ),
              SettingsTile.switchTile(
<<<<<<< HEAD:lib/view/settings_page.dart
                title: Text('Lock app in background'),
                leading: const Icon(Icons.phonelink_lock),
=======
                title: const Text('Lock app in background'),
                leading: const Icon(Icons.phonelink_lock),
                initialValue: lockInBackground,
>>>>>>> master:lib/settings_page.dart
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
                initialValue: false,
              ),
              SettingsTile.switchTile(
<<<<<<< HEAD:lib/view/settings_page.dart
                title: Text('Use Fingerprint to unlock'),
                leading: const Icon(Icons.phonelink_lock),
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
                initialValue: false,
              ),
              SettingsTile.switchTile(
                title: Text('Use Fingerprint to unlock'),
                leading: const Icon(Icons.phonelink_lock),
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
                initialValue: false,
              ),
            ],
          ),
=======
                title: const Text('Use fingerprint'),
                initialValue: lockInBackground,
                leading: const Icon(Icons.fingerprint),
                onToggle: (bool value) {
                  setState(() {});
                },
              ),
              SettingsTile.switchTile(
                title: const Text('Change password'),
                leading: const Icon(Icons.lock),
                initialValue: false,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Misc'),
            tiles:  [
              SettingsTile(
                  title: const Text('Terms of Service'), leading: const Icon(Icons.description)),
              SettingsTile(
                  title: const Text('Open source licenses'),
                  leading: const Icon(Icons.collections_bookmark)),
            ],
          )
>>>>>>> master:lib/settings_page.dart
        ],
      ),
    );
  }
}
