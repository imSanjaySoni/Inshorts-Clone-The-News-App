import 'package:equatable/equatable.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:meta/meta.dart';

abstract class SearchFeedState extends Equatable {}

class SearchFeedInitialState extends SearchFeedState {
  @override
  List<Object> get props => [];
}

class SearchFeedLoadingState extends SearchFeedState {
  @override
  List<Object> get props => [];
}

class SearchFeedLoadedState extends SearchFeedState {
  final List<Articles> news;
  SearchFeedLoadedState({@required this.news});
  get moviesList => news;

  @override
  List<Object> get props => null;
}

class SearchFeedErrorState extends SearchFeedState {
  final String message;
  SearchFeedErrorState({@required this.message});
  @override
  List<Object> get props => null;
}
