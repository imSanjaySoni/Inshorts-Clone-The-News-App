// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/controller/settings.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final docPath = await getApplicationDocumentsDirectory();

  Hive.init(docPath.path);
  Hive.registerAdapter(ArticlesAdapter());

  await Hive.openBox('settingsBox');
  await Hive.openBox<Articles>('bookmarks');
  await Hive.openBox<Articles>('unreads');

  final _isDarkModeOn = await Hive.box('settingsBox').get('isDarkModeOn');
  SettingsProvider().darkTheme(_isDarkModeOn ?? false);

  final _lang = await Hive.box('settingsBox').get('activeLang');
  SettingsProvider().setLang(_lang);

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
        ChangeNotifierProvider<SettingsProvider>(
            create: (_) => SettingsProvider()),
        ChangeNotifierProvider<FeedProvider>(create: (_) => FeedProvider()),
      ],
      child: App(),
    ),
  );
}
