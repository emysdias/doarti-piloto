import 'package:flutter/material.dart';
import 'package:project_doarti/services/auth.dart';
import 'package:project_doarti/services/database.dart';
import 'package:provider/provider.dart';
import 'package:project_doarti/models/doarti.dart';
import 'package:project_doarti/screens/home/doarti_list.dart';

class Home extends StatelessWidget {

	final AuthService _auth = AuthService();

	@override
	Widget build(BuildContext context) {
    return StreamProvider<List<Doarti>>.value(
      value: DatabaseService().doarti,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Doarti'),
          backgroundColor: Colors.purple[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: DoartiList(),
      ),
    );
  }
}
