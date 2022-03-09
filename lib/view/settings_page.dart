import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'language_page.dart';
// import 'route/route.dart' as route;

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
            title: Text('Common'),
            tiles: [
              SettingsTile(
                title: Text('Language'),
                trailing: Text('English'),
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
                  title: Text('Environment'),
                  trailing: Text('Production'),
                  leading: const Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
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
                onPressed: (context) {},
                leading: const Icon(Icons.privacy_tip),
              ),
              SettingsTile.switchTile(
                title: Text('Lock app in background'),
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
        ],
      ),
    );
  }
}
