import 'package:flutter/material.dart';
import 'package:foodwastemange/resturent/ngo_request.dart';

import '../constants/constant.dart';


import '../ngo_login_signup/home_ngo/addrequest.dart';
import '../ngo_login_signup/home_ngo/myrequest.dart';
import '../ngo_login_signup/home_ngo/otherngo.dart';
class ResturantHome extends StatefulWidget {
  const ResturantHome({Key? key}) : super(key: key);

  @override
  State<ResturantHome> createState() => _ResturantHomeState();
}

class _ResturantHomeState extends State<ResturantHome> {
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
            'Resturent Home',
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
        body: const TabBarView(
          children: [
            NgoRequest(),
            otherngo(),

          ],
        ),
      ),
    );
  }
}
