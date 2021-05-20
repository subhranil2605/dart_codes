// This method is useful in sqflite plugin as the data is stored in the data base as a map object and we have to convert it into a clas object

class Cat{
  String name, color;
  
  // normal constructor for Cat
  Cat(this.name, this.color);
  
  // factory constructor for Cat
  // that doesn't return the new constructor always, but returns an instance
  Cat.fromMap(Map mapObject) {
    return Cat(mapObject['name'], mapObject['color']);
  }
}


// main function

void main() {
  // Creating a map object representing the cat class
  Map catMap = {'name': 'Peter', 'color': 'White'};
  
  // Now create a cat instance using the map object
  var catClass = Cat.fromMap(catMap);
  
  print(catClass);
  print(catClass.name);
  print(catClass.color);
}
