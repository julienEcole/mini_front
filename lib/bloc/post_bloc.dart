import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_front/bloc/post_event.dart';
import 'package:mini_front/bloc/post_state.dart';
import 'package:mini_front/repositories/posts_repository.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<LoadPosts>((event, emit) async {
      emit(PostLoadInProgress());
      try {
        final posts = await repository.getAllPosts();
        emit(PostLoadSuccess(posts));
      } catch (_) {
        emit(PostLoadFailure());
      }
    });

    on<CreatePost>((event, emit) async {
      emit(PostLoadInProgress());
      try {
        await repository.createPost(event.post);
        final posts = await repository.getAllPosts();
        emit(PostLoadSuccess(posts));
      } catch (_) {
        emit(PostLoadFailure());
      }
    });

    on<UpdatePost>((event, emit) async {
      emit(PostLoadInProgress());
      try {
        await repository.updatePost(event.post);
        final posts = await repository.getAllPosts();
        emit(PostLoadSuccess(posts));
      } catch (_) {
        emit(PostLoadFailure());
      }
    });
  }
}
