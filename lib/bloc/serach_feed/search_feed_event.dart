import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SearchFeedEvent extends Equatable {}

class FetchNewsBySearchQueryEvent extends SearchFeedEvent {
  final String query;
  FetchNewsBySearchQueryEvent({@required this.query});

  List<Object> get props => [query];
}
