part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

sealed class NewsActionState extends NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsInitial {}

final class NewsSucessesState extends NewsState {
  List<Articles>? newsData;
  NewsSucessesState({this.newsData});
}

final class NewsErrorState extends NewsState {
  final String? error;
  NewsErrorState({this.error});
}
