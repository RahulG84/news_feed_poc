import 'package:flutter/material.dart';
import 'package:news_feed_poc/utils/constants.dart';

import '../../model/news_data_model.dart';
import '../widget/news_button.dart';
import '../widget/news_image.dart';
import '../widget/news_list.dart';
import '../widget/news_text.dart';

class NewsDetailsPage extends StatefulWidget {
  final List<Articles>? newsList;
  const NewsDetailsPage({super.key, this.newsList});

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
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
        body: NewsList(
          itemCount: widget.newsList!.length,
          itemWidget: (context, index) {
            // newsData.length is 3     //index 0,1,2
            dynamic data = widget.newsList?[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                //elevation: 10,
                // shadowColor: Colors.teal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10.00),
                        topRight: Radius.circular(10.00),
                      ),
                      child: NewsImage(
                        imageUrl: data?.urlToImage ?? Constants.defaultImageUrl,
                        imageHeight: MediaQuery.of(context).size.height * 0.3,
                        imageWidth: MediaQuery.of(context).size.width * 1,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, left: 10),
                            color: Colors.orange,
                            height: 25,
                            width: 70,
                            child: const Text(
                              'Business',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 10),
                          child: NewsText(
                            title: Constants.formatDate(data?.publishedAt),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.00,
                        vertical: 10.00,
                      ),
                      child: NewsText(
                        title: data?.title,
                        textAlign: TextAlign.start,
                        textColor: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.00,
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: NewsText(
                              title: data?.source.name,
                              textAlign: TextAlign.start,
                              textColor: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Icon(
                            Icons.verified,
                            color: Colors.blueAccent,
                          ),
                        ],
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.00,
                        vertical: 10.00,
                      ),
                      child: NewsText(
                        title: data?.content ?? '',
                        textAlign: TextAlign.start,
                        fontSize: 14,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const ClipOval(
                              child: Icon(Icons.person,
                                  size: 40, color: Colors.deepOrangeAccent),
                            ),
                            NewsText(
                              title: data?.author ?? "Unknown Author",
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              textAlign: TextAlign.end,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
