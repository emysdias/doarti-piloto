import 'package:flutter/material.dart';
import 'package:project_doarti/screens/home/home.dart';
import 'package:project_doarti/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:project_doarti/models/user.dart';

class Wrapper extends StatelessWidget {
	@override
	Widget build(BuildContext context) {

		final user = Provider.of<User>(context);

		//return either home or authenticate
		if(user == null){
			return Authenticate();
		} else {
			return Home();
		}
	}
}
