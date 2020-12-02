import 'package:flutter/material.dart';
import 'package:growlist/model/ToDo.dart';

class ListToDo extends StatelessWidget {
  final List<ToDoList> toDo;

  ListToDo({Key key, this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: toDo.length,
        padding: const EdgeInsets.all(15.0),
        itemBuilder: (context, position) {
          return Column(
            children: [
              Divider(height: 5.0),
              ListTile(
                title: Text(
                  '${toDo[position].title}',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
