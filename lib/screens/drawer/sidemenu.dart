// ignore_for_file: prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import'package:flutter/material.dart';
import 'package:flutter_project/screens/bottomTabBar/FabTabs.dart';


class SideMenu extends StatefulWidget {
   @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text("Flutter-Project", style: TextStyle(color: Colors.white, fontSize: 25), textAlign: TextAlign.center),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
               bottomLeft: Radius.circular(1.0),
                bottomRight: Radius.circular(1.0),
              ),

              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   //image: AssetImage('assets/images/'),
              // ),

              color: Colors.indigo,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),),
            onTap: () =>{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex:0)),)
            },
            iconColor: Colors.deepPurpleAccent,
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text(
              "Sign in",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),),
            onTap: () =>{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex:1)))
            },
            iconColor: Colors.deepPurpleAccent,
          ),
          ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text(
              "Sign up",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),),
            onTap: () =>{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex:2)))
            },
            iconColor: Colors.deepPurpleAccent,

          ),


          ListTile(
            leading: Icon(Icons.calculate_sharp ),
            title: Text(
              "Calculator",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),),
            onTap: () =>{
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Fabtabs(selectedIndex:3)))
            },
            iconColor: Colors.deepPurpleAccent,
          ),


        ],
      ),
    );
  }
}

