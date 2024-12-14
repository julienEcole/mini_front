import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_front/datasources/fake_posts_data_source.dart';
import 'package:mini_front/models/post_entity.dart';
import 'package:mini_front/repositories/posts_repository.dart';
import 'package:mini_front/screen/create_post_screen.dart';
import 'package:mini_front/screen/post_detail_screen.dart';
import 'package:mini_front/screen/posts_list_screen.dart';
import 'bloc/post_bloc.dart';

void main() {
  final repository = PostsRepository(FakePostsDataSource());
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final PostsRepository repository;

  MyApp({required this.repository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TP 5AL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostBloc(repository),
        child: PostsListScreen(),
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/post_detail':
            final post = settings.arguments as Post;
            return MaterialPageRoute(
              builder: (context) => PostDetailScreen(post: post),
            );
          case '/create_post':
            return MaterialPageRoute(
              builder: (context) => CreatePostScreen(),
            );
          default:
            return null;
        }
      },
    );
  }
}
