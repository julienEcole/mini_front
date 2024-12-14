import 'package:equatable/equatable.dart';
import 'package:mini_front/models/post_entity.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class LoadPosts extends PostEvent {}

class CreatePost extends PostEvent {
  final Post post;
  const CreatePost(this.post);

  @override
  List<Object> get props => [post];
}

class UpdatePost extends PostEvent {
  final Post post;
  const UpdatePost(this.post);

  @override
  List<Object> get props => [post];
}
