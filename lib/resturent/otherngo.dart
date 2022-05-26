import 'package:flutter/material.dart';

import '../../constants/constant.dart';
class otherngo extends StatefulWidget {
  const otherngo({Key? key}) : super(key: key);

  @override
  State<otherngo> createState() => _otherngoState();
}

class _otherngoState extends State<otherngo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.local_mall,
        color: Colors.grey,
        size: 60.0,
      ),
    );
  }
}
