import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'language_screen.dart';

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
            title: const Text('Common'),
            tiles: [
              SettingsTile(
                title: const Text('Language'),
                description: const Text('English'),
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
                  title: const Text('Environment'),
                  description: const Text(''),
                  leading: const Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
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
                onPressed: (context) {},
                leading: const Icon(Icons.privacy_tip),
              ),
              SettingsTile.switchTile(
                title: const Text('Lock app in background'),
                leading: const Icon(Icons.phonelink_lock),
                initialValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
              ),
              SettingsTile.switchTile(
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
        ],
      ),
    );
  }
}
