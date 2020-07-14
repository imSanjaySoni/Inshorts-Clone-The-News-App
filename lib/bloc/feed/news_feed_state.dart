import 'package:equatable/equatable.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:meta/meta.dart';

abstract class NewsFeedState extends Equatable {}

class NewsFeedInitialState extends NewsFeedState {
  @override
  List<Object> get props => [];
}

class NewsFeedLoadingState extends NewsFeedState {
  @override
  List<Object> get props => [];
}

class NewsFeedLoadedState extends NewsFeedState {
  final List<Articles> news;
  NewsFeedLoadedState({@required this.news});
  get moviesList => news;

  @override
  List<Object> get props => null;
}

class NewsFeedErrorState extends NewsFeedState {
  final String message;
  NewsFeedErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
