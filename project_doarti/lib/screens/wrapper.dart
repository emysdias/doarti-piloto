import 'package:flutter/material.dart';
import 'package:project_doarti/screens/home/home.dart';
import 'package:project_doarti/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
	@override
	Widget build(BuildContext context) {

		//return either home or authenticate
		return Authenticate();
	}
}
