void main() {
  //ex1:
  int age = 23;
  double height = 1.69;
  String name = "Minh Duong";
  bool isStudent = true;

  print("Age: $age");
  print("Name: $name");
  print("Height: $height");
  print("Student: $isStudent");
  //ex2:
  //List
  List<int> number = [1, 2, 3];
  number.add(4);
  number.remove(2);

  print(number[0]);
  //operators

  int a = 6;
  int b = 7;
  print(a + b);
  print(a - b);
  print(a == b);
  print(a < b && b > 0);

  String result = a > b ? "A bigger" : "B bigger";
  print(result);

  //ex3
  // if / else
  int score = 8;

  if (score >= 5) {
    print("Pass");
  } else {
    print("Fail");
  }

  // switch
  String day = "Monday";

  switch (day) {
    case "Monday":
      print("Start week");
      break;

    default:
      print("Other day");
  }

  // loops
  List<String> fruits = ['Apple', 'Banana'];

  for (int i = 0; i < fruits.length; i++) {
    print(fruits[i]);
  }

  for (String fruit in fruits) {
    print(fruit);
  }

  fruits.forEach((fruit) {
    print(fruit);
  });

  // functions
  print(add(2, 3));
  print(square(4));
}

// normal function
int add(int a, int b) {
  return a + b;
}

// arrow function
int square(int x) => x * x;
