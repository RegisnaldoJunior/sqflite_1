class Note {
  final int? id;
  final String content;

  Note({
    this.id,
    required this.content,
  });

  // Converter para Map (para salvar no SQLite)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
    };
  }

  // Converter de Map (do SQLite para objeto Note)
  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      content: map['content'],
    );
  }
}
