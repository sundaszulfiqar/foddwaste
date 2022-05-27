import 'package:foodwastemange/constants/constant.dart';
import 'package:flutter/material.dart';

class myrequest extends StatefulWidget {
  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<myrequest> {
  final deliveryList = [
    {
      'orderId': 'OID123456789',
      'foodname': 'Biryani',
      'foodcount': '8',
      'restaurantAddress': 'Ali Resturant',
      'deliveryAddress': 'Ahmad NGO'
    },
    {
      'orderId': 'OID123456790',
      'foodname': 'rice',
      'foodcount': '2',
      'restaurantAddress': 'star Resturant',
      'deliveryAddress': 'funding NGO'
    },

    {
      'orderId': 'OID123456791',
      'foodname': 'qorma',
      'foodcount': '2',
      'restaurantAddress': 'dholn Resturant',
      'deliveryAddress': 'zeee NGO'
    },
    {
      'orderId': 'OID123456792',
      'foodname': 'Biryani',
      'foodcount': '3',
      'restaurantAddress': 'karachi Resturant',
      'deliveryAddress': 'naaz NGO'
    },

  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    rejectreasonDialog() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Wrap(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Reason to Reject',
                        style: wbuttonWhiteTextStyle,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(fixPadding),
                      alignment: Alignment.center,
                      child: Text('Write a specific reason to reject order'),
                    ),
                    Container(
                      width: width,
                      padding: EdgeInsets.all(fixPadding),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: 'Enter Reason Here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          fillColor: Colors.grey.withOpacity(0.1),
                          filled: true,
                        ),
                      ),
                    ),
                    heightSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Cancel',
                              style: buttonBlackTextStyle,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Send',
                              style: wbuttonWhiteTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    heightSpace,
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    orderAcceptDialog(index) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Wrap(
              children: <Widget>[
                Container(
                  width: width,
                  height: height / 7,
                  child: ListView(
                    children: <Widget>[
                      Container(
                        width: width,
                        padding: EdgeInsets.all(fixPadding),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'OID123456789',
                          style: wbuttonWhiteTextStyle,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  deliveryList.removeAt(index);
                                });
                                Navigator.pop(context);
                                rejectreasonDialog();
                              },
                              child: Container(
                                width: (width / 3.5),
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  'Reject',
                                  style: buttonBlackTextStyle,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  deliveryList.removeAt(index);
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: (width / 3.5),
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  'Accept',
                                  style: wbuttonWhiteTextStyle,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      heightSpace,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return (deliveryList.length == 0)
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.local_mall,
                  color: Colors.grey,
                  size: 60.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'No new orders.',
                  style: greyHeadingStyle,
                ),
              ],
            ),
          )
        : ListView.builder(
            itemCount: deliveryList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = deliveryList[index];
              return Container(
                padding: EdgeInsets.all(fixPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            blurRadius: 1.5,
                            spreadRadius: 1.5,
                            color: Colors.grey[200]!,
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(fixPadding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.fastfood,
                                        color: primaryColor, size: 25.0),
                                    widthSpace,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(item['orderId']!,
                                            style: headingStyle),
                                        heightSpace,
                                        heightSpace,
                                        Text('Food Name',
                                            style: lightGreyStyle),
                                        Text(item['foodname']!,
                                            style: headingStyle),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () => orderAcceptDialog(index),
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Container(
                                        height: 40.0,
                                        width: 100.0,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          color: primaryColor,
                                        ),
                                        child: Text(
                                          'Accept',
                                          style: wbuttonWhiteTextStyle,
                                        ),
                                      ),
                                    ),
                                    heightSpace,
                                    Text('foodcount', style: lightGreyStyle),
                                    Text(' ${item['foodcount']}',
                                        style: headingStyle),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(fixPadding),
                            decoration: BoxDecoration(
                              color: lightGreyColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: (width - fixPadding * 4.0) / 3.2,
                                  child: Text(
                                    item['restaurantAddress']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: buttonBlackTextStyle,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_on,
                                      color: primaryColor,
                                      size: 20.0,
                                    ),
                                    getDot(),
                                    getDot(),
                                    getDot(),
                                    getDot(),
                                    getDot(),
                                    Icon(
                                      Icons.navigation,
                                      color: primaryColor,
                                      size: 20.0,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: (width - fixPadding * 4.0) / 3.2,
                                  child: Text(
                                    item['deliveryAddress']!,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: buttonBlackTextStyle,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  getDot() {
    return Container(
      margin: EdgeInsets.only(left: 2.0, right: 2.0),
      width: 4.0,
      height: 4.0,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(2.0),
      ),
    );
  }
}
