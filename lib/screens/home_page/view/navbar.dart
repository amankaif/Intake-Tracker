import 'package:calorie_tracker/ui_strings.dart';
import 'package:flutter/material.dart';

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
            accountEmail: Text(userId),
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
            leading: const Icon(Icons.qr_code),
            title: const Text('History'),
            onTap: () => {
              Navigator.pushNamed(context, 'history')
            }, //on clicking this we can redirect or we can perform any action
          ),
          // ListTile(
          //   leading: const Icon(Icons.leaderboard),
          //   title: const Text('LeaderBoard'),
          //   onTap: () => {
          //     Navigator.pushNamed(context, 'leader_board')
          //   }, //on clicking this we can redirect or we can perform any action
          // ),
          // ListTile(
          //   leading: const Icon(Icons.graphic_eq),
          //   title: const Text('Progress'),
          //   onTap: () =>
          //       {}, //on clicking this we can redirect or we can perform any action
          // ),
          // ListTile(
          //   leading: const Icon(Icons.note),
          //   title: const Text('Notes'),
          //   onTap: () =>
          //       {}, //on clicking this we can redirect or we can perform any action
          // ),
        ],
      ),
    );
  }
}
