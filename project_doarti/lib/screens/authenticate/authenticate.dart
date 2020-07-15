import 'package:flutter/material.dart';
import 'package:project_doarti/screens/authenticate/sign_in.dart';
import 'package:project_doarti/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
	@override
	Authenticate_State createState() => Authenticate_State();
}

class Authenticate_State extends State<Authenticate> {

	bool showSignIn = true;
	void toggleView() {
		setState(() => showSignIn = !showSignIn);
	}

	@override
	Widget build(BuildContext context) {
		if (showSignIn) {
			return SignIn(toggleView: toggleView);
		} else {
			return Register(toggleView: toggleView);
		}
	}
}

