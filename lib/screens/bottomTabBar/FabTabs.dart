// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/screens/calculator.dart';
import 'package:flutter_project/screens/signin_screen.dart';
import 'package:flutter_project/screens/signup_screen.dart';
import 'package:flutter_project/screens/welcome_screen.dart';


class Fabtabs extends StatefulWidget {
  int selectedIndex = 0;

  Fabtabs({required this.selectedIndex});

   @override
  State<Fabtabs> createState() => _FabtabsState();
}

class _FabtabsState extends State<Fabtabs> {
  int currentIndex = 0;

  void onItemTapped(int index){
    setState(() {
      widget.selectedIndex = index;
      currentIndex = widget.selectedIndex;
    });
  }

  @override
  void initState() {
    onItemTapped(widget.selectedIndex);
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> pages = [
    WelcomeScreen(),
    SignInScreen(),
    SignUpScreen(),
    Calculator()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = currentIndex == 0 ? WelcomeScreen() : currentIndex == 1 ? SignInScreen() : currentIndex == 2 ? SignUpScreen():Calculator();
    return  Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.indigoAccent,
      //   child: Icon(Icons.add, color: Colors.white,),
      //   onPressed: (){
      //     print("add button here");
      //   },
      // ),

      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: (){
                      setState(() {
                        currentScreen = WelcomeScreen();
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color: currentIndex == 0 ? Colors.deepPurpleAccent : Colors.grey,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(color: currentIndex == 0 ? Colors.deepPurpleAccent : Colors.grey),

                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 50,
                    onPressed: (){
                      setState(() {
                        currentScreen = SignInScreen();
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.login,
                          color: currentIndex == 1 ? Colors.deepPurpleAccent : Colors.grey,
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(color: currentIndex == 1 ? Colors.deepPurpleAccent : Colors.grey),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 50,
                    onPressed: (){
                      setState(() {
                        currentScreen = SignUpScreen();
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_sharp,
                          color: currentIndex == 2 ? Colors.deepPurpleAccent : Colors.grey,
                        ),
                        Text(
                          "Sign Up",
                          style: TextStyle(color: currentIndex == 2 ? Colors.deepPurpleAccent : Colors.grey),

                        ),
                      ],
                    ),
                  ),


                  MaterialButton(
                    minWidth: 50,
                    onPressed: (){
                      setState(() {
                        currentScreen = Calculator();
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calculate_outlined,
                          color: currentIndex == 3 ? Colors.deepPurpleAccent: Colors.grey,
                        ),
                        Text(
                          "Calculator",
                          style: TextStyle(color: currentIndex == 3 ? Colors.deepPurpleAccent : Colors.grey),

                        ),
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
