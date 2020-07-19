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
  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];

  String _currentName;
  String _currentSugars;
  int _currentStrength;

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
            value: _currentSugars ?? '0',
            decoration: textInputDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar açúcares'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugars = val ),
          ),
          SizedBox(height: 10.0),
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.purple[_currentStrength ?? 100],
            inactiveColor: Colors.purple[_currentStrength ?? 100],
            min: 100.0,
            max: 900.0,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
          ),
          RaisedButton(
            color: Colors.pink[400],
            child: Text(
              'Atualizar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
                    if(_formKey.currentState.validate()){
                      await DatabaseService(uid: user.uid).updateUserData(
                        _currentSugars ?? snapshot.data.sugars, 
                        _currentName ?? snapshot.data.name, 
                        _currentStrength ?? snapshot.data.strength
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