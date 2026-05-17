Future<void> loadData() async {

  print("Loading...");

  await Future.delayed(Duration(seconds: 2));

  print("Done");
}

void main() async {

  // async / await
  await loadData();

  // null safety
  String? name;

  print(name ?? "No name");

  String text = "Hello";
  print(text!);

  // stream
  Stream<int> numbers = Stream.fromIterable([1, 2, 3]);

  numbers.listen((value) {
    print(value);
  });
}