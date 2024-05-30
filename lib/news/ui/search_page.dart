import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed_poc/bloc/news_bloc.dart';
import 'package:news_feed_poc/news/widget/news_list.dart';
import '../../utils/constants.dart';
import '../widget/news_image.dart';
import '../widget/news_text.dart';
import 'news_details_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  NewsBloc newsBloc = NewsBloc();

  void onQuerySubmit(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
    newsBloc.add(SearchNewsEvent(query: searchQuery));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white70,
        title: Container(
          margin: const EdgeInsets.only(bottom: 10),
          height: 50,
          width: 450,
          child: TextField(
            onSubmitted: (value) => onQuerySubmit(value),
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.symmetric(vertical: 7),
            ),
          ),
        ),
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        bloc: newsBloc,
        listenWhen: (previous, current) => current is NewsActionState,
        buildWhen: (previous, current) => current is! NewsActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case NewsLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NewsSuccessesState:
              final successesState = state as NewsSuccessesState;
              return successesState.newsData!.isEmpty
                  ? const Center(
                      child: Text(
                      'Please Enter Correct Title',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ))
                  : NewsList(
                      itemCount: successesState.newsData?.length,
                      itemWidget: (context, index) {
                        dynamic data = successesState.newsData?[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailsPage(
                                  newsList: [data],
                                ),
                              ),
                            ),
                            child: Card(
                              elevation: 10,
                              shadowColor: Colors.teal,
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10.00),
                                      topRight: Radius.circular(10.00),
                                    ),
                                    child: NewsImage(
                                      imageUrl: data?.urlToImage ??
                                          Constants.defaultImageUrl,
                                      imageHeight:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      imageWidth:
                                          MediaQuery.of(context).size.width * 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.00,
                                      vertical: 5.00,
                                    ),
                                    child: NewsText(
                                      title: data?.title,
                                      textAlign: TextAlign.start,
                                      textColor: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.00,
                                      vertical: 5.00,
                                    ),
                                    child: NewsText(
                                      title: data?.description ?? '',
                                      textAlign: TextAlign.start,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: NewsText(
                                        title: data?.author ?? "Unknown Author",
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        textAlign: TextAlign.end,
                                        textOverflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
