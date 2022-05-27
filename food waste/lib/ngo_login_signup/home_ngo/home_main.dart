import 'package:flutter/material.dart';
import 'package:foodwastemange/ngo_login_signup/home_ngo/addrequest.dart';
import 'otherngo.dart';
import 'package:foodwastemange/constants/constant.dart';
import 'myrequest.dart';


class HomeMain extends StatefulWidget {
  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: scaffoldBgColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          title: Text(
            'NGO Home',
            style: bigHeadingStyle,
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => addrequest()));
              },
              child: Text(
                'Add Request',
                style: primaryColorHeadingStyle,
              ),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.grey.withOpacity(0.3),
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: 'All Requests'),
              Tab(text: 'Other NGOS'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            myrequest(),
            otherngo(),

          ],
        ),
      ),
    );
  }
}

