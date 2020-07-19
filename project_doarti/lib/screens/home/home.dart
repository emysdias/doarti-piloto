import 'package:flutter/material.dart';
import 'package:project_doarti/services/auth.dart';
import 'package:project_doarti/services/database.dart';
import 'package:provider/provider.dart';
import 'package:project_doarti/models/doarti.dart';
import 'package:project_doarti/screens/home/doarti_list.dart';
import 'package:project_doarti/screens/home/settings_form.dart';

class Home extends StatelessWidget {

	final AuthService _auth = AuthService();

	@override
	Widget build(BuildContext context) {

		void _showSettingsPanel() {
     		showModalBottomSheet(context: context, builder: (context) {
        		return Container(
          			padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          			child: SettingsForm(),
        		);
      		});
    	}

    return StreamProvider<List<Doarti>>.value(
      value: DatabaseService().doarti,
      child: Scaffold(
        backgroundColor: Colors.purple[50],
        appBar: AppBar(
          title: Text('Livros'),
          backgroundColor: Colors.purple[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sair'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Configurações'),
              onPressed: () => _showSettingsPanel(),
            ),
          ],
        ),
        body: DoartiList(),
      ),
    );
  }
}
