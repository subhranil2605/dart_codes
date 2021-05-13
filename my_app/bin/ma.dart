Future<void> getData() {
  Future.delayed(Duration(seconds: 2), () {
    print('Hello World');
  });
}

void main() {
  print('Data Fetching');
  getData();
}