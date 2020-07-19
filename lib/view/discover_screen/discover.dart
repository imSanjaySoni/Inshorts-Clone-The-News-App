import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_event.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/view/discover_screen/widgets/category_card.dart';
import 'package:inshort_clone/view/discover_screen/widgets/headline.dart';
import 'package:inshort_clone/view/discover_screen/widgets/topics_card.dart';
import 'package:provider/provider.dart';

import 'widgets/app_bar.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  var bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<NewsFeedBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    provider.setAppBarVisible(true);

    return Scaffold(
      appBar: appSearchBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            headLine("CATEGORIES"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<FeedProvider>(
                  builder: (context, value, child) => Row(
                    children: <Widget>[
                      CategoryCard(
                        title: "MY FEED",
                        icon: "all",
                        active: provider.getActiveCategory == 1,
                        onTap: () {
                          provider.setActiveCategory(1);
                          provider.setAppBarTitle("My Feed");

                          bloc.add(
                            FetchNewsByCategoryEvent(category: "general"),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "TRENDING",
                        icon: "trending",
                        active: provider.getActiveCategory == 2,
                        onTap: () {
                          provider.setActiveCategory(2);
                          provider.setAppBarTitle("Trending");

                          bloc.add(
                            FetchNewsByTopicEvent(topic: "trending"),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "BOOKMARKS",
                        icon: "bookmark",
                        active: provider.getActiveCategory == 3,
                        onTap: () {
                          provider.setActiveCategory(3);
                          provider.setAppBarTitle("Bookmarks");

                          bloc.add(
                            FetchNewsFromLocalStorageEvent(box: 'bookmarks'),
                          );
                        },
                      ),
                      CategoryCard(
                        title: "UNREAD",
                        icon: "unread",
                        active: provider.getActiveCategory == 4,
                        onTap: () {
                          provider.setActiveCategory(4);
                          provider.setAppBarTitle("Unread");

                          bloc.add(
                            FetchNewsFromLocalStorageEvent(box: 'unreads'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            headLine("SUGGESTED TOPICS"),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 1.4),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: <Widget>[
                  TopicCard(
                    title: "Coronavirus",
                    icon: "coronavirus",
                    onTap: () {
                      provider.setAppBarTitle("Coronavirus");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "coronavirus"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "India",
                    icon: "india",
                    onTap: () {
                      provider.setAppBarTitle("India");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "india"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Business",
                    icon: "business",
                    onTap: () {
                      provider.setAppBarTitle("Business");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "business"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Politics",
                    icon: "politics",
                    onTap: () {
                      provider.setAppBarTitle("Politics");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "politics"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Sports",
                    icon: "sports",
                    onTap: () {
                      provider.setAppBarTitle("Sports");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Technology",
                    icon: "technology",
                    onTap: () {
                      provider.setAppBarTitle("Technology");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "technology"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Statups",
                    icon: "startups",
                    onTap: () {
                      provider.setAppBarTitle("Statups");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "startups"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Entertainment",
                    icon: "entertainment",
                    onTap: () {
                      provider.setAppBarTitle("Entertainment");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "entertainment"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Education",
                    icon: "education",
                    onTap: () {
                      provider.setAppBarTitle("Education");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "education"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Automobile",
                    icon: "automobile",
                    onTap: () {
                      provider.setAppBarTitle("Automobile");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "automobile"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Science",
                    icon: "science",
                    onTap: () {
                      provider.setAppBarTitle("Science");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "science"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Travel",
                    icon: "travel",
                    onTap: () {
                      provider.setAppBarTitle("Travel");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "travel"),
                      );
                    },
                  ),
                  TopicCard(
                    title: "Fashion",
                    icon: "fashion",
                    onTap: () {
                      provider.setAppBarTitle("Fashion");
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "fashion"),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
