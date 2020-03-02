import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text('José Antônio'),
              accountEmail: Text('jose.silva.br@outlook.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/dog1.png'),
              ),
            ),

            ListTile(
              leading: Icon(Icons.star),
              title: Text('Favoritos'),
              subtitle: Text('mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () { print('Item 1'); Navigator.pop(context); },
            ),

            ListTile(
              leading: Icon(Icons.help),
              title: Text('Ajuda'),
              subtitle: Text('mais informações...'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () { print('Item 1'); Navigator.pop(context); },
            ),

            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logaout'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () { print('Item 1'); Navigator.pop(context); },
            ),
          ],
        ),
      ),
    );
  }
}
