import 'package:flutter/material.dart';
import 'package:shop_app/screens/settings.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 128, 21, 138),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 40),
                  backgroundColor: Color.fromARGB(255, 209, 114, 238),
                ),
                SizedBox(width: 16),
                Text(
                  'User_01',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Edit profile picture'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('9999-****'),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('********'),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete account'),
            onTap: () {
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out'),
            onTap: () {
            },
          ),
        ],
      ),
    );
  }
}