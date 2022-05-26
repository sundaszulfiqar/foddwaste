import 'dart:io';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodwastemange/ngo_login_signup/home_ngo/home_main.dart';
import 'package:foodwastemange/ngo_login_signup/profile/edit_profile.dart';

import 'package:foodwastemange/constants/constants.dart';
import 'package:foodwastemange/resturent/returant_home.dart';



class RBottomBar extends StatefulWidget {
  final int? tabIndex;

  RBottomBar({Key? key, this.tabIndex}) : super(key: key);
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<RBottomBar> {
  int? currentIndex;
  DateTime? currentBackPressTime;
  @override
  void initState() {
    super.initState();
    if (widget.tabIndex == null) {
      currentIndex = 0;
    } else {
      currentIndex = widget.tabIndex;
    }
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex!,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          currentIndex = index;
        }),
        containerHeight: 60.0,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text('NGO'),
            icon: Icon(Icons.home),
            activeColor: primaryColor,
          ),
          BottomNavyBarItem(
            title: Text('Account'),
            icon: Icon(Icons.person),
            activeColor: primaryColor,
          ),
        ],
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? HomeMain()
                    :EditProfile()



        ,
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
