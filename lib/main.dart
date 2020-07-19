import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/controller/theme.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docPath = await getApplicationDocumentsDirectory();

  Hive.init(docPath.path);
  Hive.registerAdapter(ArticlesAdapter());

  await Hive.openBox('themeMode');
  await Hive.openBox<Articles>('bookmarks');
  await Hive.openBox<Articles>('unreads');

  final _isDarkModeOn = await Hive.box('themeMode').get('isDarkModeOn');
  ThemeProvider().darkTheme(_isDarkModeOn ?? false);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<FeedProvider>(create: (_) => FeedProvider()),
      ],
      child: App(),
    ),
  );
}
