part of 'news_bloc.dart';

sealed class NewsState {}

sealed class NewsActionState extends NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoadingState extends NewsInitial {}

final class NewsSuccessesState extends NewsState {
  List<Articles>? newsData;
  NewsSuccessesState({this.newsData});
}

final class NewsErrorState extends NewsState {
  final String? error;
  NewsErrorState({this.error});
}
