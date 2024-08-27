import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Acount_Screen extends StatefulWidget {
  const Acount_Screen({super.key});

  @override
  State<Acount_Screen> createState() => _Acount_ScreenState();
}

class _Acount_ScreenState extends State<Acount_Screen> {
  bool _switchValue = true;
  bool _switchValue2 = true;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3276/3276535.png"),
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    user?.displayName ?? " ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    user?.email ?? " ",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "User current location",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dark Mode",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Switch(
                        activeColor: Colors.yellow,
                        value: _switchValue,
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ar",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Switch(
                        activeColor: Colors.yellow,
                        value: _switchValue2,
                        onChanged: (bool value) {
                          setState(() {
                            _switchValue2 = value;
                          });
                        },
                      ),
                      Text(
                        "en",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings, size: 40, color: Colors.black),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.logout, size: 40, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
