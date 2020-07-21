import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:permission_handler/permission_handler.dart';

final Box<Articles> bookmarksBox = Hive.box('bookmarks');
final Box<Articles> unreadsBox = Hive.box('unreads');

void handleBookmarks(Articles article) async {

  await Permission.storage.request().then((value) {
    if(value == PermissionStatus.granted){
      final bool isPresent = bookmarksBox.containsKey(article.url);

      if (!isPresent) {
        bookmarksBox.put(article.url, article);
        print(bookmarksBox.length);
        Fluttertoast.showToast(
          msg: 'Added to Bookmark',
          backgroundColor: Colors.black,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 3,
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        bookmarksBox.delete(article.url);
        print(bookmarksBox.length);

        Fluttertoast.showToast(
          msg: 'Removed from Bookmarks',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          timeInSecForIosWeb: 3,
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    }else if(value == PermissionStatus.permanentlyDenied){
      Fluttertoast.showToast(
          msg:
          "Storage Permission is required \n please allow from app settings.",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Colors.white
      );
      openAppSettings();
    }
  });

}

void addArticlesToUnreads(List<Articles> articles) async{
 await Permission.storage.request().then((value) {
   if(value == PermissionStatus.granted){
     articles.forEach((element) {
       if (!unreadsBox.containsKey(element.url)) {
         unreadsBox.put(element.url, element);
         print('added' + "${unreadsBox.length}");
       }
     });
   }else if(value == PermissionStatus.permanentlyDenied){
     Fluttertoast.showToast(
       msg:
       "Storage Permission is required \n please allow from app settings.",
       toastLength: Toast.LENGTH_LONG,
       backgroundColor: Colors.white
     );
     openAppSettings();
   }
 });
}

void removeArticleFromUnreads(Articles articles) {
  if (unreadsBox.containsKey(articles.url)) {
    unreadsBox.delete(articles.url);
    print('removed' + "${unreadsBox.length}");
  }
}
