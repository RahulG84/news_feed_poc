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
  }

  FutureOr<void> newsFetchEvent(
      NewsFetchEvent event, Emitter<NewsState> emit) async {
    try {
      final newsData = await ApiService.fetchNewsData(client: http.Client());
      emit(NewsSucessesState(newsData: newsData));
      //print(newsData.articles?.map((e) => e.description));
    } catch (error) {
      emit(NewsErrorState(error: error.toString()));
      //print(error.toString());
    }
  }
}
