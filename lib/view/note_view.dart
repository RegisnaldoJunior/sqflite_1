import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/note_controller.dart';

class NoteView extends StatelessWidget {
  final NoteController _controller = Get.put(NoteController());
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Notas'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Digite uma nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _controller.addNote(_textController.text);
                _textController.clear();
              },
              child: Text('Adicionar Nota'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: _controller.notes.length,
                  itemBuilder: (context, index) {
                    final note = _controller.notes[index];
                    return ListTile(
                      title: Text(note.content),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _controller.deleteNoteById(note.id!),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
