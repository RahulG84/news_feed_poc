import 'package:flutter/material.dart';
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
  List<Map<String, dynamic>> sampleArticles = [
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "insider@insider.com (Alistair Barr)",
      "title": "Tesla's US market share grows through the EV carnage",
      "description":
          "Despite a long list of recent setbacks, Tesla has outpaced all competitors in the US electric vehicle market lately.",
      "url":
          "https://www.businessinsider.com/tesla-market-share-grows-through-ev-carnage-2024-4",
      "urlToImage":
          "https://i.insider.com/6544eadbb788914e554f84ff?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Lately, it feels like almost everything is going wrong for Tesla and its CEO Elon Musk.\r\nHowever, there's some surprisingly good news buried in the carnage of the electric vehicle market.\r\nTesla's US… [+1545 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "grapier@businessinsider.com (Graham Rapier)",
      "title": "Tesla is stuck in the mud",
      "description":
          "Tesla's sales slump and massive layoffs have ratcheted up the pressure on CEO Elon Musk and his robotaxi promise.",
      "url":
          "https://www.businessinsider.com/tesla-rough-year-sales-slump-layoffs-china-ev-competition-2024-4",
      "urlToImage":
          "https://i.insider.com/661eb3a410c6b0cde5effdc1?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Tesla is in full-blown cost-cutting mode.\r\nAfter releasing a disastrous first-quarter sales report this month, CEO Elon Musk announced the company would reveal a long-awaited robotaxi in August. \r\nBu… [+4085 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "insider@insider.com (Alistair Barr)",
      "title": "Tesla's US market share grows through the EV carnage",
      "description":
          "Despite a long list of recent setbacks, Tesla has outpaced all competitors in the US electric vehicle market lately.",
      "url":
          "https://www.businessinsider.com/tesla-market-share-grows-through-ev-carnage-2024-4",
      "urlToImage":
          "https://i.insider.com/6544eadbb788914e554f84ff?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Lately, it feels like almost everything is going wrong for Tesla and its CEO Elon Musk.\r\nHowever, there's some surprisingly good news buried in the carnage of the electric vehicle market.\r\nTesla's US… [+1545 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "grapier@businessinsider.com (Graham Rapier)",
      "title": "Tesla is stuck in the mud",
      "description":
          "Tesla's sales slump and massive layoffs have ratcheted up the pressure on CEO Elon Musk and his robotaxi promise.",
      "url":
          "https://www.businessinsider.com/tesla-rough-year-sales-slump-layoffs-china-ev-competition-2024-4",
      "urlToImage":
          "https://i.insider.com/661eb3a410c6b0cde5effdc1?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Tesla is in full-blown cost-cutting mode.\r\nAfter releasing a disastrous first-quarter sales report this month, CEO Elon Musk announced the company would reveal a long-awaited robotaxi in August. \r\nBu… [+4085 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "insider@insider.com (Alistair Barr)",
      "title": "Tesla's US market share grows through the EV carnage",
      "description":
          "Despite a long list of recent setbacks, Tesla has outpaced all competitors in the US electric vehicle market lately.",
      "url":
          "https://www.businessinsider.com/tesla-market-share-grows-through-ev-carnage-2024-4",
      "urlToImage":
          "https://i.insider.com/6544eadbb788914e554f84ff?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Lately, it feels like almost everything is going wrong for Tesla and its CEO Elon Musk.\r\nHowever, there's some surprisingly good news buried in the carnage of the electric vehicle market.\r\nTesla's US… [+1545 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "grapier@businessinsider.com (Graham Rapier)",
      "title": "Tesla is stuck in the mud",
      "description":
          "Tesla's sales slump and massive layoffs have ratcheted up the pressure on CEO Elon Musk and his robotaxi promise.",
      "url":
          "https://www.businessinsider.com/tesla-rough-year-sales-slump-layoffs-china-ev-competition-2024-4",
      "urlToImage":
          "https://i.insider.com/661eb3a410c6b0cde5effdc1?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Tesla is in full-blown cost-cutting mode.\r\nAfter releasing a disastrous first-quarter sales report this month, CEO Elon Musk announced the company would reveal a long-awaited robotaxi in August. \r\nBu… [+4085 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "insider@insider.com (Alistair Barr)",
      "title": "Tesla's US market share grows through the EV carnage",
      "description":
          "Despite a long list of recent setbacks, Tesla has outpaced all competitors in the US electric vehicle market lately.",
      "url":
          "https://www.businessinsider.com/tesla-market-share-grows-through-ev-carnage-2024-4",
      "urlToImage":
          "https://i.insider.com/6544eadbb788914e554f84ff?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Lately, it feels like almost everything is going wrong for Tesla and its CEO Elon Musk.\r\nHowever, there's some surprisingly good news buried in the carnage of the electric vehicle market.\r\nTesla's US… [+1545 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "grapier@businessinsider.com (Graham Rapier)",
      "title": "Tesla is stuck in the mud",
      "description":
          "Tesla's sales slump and massive layoffs have ratcheted up the pressure on CEO Elon Musk and his robotaxi promise.",
      "url":
          "https://www.businessinsider.com/tesla-rough-year-sales-slump-layoffs-china-ev-competition-2024-4",
      "urlToImage":
          "https://i.insider.com/661eb3a410c6b0cde5effdc1?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Tesla is in full-blown cost-cutting mode.\r\nAfter releasing a disastrous first-quarter sales report this month, CEO Elon Musk announced the company would reveal a long-awaited robotaxi in August. \r\nBu… [+4085 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "insider@insider.com (Alistair Barr)",
      "title": "Tesla's US market share grows through the EV carnage",
      "description":
          "Despite a long list of recent setbacks, Tesla has outpaced all competitors in the US electric vehicle market lately.",
      "url":
          "https://www.businessinsider.com/tesla-market-share-grows-through-ev-carnage-2024-4",
      "urlToImage":
          "https://i.insider.com/6544eadbb788914e554f84ff?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Lately, it feels like almost everything is going wrong for Tesla and its CEO Elon Musk.\r\nHowever, there's some surprisingly good news buried in the carnage of the electric vehicle market.\r\nTesla's US… [+1545 chars]"
    },
    {
      "source": {"id": "business-insider", "name": "Business Insider"},
      "author": "grapier@businessinsider.com (Graham Rapier)",
      "title": "Tesla is stuck in the mud",
      "description":
          "Tesla's sales slump and massive layoffs have ratcheted up the pressure on CEO Elon Musk and his robotaxi promise.",
      "url":
          "https://www.businessinsider.com/tesla-rough-year-sales-slump-layoffs-china-ev-competition-2024-4",
      "urlToImage":
          "https://i.insider.com/661eb3a410c6b0cde5effdc1?width=1200&format=jpeg",
      "publishedAt": "2024-04-17T09:00:01Z",
      "content":
          "Tesla is in full-blown cost-cutting mode.\r\nAfter releasing a disastrous first-quarter sales report this month, CEO Elon Musk announced the company would reveal a long-awaited robotaxi in August. \r\nBu… [+4085 chars]"
    },
  ];

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
      drawer: const Drawer(),
      body: NewsList(
        itemCount: sampleArticles.length,
        itemWidget: (context, index) {
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
                      imageUrl: sampleArticles[index]['urlToImage'],
                      imageHeight: MediaQuery.of(context).size.height * 0.3,
                      imageWidth: MediaQuery.of(context).size.width * 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.00,
                      vertical: 5.00,
                    ),
                    child: NewsText(
                      title: sampleArticles[index]['title'],
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
                      title: sampleArticles[index]['description'],
                      textAlign: TextAlign.start,
                      fontSize: 14,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NewsText(
                        title: sampleArticles[index]['author'],
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
      ),
    );
  }
}
