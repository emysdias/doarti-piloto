import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.purple[100],
			appBar: AppBar(
				backgroundColor: Colors.purple[400],
				elevation: 0.0,
				title: Text('Sign in to the app'),
			),
			body: Container(
				padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
				child: RaisedButton(
					child: Text('Sign in anon'),
					onPressed: () async {
						
					}
				),
			)
		);
	}
}