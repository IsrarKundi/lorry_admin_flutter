class BlogPost {
  const BlogPost({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.content,
    required this.imageAsset,
    required this.publishedAt,
    required this.author,
  });

  final String id;
  final String title;
  final String excerpt;
  final String content;
  final String imageAsset;
  final DateTime publishedAt;
  final String author;
}
