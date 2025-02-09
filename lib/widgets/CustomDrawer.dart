import 'package:flutter/material.dart';
import 'package:flutter_laravel_milk_subscription/screens/HomeScreen.dart';
import 'package:flutter_laravel_milk_subscription/screens/SettingScreen.dart';
import 'package:flutter_laravel_milk_subscription/screens/auth/LoginScreen.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/profile.jpg"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(title: 'Home',))
              );

            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("Subscription Plans"),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen(title: 'Settings',))
              );

            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              // Handle logout
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen())
              );
            },
          ),
        ],
      ),
    );
  }
}
