// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/screens/calculator.dart';
import 'package:flutter_project/screens/signin_screen.dart';
import 'package:flutter_project/screens/signup_screen.dart';
import 'package:flutter_project/screens/welcome_screen.dart';
import 'package:flutter_project/theme/theme_notifier.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        bool isDarkMode = themeNotifier.getTheme().brightness == Brightness.dark;
        return Drawer(
          backgroundColor: isDarkMode ? Colors.black : Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text(
                  "Flutter-Project",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(1.0),
                    bottomRight: Radius.circular(1.0),
                  ),
                  color: Colors.indigo,
                ),
              ),
              ListTile(
                leading: Icon(Icons.home_filled, color: isDarkMode ? Colors.grey : lightColorScheme.primary),
                title: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.grey : lightColorScheme.primary,
                  ),
                ),
                onTap: () => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()))
                },
              ),
              ListTile(
                leading: Icon(Icons.login, color: isDarkMode ? Colors.grey : lightColorScheme.primary),
                title: Text(
                  "Sign in",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.grey : lightColorScheme.primary,
                  ),
                ),
                onTap: () => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignInScreen()))
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle_sharp, color: isDarkMode ? Colors.grey : lightColorScheme.primary),
                title: Text(
                  "Sign up",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.grey : lightColorScheme.primary,
                  ),
                ),
                onTap: () => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpScreen()))
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate_sharp, color: isDarkMode ? Colors.grey : lightColorScheme.primary),
                title: Text(
                  "Calculator",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.grey : lightColorScheme.primary,
                  ),
                ),
                onTap: () => {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Calculator()))
                },
              ),
              const Divider(),
              ListTile(
                leading: Icon(Icons.brightness_6, color: isDarkMode ? Colors.grey : lightColorScheme.primary),
                title: Text(
                  "Dark Mode",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.grey : lightColorScheme.primary,
                  ),
                ),
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    if (value) {
                      themeNotifier.setTheme(ThemeData.dark());
                    } else {
                      themeNotifier.setTheme(ThemeData.light());
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
