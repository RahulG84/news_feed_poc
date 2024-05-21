import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_feed_poc/model/news_data_model.dart';
import 'package:http/http.dart' as http;

import '../repo/news_services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<NewsFetchEvent>(newsFetchEvent);
    on<LoadMoreNewsEvent>(loadMoreNewsEvent);
    on<SearchNewsEvent>(searchNewsEvent);
  }

  bool isLoading = false;
  int loadNewsPerPage = 3;
  List<Articles> loadPosts = [];

  FutureOr<void> newsFetchEvent(
      NewsFetchEvent event, Emitter<NewsState> emit) async {
    try {
      emit(NewsLoadingState());
      final newsData = await ApiService.fetchNewsData(
        client: http.Client(),
        newsPerPage: loadNewsPerPage,
      );

      loadPosts.addAll(newsData);
      emit(NewsSuccessesState(newsData: loadPosts));
    } catch (error) {
      emit(NewsErrorState(error: error.toString()));
    }
  }

  Future<void> loadMoreNewsEvent(
      LoadMoreNewsEvent event, Emitter<NewsState> emit) async {
    try {
      isLoading = true;

      final newsData = await ApiService.fetchNewsData(
        client: http.Client(),
        newsPerPage: loadNewsPerPage,
        // 4 ~/ 2 + 1 = 3 so you are on page number 3 you want to load page number 3 so it automatically update the api call
        page: loadPosts.length ~/ loadNewsPerPage + 1,
      );

      loadNewsPerPage += 3;
      loadPosts.addAll(newsData);
      emit(NewsSuccessesState(newsData: loadPosts));
      print('after scroll post per load $loadNewsPerPage');
      print(loadPosts.length);

      isLoading = false;
    } catch (error) {
      emit(NewsErrorState(error: error.toString()));
    }
  }

  FutureOr<void> searchNewsEvent(
      SearchNewsEvent event, Emitter<NewsState> emit) async {
    try {
      final newsData = await ApiService.fetchNewsData(
        client: http.Client(),
      );

      final searchItemsList = newsData
          .where((element) =>
              element.title!.toLowerCase().contains(event.query!.toLowerCase()))
          .toList();

      emit(NewsSuccessesState(newsData: searchItemsList));
    } catch (error) {
      emit(NewsErrorState(error: error.toString()));
    }
  }
}
