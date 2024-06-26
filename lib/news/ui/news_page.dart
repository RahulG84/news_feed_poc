import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed_poc/bloc/news_bloc.dart';
import 'package:news_feed_poc/news/ui/news_details_page.dart';
import 'package:news_feed_poc/news/ui/search_page.dart';
import 'package:news_feed_poc/news/widget/news_button.dart';
import 'package:news_feed_poc/news/widget/news_image.dart';
import 'package:news_feed_poc/news/widget/news_list.dart';
import 'package:news_feed_poc/news/widget/news_text.dart';
import 'package:news_feed_poc/utils/constants.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ScrollController scrollController = ScrollController();
  NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    super.initState();
    newsBloc.add(NewsFetchEvent());
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!newsBloc.isLoading) {
        newsBloc.add(LoadMoreNewsEvent());
      }
    }
  }

  // void _scrollListener() {
  //   final thresholdScroll = scrollController.position.maxScrollExtent * 0.70;
  //   print(
  //       'threshold :  $thresholdScroll , currentScroll : ${scrollController.position.pixels}');
  //   if (scrollController.position.pixels >= thresholdScroll) {
  //     if (!newsBloc.isLoading) {
  //       newsBloc.add(LoadMoreNewsEvent());
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: NewsText(
          title: 'Breaking News',
          fontWeight: FontWeight.w500,
          textColor: Colors.black,
        ),
        backgroundColor: Colors.cyanAccent,
        actions: [
          NewsButton(
            icon: const Icon(Icons.search),
            onPress: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            ),
            iconColor: Colors.black,
          ),
          NewsButton(
            icon: const Icon(Icons.notifications),
            onPress: () {},
            iconColor: Colors.black,
          ),
        ],
      ),
      drawer: const Drawer(),
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
              return RefreshIndicator(
                onRefresh: () =>   Future.delayed(const Duration(seconds: 2)),
                child: Column(
                  children: [
                    Expanded(
                      child: NewsList(
                        controller: scrollController,
                        itemCount: newsBloc.hasMoreData
                            ? successesState.newsData!.length
                            : successesState.newsData!.length + 1,
                        itemWidget: (context, index) {
                          // newsData.length is 3     //index 0,1,2
                          if (index < successesState.newsData!.length) {
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
                                          imageHeight: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          imageWidth: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1,
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
                                            title: data?.author ??
                                                "Unknown Author",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.end,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),

                                      // const SizedBox(
                                      //   height: 10,
                                      // ),
                                      // ? or late --> This case we declare the variable as a null values
                                      // ! --> this  case is used when we don't  the value of name but it available at run-time
                                      // Text(loadingDataLength.toString()),
                                      // Text(index.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: NewsText(
                                  title: 'No more items to load',
                                  fontSize: 16,
                                  textColor: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    if (newsBloc.isLoading) const CircularProgressIndicator(),
                  ],
                ),
              );
            case NewsErrorState:
              final errorState = state as NewsErrorState;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: NewsText(
                  title: errorState.error,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  textColor: Colors.black,
                ),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
