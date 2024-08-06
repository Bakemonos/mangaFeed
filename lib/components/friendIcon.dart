import 'package:flutter/material.dart';
import 'package:mangafeed/properties.dart';

class FriendsList extends StatelessWidget {
  const FriendsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
                onTap: () {
                  // Handle button press
                  print('Circle button pressed');
                },
                child: const SizedBox(
                  width: 70.0, // Adjust the width as needed
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: themeColor, // Customize button color
                        child: Icon(
                          Icons.add, // Customize icon as needed
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ));
          } else {
            return SizedBox(
              width: 70.0, // Adjust the width as needed
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: AssetImage('assets/Images/todoroki.png'),
                  ),
                  const SizedBox(height: 5.0),
                  Text('Friend $index'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
