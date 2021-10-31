import 'package:flutter/material.dart';
import 'package:ssconverter/screens/about_screen.dart';
import 'package:ssconverter/screens/my_home_page.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'SSConverter',
      'About',
    ];

    List<Widget> menuItems = [];
    menuItems.add(
      const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text(
          'SS Converter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
          ),
        ),
      ),
    );

    for (var m in menuTitles) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(m, style: const TextStyle(fontSize: 18)),
        onTap: () {
          switch (m) {
            case 'SSConverter':
              screen = MyHomePage(title: m);
              break;
            case 'About':
              screen = const AboutScreen();
              break;
          }

          // Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    }

    return menuItems;
  }
}
