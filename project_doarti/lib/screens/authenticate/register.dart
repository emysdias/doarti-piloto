import 'package:flutter/material.dart';
import 'package:project_doarti/services/auth.dart';
import 'package:project_doarti/models/user.dart';
import 'package:project_doarti/shared/constants.dart';
import 'package:project_doarti/shared/loading.dart';

class Register extends StatefulWidget {

	final Function toggleView;
	Register({ this.toggleView });

	@override
	_RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

	final AuthService _auth = AuthService();
	final _formKey = GlobalKey<FormState>();
	bool loading = false;

	String email = '';
	String password = '';
	String error = '';

	@override
	Widget build(BuildContext context) {
		return loading ? Loading() : Scaffold(
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
					key: _formKey,
					child: Column(
						children: <Widget>[
							SizedBox(height: 20.0),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'Email'),
								validator: (val) => val.isEmpty ? 'Entre com o email' : null,
								onChanged: (val) {
									setState(() => email = val);
								}
							),

							SizedBox(height: 20.0),
							TextFormField(
								decoration: textInputDecoration.copyWith(hintText: 'Senha'),
								obscureText: true,
								validator: (val) => val.length < 5 ? 'Senha no mínimo 5 caracteres' : null,
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
									if (_formKey.currentState.validate()){
										setState(() => loading = true);
										dynamic result = await _auth.registerWithEmailAndPassword(email, password);
										if(result == null) {
											setState(() { 
												error = 'Coloque um email válido';
												loading = false;
											});
										}
									}
								}	
							),
							SizedBox(height: 12.0),
							Text(
								error,
								style: TextStyle(color: Colors.red, fontSize: 14.0),
							),
						],
					),
				),
			),
		);
	}
}