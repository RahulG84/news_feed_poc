part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsFetchEvent extends NewsEvent {}

final class LoadMoreNewsEvent extends NewsEvent {}
