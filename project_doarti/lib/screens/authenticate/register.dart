import 'package:flutter/material.dart';
import 'package:project_doarti/services/auth.dart';

class Register extends StatefulWidget {

	final Function toggleView;
	Register({ this.toggleView });

	@override
	_RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

	final AuthService _auth = AuthService();

	String email = '';
	String password = '';

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.purple[100],
			appBar: AppBar(
				backgroundColor: Colors.purple[400],
				elevation: 0.0,
				title: Text('Register to the app'),
				actions: <Widget>[
					FlatButton.icon(
						icon: Icon(Icons.person),
						label: Text('Entrar'),
						onPressed: () {
							widget.toggleView();
						}
					)
				],
			),
			body: Container(
				padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
				child: Form(
					child: Column(
						children: <Widget>[
							SizedBox(height: 20.0),
							TextFormField(
								onChanged: (val) {
									setState(() => email = val);
								}
							),

							SizedBox(height: 20.0),
							TextFormField(
								obscureText: true,
								onChanged: (val) {
									setState(() => password = val);
								}
							),

							SizedBox(height: 20.0),
							RaisedButton(
								color: Colors.pink[400],
								child: Text(
									'Registrar',
									style: TextStyle(color: Colors.white),
								),
								onPressed: () async {
									print(email);
									print(password);
								}	
							),
						],
					),
				),
			),
		);
	}
}