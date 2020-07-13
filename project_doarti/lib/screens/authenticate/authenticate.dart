import 'package:flutter/material.dart';
import 'package:project_doarti/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
	@override
	Authenticate_State createState() => Authenticate_State();
}

class Authenticate_State extends State<Authenticate> {
	@override
	Widget build(BuildContext context) {
		return Container(
			child: SignIn(),
		); // Container
	}
}

