import 'package:flutter/material.dart';

import '../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('$home Page', style: Theme.of(context).textTheme.headline6),
    );
  }
}
