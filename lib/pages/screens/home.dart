import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mangafeed/navigationicons.dart';
import 'package:mangafeed/pages/screens/dasboard.dart';
import 'package:mangafeed/pages/screens/messages.dart';
import 'package:mangafeed/pages/screens/profile.dart';
import 'package:mangafeed/pages/screens/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Dasboard(),
    const Search(),
    const Messages(),
    const Profile()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dasboard(); // Set the initial screen to Dasboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
        ), // Ensure the shape is circular
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 16.0, // Adjust the notch margin if needed
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 60.w,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dasboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 0
                            ? activeIcon('activeHome.svg')
                            : defaultIcon('defaultHome.svg'),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 60.w,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Search();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 1
                            ? activeIcon('activeSearch.svg')
                            : defaultIcon('defaultSearch.svg'),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 60.w,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Messages();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 2
                            ? activeIcon('activeMessages.svg')
                            : defaultIcon('defaultMessages.svg'),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 60.w,
                    onPressed: () {
                      setState(() {
                        currentScreen = const Profile();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentTab == 3
                            ? activeIcon('activeUser.svg')
                            : defaultIcon('defaultUser.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
