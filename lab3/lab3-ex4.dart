import 'dart:async';

void main() {
  
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);

  numbers
      .map((n) => n * n)
      .where((n) => n.isEven)
      .listen((value) {
    print(value);
  });
  
  // 1. Stream so 1–5
  // 2. map() -> binh phuong; 3. where() -> chi so chan; 4. listen() -> in
  // Luong: 1,2,3,4,5 -> 1,4,9,16,25 -> 4,16 (chi so chan)
}
