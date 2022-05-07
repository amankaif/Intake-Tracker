import 'package:calorie_tracker/screens/home_page/view/Navbar.dart';
import 'package:calorie_tracker/screens/home_page/view/home_screen.dart';
import 'package:calorie_tracker/screens/leader_board_page/view/leaderboard_page_view.dart';
import 'package:calorie_tracker/ui_strings.dart';
import 'package:flutter/material.dart';

class BottomNavigationBar_ extends StatefulWidget {
  BottomNavigationBar_({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBar_> createState() => _BottomNavigationBar_State();
}

class _BottomNavigationBar_State extends State<BottomNavigationBar_> {
  int index = 0;
  final screens = [
    HomeScreen(),
    LeaderBoard(),
    Center(
      child: Text('Progress Page',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(today),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        // elevation: 0.0,
        // actions: [
        //   IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        // ],
        // backgroundColor: Colors.green,
      ),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          // height: 70,
          backgroundColor: Colors.black.withOpacity(0),
          destinations: [
            NavigationDestination(
              label: "Home",
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              label: "LeaderBoard",
              icon: Icon(Icons.leaderboard_outlined),
              selectedIcon: Icon(Icons.leaderboard),
            ),
            NavigationDestination(
              label: "Progress",
              icon: Icon(Icons.graphic_eq_outlined),
              selectedIcon: Icon(Icons.graphic_eq),
            ),
          ],

          // BottomNavigationBar(
          //     selectedItemColor: Colors.blue,
          //     unselectedItemColor: Colors.blue.withOpacity(0.5),
          //     showSelectedLabels: false,
          //     // currentIndex: 2,
          //     // onTap: HomeScreen(),
          //     elevation: 0,
          //     items: [
          //       const BottomNavigationBarItem(
          //         label: "Home",
          //         icon: Icon(Icons.home),
          //       ),
          //       const BottomNavigationBarItem(
          //           label: "Home", icon: Icon(Icons.home)),
          //       const BottomNavigationBarItem(
          //           label: "Home", icon: Icon(Icons.home)),
          //       const BottomNavigationBarItem(
          //           label: "Home", icon: Icon(Icons.home)),
          //     ]
        ),
      ),
    );
  }
}
