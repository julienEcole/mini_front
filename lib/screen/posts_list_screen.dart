import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_front/bloc/post_bloc.dart';
import 'package:mini_front/bloc/post_event.dart';
import 'package:mini_front/bloc/post_state.dart';

class PostsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            context.read<PostBloc>().add(LoadPosts());
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoadSuccess) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                  onTap: () {
                    // Navigate to post detail screen
                  },
                );
              },
            );
          } else if (state is PostLoadFailure) {
            return Center(child: Text('Failed to load posts'));
          } else {
            return Center(child: Text('Unknown state'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to create post screen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}