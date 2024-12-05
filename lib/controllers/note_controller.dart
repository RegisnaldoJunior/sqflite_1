import 'package:get/get.dart';
import '../model/note.dart';
import '../services/database_service.dart';

class NoteController extends GetxController {
  final DatabaseService _dbService = DatabaseService();

  var notes = <Note>[].obs;

  void fetchNotes() async {
    final fetchedNotes = await _dbService.getNotes();
    notes.value = fetchedNotes;
  }

  void addNote(String content) async {
    if (content.trim().isEmpty) return;
    await _dbService.insertNote(Note(content: content.trim()));
    fetchNotes(); // Atualiza a lista
  }

  void deleteNoteById(int id) async {
    await _dbService.deleteNoteById(id);
    fetchNotes(); // Atualiza a lista
  }
}
