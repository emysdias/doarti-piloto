import 'package:flutter/material.dart';
import 'package:project_doarti/services/auth.dart';

class SignIn extends StatefulWidget {
	@override
	_SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

	final AuthService _auth = AuthService();

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
						dynamic result = await _auth.signInAnon();
						if (result == null) {
							print('erro em sign in');
						} else {
							print('sign in');
							print(result);
						}
					}
				),
			)
		);
	}
}
