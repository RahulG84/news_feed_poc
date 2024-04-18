import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feed_poc/bloc/news_bloc.dart';
import 'package:news_feed_poc/model/news_data_model.dart';
import 'package:news_feed_poc/news/widget/news_button.dart';
import 'package:news_feed_poc/news/widget/news_image.dart';
import 'package:news_feed_poc/news/widget/news_list.dart';
import 'package:news_feed_poc/news/widget/news_text.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsBloc newsBloc = NewsBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsBloc.add(NewsFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    String defaultImageUrl =
        'https://storage.googleapis.com/support-forums-api/attachment/thread-21250723-8795753597826717832.png';
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
            onPress: () {},
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
        listener: (context, state) {
          //
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case NewsLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case NewsSucessesState:
              final sucessesState = state as NewsSucessesState;
              return NewsList(
                itemCount: sucessesState.newsData?.articles?.length,
                itemWidget: (context, index) {
                  Articles? data = sucessesState.newsData!.articles?[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
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
                              imageUrl: data?.urlToImage ?? defaultImageUrl,
                              imageHeight:
                                  MediaQuery.of(context).size.height * 0.3,
                              imageWidth: MediaQuery.of(context).size.width * 1,
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
                          const SizedBox(
                            height: 10,
                          ),
                        ],
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
