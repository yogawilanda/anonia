import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'language_screen.dart';
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
            title: 'Common',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
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
                  title: 'Environment',
                  subtitle: 'Production',
                  leading: const Icon(Icons.cloud_queue)),
            ],
          ),
          SettingsSection(
            title: 'Account',
            tiles: const [
              SettingsTile(title: 'Phone number', leading: Icon(Icons.phone)),
              SettingsTile(title: 'Email', leading: Icon(Icons.email)),
              SettingsTile(title: 'Sign out', leading: Icon(Icons.exit_to_app)),
            ],
          ),
          SettingsSection(
            title: 'Security',
            tiles: [
              SettingsTile(
                title: 'Account Privacy',
                subtitle: 'Set how your privacy is configured',
                onPressed: (context) {},
                leading: const Icon(Icons.privacy_tip),
              ),
              SettingsTile.switchTile(
                title: 'Lock app in background',
                leading: const Icon(Icons.phonelink_lock),
                switchValue: lockInBackground,
                onToggle: (bool value) {
                  setState(() {
                    lockInBackground = value;
                  });
                },
              ),
              SettingsTile.switchTile(
                  title: 'Use fingerprint',
                  leading: const Icon(Icons.fingerprint),
                  onToggle: (bool value) {
                    setState(() {});
                  },
                  switchValue: false),
              SettingsTile.switchTile(
                title: 'Change password',
                leading: const Icon(Icons.lock),
                switchValue: true,
                onToggle: (bool value) {},
              ),
            ],
          ),
          SettingsSection(
            title: 'Misc',
            tiles: const [
              SettingsTile(
                  title: 'Terms of Service', leading: Icon(Icons.description)),
              SettingsTile(
                  title: 'Open source licenses',
                  leading: Icon(Icons.collections_bookmark)),
            ],
          )
        ],
      ),
    );
  }
}