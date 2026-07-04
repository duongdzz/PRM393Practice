class Habit {
  final String id;
  final String title;
  final bool isCompleted;

  const Habit({
    required this.id,
    required this.title,
    this.isCompleted = false,
  });

  Habit copyWith({
    String? id,
    String? title,
    bool? isCompleted,
  }) {
    return Habit(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      id: json['id'] as String,
      title: json['title'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}
