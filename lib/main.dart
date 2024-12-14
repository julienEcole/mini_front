import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_front/datasources/fake_posts_data_source.dart';
import 'package:mini_front/models/post_entity.dart'; // On importe le fichier du Post
import 'package:mini_front/repositories/posts_repository.dart';
import 'package:mini_front/screen/create_post_screen.dart';
import 'package:mini_front/screen/post_detail_screen.dart';
import 'package:mini_front/screen/posts_list_screen.dart';
import 'package:mini_front/bloc/post_bloc.dart';

void main() {
  final repository = PostsRepository(FakePostsDataSource());
  runApp(
    BlocProvider(
      create: (context) => PostBloc(repository),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // repository n’est plus nécessaire ici, on l’a déjà utilisé au-dessus.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TP 5AL',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostsListScreen(), 
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/post_detail':
            final post = settings.arguments as Post;
            return MaterialPageRoute(
              builder: (context) => PostDetailScreen(post: post),
            );
          case '/create_post':
            return MaterialPageRoute(
              builder: (context) => const CreatePostScreen(),
            );
          default:
            return null;
        }
      },
    );
  }
}
