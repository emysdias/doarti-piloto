import 'package:project_doarti/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_doarti/shared/loading.dart';
import 'package:project_doarti/models/user.dart';
import 'package:project_doarti/services/database.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<String> books = ['0', '1', '2', '3', '4'];

  String _currentName;
  String _currentBooks;

  @override
  Widget build(BuildContext context) {

    User user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData){
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Text(
            'Atualize as configurações.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
          	initialValue: userData.name,
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Por favor entre com o nome' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            value: _currentBooks ?? '0',
            decoration: textInputDecoration,
            items: books.map((book) {
              return DropdownMenuItem(
                value: book,
                child: Text('$book livros'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentBooks = val ),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Atualizar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentBooks ?? snapshot.data.books, 
                        _currentName ?? snapshot.data.name, 
                      );
                      Navigator.pop(context);
                    }
                  }
                ),
              ],
            ),
          );
        } else {
          	return Loading();
        }
      }
    );
  }
}