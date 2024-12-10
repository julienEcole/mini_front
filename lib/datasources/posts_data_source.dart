import 'package:mini_front/models/Post.dart';

abstract class PostsDataSource {
  Future<List<Post>> getAllPosts();
  Future<Post> createPost(Post postToAdd);
  Future<Post> updatePost(Post newPost);
}