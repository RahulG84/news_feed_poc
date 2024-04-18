part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

final class NewsFetchEvent extends NewsEvent {}
