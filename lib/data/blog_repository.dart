import '../models/blog_post.dart';
import '../views/screens/news_feed/blog_mock_data.dart';

/// In-memory blog store until API is wired.
abstract final class BlogRepository {
  BlogRepository._();

  static final List<BlogPost> posts = List.from(BlogMockData.initial);

  static BlogPost? findById(String id) {
    for (final post in posts) {
      if (post.id == id) return post;
    }
    return null;
  }

  static void add(BlogPost post) => posts.insert(0, post);
}
