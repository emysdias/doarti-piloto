import 'package:flutter/material.dart';
import 'package:project_doarti/services/auth.dart';

class Home extends StatelessWidget {

	final AuthService _auth = AuthService();

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.purple[50],
			appBar: AppBar(
				title: Text("Doarti"),
				backgroundColor: Colors.purple[400],
				elevation: 0.0,
				actions: <Widget>[
					FlatButton.icon(
						icon: Icon(Icons.person),
						label: Text('logout'),
						onPressed: () async {
							await _auth.signOut();
						},
					)
				],
			),
		);
	}
}
