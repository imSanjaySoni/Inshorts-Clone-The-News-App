import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/serach_feed/search_feed_bloc.dart';
import 'package:inshort_clone/controller/theme.dart';
import 'package:inshort_clone/routes/routes.gr.dart';
import 'package:inshort_clone/services/news/news_service.dart';
import 'package:inshort_clone/style/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //

    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsFeedBloc>(
          create: (context) =>
              NewsFeedBloc(repository: NewsFeedRepositoryImpl(context)),
        ),
        BlocProvider<SearchFeedBloc>(
          create: (context) =>
              SearchFeedBloc(repository: NewsFeedRepositoryImpl(context)),
        ),
      ],
      //

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Inshorts Clone",
        theme: kLightThemeData,
        darkTheme: kDarkThemeData,
        themeMode:
            Provider.of<ThemeProvider>(context, listen: true).isDarkThemeOn
                ? ThemeMode.dark
                : ThemeMode.light,
        onGenerateRoute: Router.onGenerateRoute,
        navigatorKey: Router.navigatorKey,
      ),
    );

    //
  }
}
