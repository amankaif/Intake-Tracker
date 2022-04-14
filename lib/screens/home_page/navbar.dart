import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:calorie_tracker/screens/screens.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: Colors.green,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Shaik Asif',
              style: TextStyle(fontFamily: 'Inter', fontSize: 20),
            ),
            accountEmail: const Text('shaik.asif20@st.niituniversity.in'),
            currentAccountPicture: CircleAvatar(
              radius: 100,
              child: ClipOval(
                  child: Image.asset(
                'assets/images/cartoon.png',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
            decoration: const BoxDecoration(
                // color: Colors.green,
                image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.jpg',
              ),
              fit: BoxFit.cover,
            )),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () =>
                null, //on clicking this we can redirect or we can perform any action
          ),
          ListTile(
            leading: const Icon(Icons.leaderboard),
            title: const Text('LeaderBoard'),
            onTap: () =>
                null, //on clicking this we can redirect or we can perform any action
          ),
          ListTile(
            leading: const Icon(Icons.graphic_eq),
            title: const Text('Progress'),
            onTap: () =>
                null, //on clicking this we can redirect or we can perform any action
          ),
          ListTile(
            leading: const Icon(Icons.note),
            title: const Text('Notes'),
            onTap: () =>
                null, //on clicking this we can redirect or we can perform any action
          ),
        ],
      ),
    );
  }
}
