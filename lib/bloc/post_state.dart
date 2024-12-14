import 'package:equatable/equatable.dart';
import 'package:mini_front/models/post_entity.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostLoadInProgress extends PostState {}

class PostLoadSuccess extends PostState {
  final List<Post> posts;

  const PostLoadSuccess([this.posts = const []]);

  @override
  List<Object> get props => [posts];
}

class PostLoadFailure extends PostState {}