class GearItem {
  final String name;
  final String? note;
  final String? imagePath; // optional later (icons)

  const GearItem({
    required this.name,
    this.note,
    this.imagePath,
  });
}
