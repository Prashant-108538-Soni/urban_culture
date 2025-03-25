class SkinCareStep {
  final String name;
  final String description;
  final String time;
  bool isCompleted;

  SkinCareStep({
    required this.name,
    required this.description,
    required this.time,
    this.isCompleted = false,
  });
}
