class Project {
  final String title;
  final String description;
  final List<String> techStack;
  final String emoji;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final String? liveUrl;
  final bool isFeatured;

  Project({
    required this.title,
    required this.description,
    required this.techStack,
    required this.emoji,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    this.liveUrl,
    this.isFeatured = false,
  });
}
