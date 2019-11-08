import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class ResetSearch extends SearchEvent {
  @override
  List<Object> get props => [];
}

class FetchSearch extends SearchEvent {
  final String query;
  final bool shouldResetSearch;

  FetchSearch({@required this.query, this.shouldResetSearch});

  @override
  List<Object> get props => [];
}
