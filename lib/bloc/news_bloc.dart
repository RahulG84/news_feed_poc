import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_feed_poc/model/news_data_model.dart';
import 'package:news_feed_poc/utils/news_services.dart';
import 'package:http/http.dart' as http;

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsFetchEvent>(newsFetchEvent);
    on<LoadMoreNewsEvent>(loadMoreNewsEvent);
  }

  bool isLoading = false;
  int loadNewsPerPage = 3;
  List<Articles> loadPosts = [];

  FutureOr<void> newsFetchEvent(
      NewsFetchEvent event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoadingState());
      print('object');
      final newsData = await ApiService.fetchNewsData(
        client: http.Client(),
        newsPerPage: loadNewsPerPage,
      );
      print('Received news data: $newsData');
      loadPosts.addAll(newsData);
      emit(NewsSucessesState(newsData: loadPosts));
      print(loadPosts.length);
      print(loadPosts.map((e) => e.title));
    } catch (error) {
      emit(NewsErrorState(error: error.toString()));
      print(error.toString());
    }
  }

  Future<void> loadMoreNewsEvent(
      LoadMoreNewsEvent event, Emitter<NewsState> emit) async {
    try {
      isLoading = true;
      final newsData = await ApiService.fetchNewsData(
        client: http.Client(),
        newsPerPage: loadNewsPerPage,
      );
      print(newsData.length);
      loadNewsPerPage += 3;
      loadPosts.addAll(newsData);
      emit(NewsSucessesState(newsData: loadPosts));
      print(loadPosts.length);
      print(loadPosts.map((e) => e.author));
      isLoading = false;

    } catch (error) {
      emit(NewsErrorState(error: error.toString()));
      isLoading = false;
    }
  }
}
