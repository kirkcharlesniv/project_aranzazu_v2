import 'package:equatable/equatable.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchUninitialized extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchError extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  final List<BuiltNews> newsList;
  final bool hasReachedMax;

  SearchLoaded({this.newsList, this.hasReachedMax});
  SearchLoaded copyWith({List<BuiltNews> newsList, bool hasReachedMax}) {
    return SearchLoaded(
        newsList: newsList ?? this.newsList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [newsList, hasReachedMax];
}
