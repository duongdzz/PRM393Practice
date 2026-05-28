class Settings {
  static final Settings _instance = Settings._internal();

  Settings._internal();

  factory Settings() => _instance;
}

void main() {
  final a = Settings();
  final b = Settings();

  print('identical(a, b): ${identical(a, b)}');
  // Ket qua: true — ca hai bien tro cung mot object (singleton/cache)
}
