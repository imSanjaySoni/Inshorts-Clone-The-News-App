import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class NewsFeedEvent extends Equatable {}

class FetchNewsByCategoryEvent extends NewsFeedEvent {
  final String category;
  FetchNewsByCategoryEvent({@required this.category});

  List<Object> get props => [category];
}

class FetchNewsByTopicEvent extends NewsFeedEvent {
  final String topic;
  FetchNewsByTopicEvent({@required this.topic});

  List<Object> get props => [topic];
}

class FetchNewsFromLocalStorageEvent extends NewsFeedEvent {
  final String box;
  FetchNewsFromLocalStorageEvent({@required this.box});

  List<Object> get props => [box];
}
