import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_doarti/models/doarti.dart';
import 'package:project_doarti/screens/home/doarti_tile.dart';

class DoartiList extends StatefulWidget {
  @override
  _DoartiListState createState() => _DoartiListState();
}

class _DoartiListState extends State<DoartiList> {
  @override
  Widget build(BuildContext context) {

    final doarti = Provider.of<List<Doarti>>(context);

    return ListView.builder(
      itemCount: doarti.length,
      itemBuilder: (context, index) {
        return DoartiTile(doarti: doarti[index]);
      },
    );
  }
}