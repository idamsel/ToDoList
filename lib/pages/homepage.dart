import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:growlist/model/ToDo.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:growlist/pages/listtodo.dart';

//Fetch the data in a separate isolate.

Future<List<ToDoList>> fetchToDo(http.Client client) async {
  final response =
      await client.get("https://jsonplaceholder.typicode.com/todos");

  return parsedToDo(response.body);
}

//Convert HTTP response into list of dart objects.

List<ToDoList> parsedToDo(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ToDoList>((json) => ToDoList.fromJson(json)).toList();
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetchig Data with List"),
      ),
      body: FutureBuilder(
        future: fetchToDo(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListToDo(toDo: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
