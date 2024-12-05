import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/note_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gerenciador de Notas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NoteView(),
    );
  }
}
