// Getter and Sette in Dart

class NameClass{
  
  String first;
  String last;
  
  NameClass(this.first, this.last);
  
  // getter for the email
  String get email => "$first.$last@email.com";
  
  // getter for the fullname
  String get fullname => "$first $last";
  
  // Setter for the fullname
  set fullname(String name) {
    List<String> f = name.split(' ');
    
    this.first = f[0];
    this.last = f[1];
  }
}


void main() {
  NameClass mySelf = NameClass("Subhranil", "Sarkar");
  print(mySelf.first);
  print(mySelf.email);
  print(mySelf.fullname);
  
  mySelf.fullname = "Pritam Sarkar";
  print(mySelf.first);
  print(mySelf.email);
  print(mySelf.fullname);
}
