// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:inshort_clone/aplication_localization.dart';
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_event.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/view/discover_screen/widgets/category_card.dart';
import 'package:inshort_clone/view/discover_screen/widgets/headline.dart';
import 'package:inshort_clone/view/discover_screen/widgets/topics_card.dart';
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
      appBar: appSearchBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            headLine(AppLocalizations.of(context).translate("categories")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Consumer<FeedProvider>(
                  builder: (context, value, child) => Row(
                    children: <Widget>[
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("my_feed"),
                        icon: "all",
                        active: provider.getActiveCategory == 1,
                        onTap: () {
                          provider.setActiveCategory(1);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("my_feed"));

                          bloc.add(
                            FetchNewsByCategoryEvent(category: "general"),
                          );
                        },
                      ),
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("trending"),
                        icon: "trending",
                        active: provider.getActiveCategory == 2,
                        onTap: () {
                          provider.setActiveCategory(2);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("trending"));

                          bloc.add(
                            FetchNewsByTopicEvent(topic: "trending"),
                          );
                        },
                      ),
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("bookmark"),
                        icon: "bookmark",
                        active: provider.getActiveCategory == 3,
                        onTap: () {
                          provider.setActiveCategory(3);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("bookmark"));

                          bloc.add(
                            FetchNewsFromLocalStorageEvent(box: 'bookmarks'),
                          );
                        },
                      ),
                      CategoryCard(
                        title:
                            AppLocalizations.of(context).translate("unreads"),
                        icon: "unread",
                        active: provider.getActiveCategory == 4,
                        onTap: () {
                          provider.setActiveCategory(4);
                          provider.setAppBarTitle(AppLocalizations.of(context)
                              .translate("unreads"));

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
            headLine(AppLocalizations.of(context).translate("sugested_topics")),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 1.4),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: <Widget>[
                  TopicCard(
                    title:
                        AppLocalizations.of(context).translate("coronavirus"),
                    icon: "coronavirus",
                    onTap: () {
                      provider.setAppBarTitle(AppLocalizations.of(context)
                          .translate("coronavirus"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "coronavirus"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("india"),
                    icon: "india",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("india"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "india"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("business"),
                    icon: "business",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("business"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "business"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("politics"),
                    icon: "politics",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("politics"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "politics"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("sports"),
                    icon: "sports",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("sports"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "sports"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("technology"),
                    icon: "technology",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("technology"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "technology"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("startups"),
                    icon: "startups",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("startups"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "startups"),
                      );
                    },
                  ),
                  TopicCard(
                    title:
                        AppLocalizations.of(context).translate("entertainment"),
                    icon: "entertainment",
                    onTap: () {
                      provider.setAppBarTitle(AppLocalizations.of(context)
                          .translate("entertainment"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "entertainment"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("education"),
                    icon: "education",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("education"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "education"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("automobile"),
                    icon: "automobile",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("automobile"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "automobile"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("science"),
                    icon: "science",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("science"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByCategoryEvent(category: "science"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("travel"),
                    icon: "travel",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("travel"));
                      FeedController.addCurrentPage(1);
                      bloc.add(
                        FetchNewsByTopicEvent(topic: "travel"),
                      );
                    },
                  ),
                  TopicCard(
                    title: AppLocalizations.of(context).translate("fashion"),
                    icon: "fashion",
                    onTap: () {
                      provider.setAppBarTitle(
                          AppLocalizations.of(context).translate("fashion"));
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
