import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: -70,
          child: Image.asset(
            'assets/images/bg_removed.png',
            // height: 900,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 100,
          child: SizedBox(
            height: 500,
            child: ListView(
              children: [
                SettingsSection(
                  title: 'Common',
                  tiles: [
                    SettingsTile(
                      icon: Icons.language,
                      title: 'Language',
                      subtitle: 'English',
                      onTap: () {
                        // Handle tap
                      },
                    ),
                    SwitchSettingsTile(
                      icon: Icons.format_paint,
                      title: 'Enable custom theme',
                      value: false,
                      onChanged: (bool l) {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> tiles;

  const SettingsSection({super.key, required this.title, required this.tiles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...tiles,
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;

  const SettingsTile(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      onTap: onTap,
    );
  }
}

class SwitchSettingsTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchSettingsTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.value,
      required this.onChanged});

  @override
  _SwitchSettingsTileState createState() => _SwitchSettingsTileState();
}

class _SwitchSettingsTileState extends State<SwitchSettingsTile> {
  bool _currentValue;

  _SwitchSettingsTileState() : _currentValue = false;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.title),
      trailing: Switch(
        value: _currentValue,
        onChanged: (bool value) {
          setState(() {
            _currentValue = value;
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
