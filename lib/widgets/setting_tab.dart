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
              style: Theme.of(context).textTheme.headlineMedium,
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
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: Theme.of(context).textTheme.headlineMedium,
            )
          : null,
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
      iconColor: Theme.of(context).colorScheme.secondary,
      leading: Icon(
        widget.icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
      title:
          Text(widget.title, style: Theme.of(context).textTheme.headlineMedium),
      trailing: Switch(
        // hoverColor: Colors.amber,
        // overlayColor: WidgetStatePropertyAll(Colors.amber),
        // focusColor: Colors.amber,
        // activeColor: Colors.amber,
        trackColor: WidgetStatePropertyAll(Colors.blueGrey),
        thumbColor:
            WidgetStatePropertyAll(Theme.of(context).colorScheme.secondary),
        activeTrackColor: Colors.indigo,
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
