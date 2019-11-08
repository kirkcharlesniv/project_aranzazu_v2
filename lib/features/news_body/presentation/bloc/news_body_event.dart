import 'package:equatable/equatable.dart';

abstract class NewsBodyEvent extends Equatable {
  const NewsBodyEvent();
}

class FetchNewsBody extends NewsBodyEvent {
  final int id;
  FetchNewsBody(this.id);

  @override
  List<Object> get props => [id];
}
