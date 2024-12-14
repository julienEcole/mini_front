import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_front/bloc/post_bloc.dart';
import 'package:mini_front/bloc/post_event.dart';
import 'package:mini_front/models/post_entity.dart';

class CreatePostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text('Create Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newPost = Post(
                  id: DateTime.now().toString(),
                  title: titleController.text,
                  description: descriptionController.text,
                );
                context.read<PostBloc>().add(CreatePost(newPost));
                Navigator.pop(context);
              },
              child: Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
