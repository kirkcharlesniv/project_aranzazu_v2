import 'package:equatable/equatable.dart';
import 'package:project_aranzazu_v2/features/news/model/built_news.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsUnintialized extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsError extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsLoaded extends NewsState {
  final List<BuiltNews> newsList;
  final bool hasReachedMax;

  NewsLoaded({this.newsList, this.hasReachedMax});
  NewsLoaded copyWith({List<BuiltNews> newsList, bool hasReachedMax}) {
    return NewsLoaded(
        newsList: newsList ?? this.newsList,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax);
  }

  @override
  List<Object> get props => [newsList, hasReachedMax];
}
