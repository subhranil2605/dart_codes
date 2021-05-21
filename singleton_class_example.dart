// Example of a singleton class
class DatabaseHelper {
  
  // Singleton databasehelper
  static DatabaseHelper _databaseHelper;
  
  // Named constructor to create an instance
  DatabaseHelper._createInstance();
  
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
}

// Not a singleton class
class Note {
  final int id;
  final String title;
  
  Note(this.id, this.title);
}



void main() {
  DatabaseHelper databaseHelper1 = DatabaseHelper();
  DatabaseHelper databaseHelper2 = DatabaseHelper();
  
  print(databaseHelper1.hashCode);
  print(databaseHelper2.hashCode);
  
  Note note1 = Note(1, "First Note");
  Note note2 = Note(2, "Second Note");
  
  print(note1.hashCode);
  print(note2.hashCode);
  
}
