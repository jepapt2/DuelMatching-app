extension StringisNotNullAndNotEmpty on String? {
  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;
}
