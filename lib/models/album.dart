class Album {
  Album({
    required this.imagePath,
    required this.title,
    required this.artist,
    required this.playtime,
  });

  final String imagePath;
  final String title;
  final String artist;
  final Duration playtime;
}
