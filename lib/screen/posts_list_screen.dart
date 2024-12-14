import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_front/bloc/post_bloc.dart';
import 'package:mini_front/bloc/post_event.dart';
import 'package:mini_front/bloc/post_state.dart';

class PostsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            context.read<PostBloc>().add(LoadPosts());
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoadSuccess) {
            if (state.posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/post_detail',
                      arguments: post,
                    );
                  },
                );
              },
            );
          } else if (state is PostLoadFailure) {
            return const Center(child: Text('Failed to load posts'));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_post');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
