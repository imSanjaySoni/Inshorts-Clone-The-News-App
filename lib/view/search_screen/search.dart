import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshort_clone/bloc/serach_feed/search_feed_bloc.dart';
import 'package:inshort_clone/bloc/serach_feed/search_feed_event.dart';
import 'package:inshort_clone/bloc/serach_feed/search_feed_state.dart';
import 'package:inshort_clone/style/text_style.dart';
import 'package:inshort_clone/view/search_screen/widget/search_news_card.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).cardColor,
          title: TextField(
            autofocus: true,
            controller: _searchController,
            textInputAction: TextInputAction.search,
            style: AppTextStyle.searchbar,
            decoration: InputDecoration(
              hintText: "Search for news",
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(
                  FeatherIcons.x,
                ),
                onPressed: () => _searchController.clear(),
              ),
              hintStyle: AppTextStyle.searchbar.copyWith(),
            ),
            onSubmitted: (s) {
              BlocProvider.of<SearchFeedBloc>(context)
                ..add(
                    FetchNewsBySearchQueryEvent(query: _searchController.text));
            },
          ),
          leading: IconButton(
            icon: Icon(
              FeatherIcons.arrowLeft,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: BlocBuilder<SearchFeedBloc, SearchFeedState>(
          builder: (context, state) {
            if (state is SearchFeedInitialState) {
              return Container();
            } else if (state is SearchFeedLoadingState) {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text(
                      "Loading Shots..",
                      style: AppTextStyle.searchbar,
                    )
                  ]));
            } else if (state is SearchFeedLoadedState) {
              if (state.news.length == 0) {
                return Center(
                    child: Text(
                  "Nothing Found ! \n",
                  style: AppTextStyle.newsTitle,
                ));
              }
              return ListView.builder(
                itemCount: state.news.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return SearchNewsCard(
                    articles: state.news,
                    index: index,
                  );
                },
              );
            } else if (state is SearchFeedErrorState) {
              return Container(
                padding: const EdgeInsets.all(16),
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No Internet Connection!",
                      style: AppTextStyle.newsTitle,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Please check your internet connection and retry!",
                      style: AppTextStyle.searchbar,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
