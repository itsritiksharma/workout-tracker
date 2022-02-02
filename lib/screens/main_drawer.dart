import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/app_mode.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  // bool darkMode = false;
  // void appModeChage(bool value) {
  //
  // }

  Widget drawerItemsBuilder(String title, IconData icon, BuildContext context,
      {bool hasSwitch = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey.shade400),
        ),
      ),
      child: ListTile(
        leading: Icon(icon),
        onTap: () {},
        title: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<AppMode>(context).changeMode();
    return Consumer<AppMode>(builder: (_, mode, __) {
      bool isDark = mode.isDark;
      return Drawer(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.transparent,
                        child: Icon(Icons.account_circle_outlined,
                            size: 200, color: Colors.grey.shade400),
                      ),
                    ),
                    Text(
                      'Ritik Sharma',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
            drawerItemsBuilder('Calendar', Icons.calendar_view_day, context),
            drawerItemsBuilder('Settings', Icons.settings, context),
            // drawerItemsBuilder(
            //   'Dark Mode',
            //   Icons.brightness_medium_outlined,
            //   context,
            //   hasSwitch: true,
            //   ChangeMode: mode.changeMode(),
            // ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey.shade400),
                ),
              ),
              child: ListTile(
                trailing: Switch(
                    value: isDark,
                    activeColor: Theme.of(context).accentColor,
                    onChanged: (changedValue) {
                      mode.changeMode();
                      setState(() {
                        isDark = !isDark;
                      });
                    }),
                leading: const Icon(Icons.brightness_medium_outlined),
                onTap: () {},
                title: const Text('Dark mode'),
              ),
            ),
          ],
        ),
      );
    });
  }
}
