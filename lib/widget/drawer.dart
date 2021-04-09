import 'package:flutter/material.dart';
import 'package:user/views/SplashScreen.dart';
import 'package:user/views/profileScreen.dart';

class Drawerwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: NetworkImage(
                      'https://media-exp1.licdn.com/dms/image/C4E03AQG3kndXYZ60rQ/profile-displayphoto-shrink_100_100/0/1608647045965?e=1620864000&v=beta&t=ipP2N931C09JAFkfb0MP0K4AHs4G2aV0Q6W2JgDvf-c'),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>SplashScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.white24),
          ),
          Divider(),
          ListtileDrawer(
              text: ('Exam'), icon: Icons.add_to_home_screen_rounded),
          Divider(),
          ListtileDrawer(text: ('Analysis Report'), icon: Icons.add_chart),
          Divider(),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(
              left: 70,
              top: 10,
            ),
            child: Text(
              "Logout",
              style: TextStyle(
                fontSize: 25,
                color: Colors.blueAccent[100],
                fontWeight: FontWeight.bold,
              ),
            ),
          ))
        ],
      ),
    );
  }
}

class ListtileDrawer extends StatelessWidget {
  final String text;
  final IconData icon;
  ListtileDrawer({
    this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          color: Colors.blueAccent[100],
        ),
      ),
      onTap: () {
        // Update the state of the app.
        // ...
      },
    );
  }
}
