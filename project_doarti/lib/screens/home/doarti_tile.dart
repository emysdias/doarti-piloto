import 'package:project_doarti/models/doarti.dart';
import 'package:flutter/material.dart';

class DoartiTile extends StatelessWidget {

  final Doarti doarti;
  DoartiTile({ this.doarti });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.purple[doarti.strength],
          ),
          title: Text(doarti.name),
          subtitle: Text('Pegou ${doarti.sugars} açúcar(es)'),
        ),
      ),
    );
  }
}