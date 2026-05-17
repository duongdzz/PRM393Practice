class Car {

  String brand;

  // constructor
  Car(this.brand);

  // named constructor
  Car.named() : brand = "Tesla";

  void show() {
    print("Car: $brand");
  }
}

class ElectricCar extends Car {

  ElectricCar(String brand) : super(brand);

  @override
  void show() {
    print("Electric Car: $brand");
  }
}

void main() {

  Car car1 = Car("Toyota");
  car1.show();

  Car car2 = Car.named();
  car2.show();

  ElectricCar eCar = ElectricCar("Tesla");
  eCar.show();
}