import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
                radius: 60,
              ),
              title: Text(
                'Malak idrissi',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Rabat morocco',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
              trailing: Icon(Icons.edit),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: mediaQuery.size.width * 0.9,
              child: Text(
                'Hi!My name is Malak ,im a community manager from Rabbat,Morocco',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.1,
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              size: 30,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 30,
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              size: 30,
            ),
            title: Text(
              'Account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.02,
          ),
          ListTile(
            leading: Icon(
              Icons.error,
              size: 30,
            ),
            title: Text(
              'About',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
