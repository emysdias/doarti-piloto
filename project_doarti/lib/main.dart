import 'package:flutter/material.dart';
import 'package:project_doarti/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:project_doarti/services/auth.dart';
import 'package:project_doarti/models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      	child: MaterialApp(
      	home: Wrapper(),
      ),
    );
  }
}