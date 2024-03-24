import 'package:flutter/material.dart';
import '../screens/homescreen.dart';
import '../screens/standings.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(children: buildMenuItemsList(context)),
    );
  }
}

List<Widget> buildMenuItemsList(BuildContext context) {
  List<Widget> menuItems = [];
  menuItems.add(const DrawerHeader(
      child: Text(
    "F1 Standings",
    style: TextStyle(fontSize: 30),
  )));

  Set<String> menuTitles = {"Home", "Standings"};

  menuTitles.forEach((element) {
    menuItems.add(ListTile(
      title: Text(
        element,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        Widget screen = Container();

        switch (element) {
          case "Home":
            screen = HomeScreen();
            break;
          case "Destiny":
            screen = Standings();
            break;
          default:
        }

        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => screen));
      },
    ));
  });

  return menuItems;
}
