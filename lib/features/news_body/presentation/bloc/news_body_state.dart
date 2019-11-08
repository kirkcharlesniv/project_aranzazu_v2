import 'package:equatable/equatable.dart';
import 'package:project_aranzazu_v2/features/news_body/model/built_news_body.dart';

abstract class NewsBodyState extends Equatable {
  const NewsBodyState();
}

class NewsBodyUninitialized extends NewsBodyState {
  @override
  List<Object> get props => [];
}

class NewsBodyError extends NewsBodyState {
  @override
  List<Object> get props => [];
}

class NewsBodyLoaded extends NewsBodyState {
  final BuiltNewsBody body;

  NewsBodyLoaded(this.body);

  @override
  List<Object> get props => [body];
}
