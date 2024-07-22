class Contact {
  final String name;
  final String status;
  final String imageUrl;
  final String initial;

  Contact({required this.name, required this.status, required this.imageUrl})
      : initial = name[0].toUpperCase();
}
