import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mangafeed/pages/screens/dasboard.dart';
import 'package:mangafeed/pages/screens/messages.dart';
import 'package:mangafeed/pages/screens/profile.dart';
import 'package:mangafeed/pages/screens/search.dart';
import 'package:mangafeed/properties.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color active = themeColor;
  Color defualt = textLight;

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
      backgroundColor: backgroundColor,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        disabledElevation: 0,
        backgroundColor: themeColor,
        enableFeedback: true,
        onPressed: () {},
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          size: 24.w,
          color: textLight,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          height: 70.h,
          color: themeColor.withOpacity(0.5),
          child: SizedBox(
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
                              ? activeIcon('activeHome.svg', active)
                              : navIcon('home.svg', defualt),
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
                              ? activeIcon('activeSearch.svg', active)
                              : navIcon('search.svg', defualt),
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
                              ? activeIcon('activeMessages.svg', active)
                              : navIcon('message.svg', defualt),
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
                              ? activeIcon('activeUser.svg', active)
                              : navIcon('user.svg', defualt),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget navIcon(String icon, Color color) {
  return SvgPicture.asset(
    'assets/Icons/$icon',
    color: color,
  );
}

Widget activeIcon(String iconName, Color color) {
  return SvgPicture.asset(
    'assets/Icons/navIcons/active/$iconName',
    color: color,
  );
}
