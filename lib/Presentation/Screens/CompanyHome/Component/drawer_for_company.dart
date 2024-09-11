import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.work_outline),
            title: Text('Show All Jobs'),
            onTap: () {
              // Navigate to the "Show All Jobs" screen
              Navigator.of(context).pushNamed('/allJobs');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle the logout functionality
              Navigator.of(context).pop(); // Close the drawer
              // Perform logout operations here
            },
          ),
        ],
      ),
    );
  }
}
