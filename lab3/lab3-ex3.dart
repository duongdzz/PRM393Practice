import 'dart:async';

void main() {
  print('1. Dong bo (sync) - bat dau');

  Future(() {
    print('5. Event queue - Future(() { ... })');
  });

  Future.microtask(() {
    print('3. Microtask - Future.microtask()');
  });

  scheduleMicrotask(() {
    print('4. Microtask - scheduleMicrotask()');
  });

  print('2. Dong bo (sync) - ket thuc');

  // Ket qua khi chay: 1 -> 2 -> 3 -> 4 -> 5
  //
  // Giai thich ngan gon:
  // - Code dong bo (1, 2) chay ngay lap tuc.
  // - Microtask (3, 4) duoc xu ly het truoc.
  // - Event callback (5) moi chay sau cung.
  //
  // Vi sao microtask chay truoc event?
  // Dart co 1 vong lap su kien (event loop).
  // Moi lan lap: xu ly HET microtask queue truoc,
  // roi moi lay 1 viec tu event queue.
  // Nen scheduleMicrotask / Future.microtask
  // luon uu tien hon Future(() { ... }).
}
