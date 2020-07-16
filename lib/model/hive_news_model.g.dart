// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'hive_news_model.dart';

// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

// class HiveArticlesAdapter extends TypeAdapter<HiveArticles> {
//   @override
//   HiveArticles read(BinaryReader reader) {
//     var numOfFields = reader.readByte();
//     var fields = <int, dynamic>{
//       for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return HiveArticles(
//       source: fields[0] as Source,
//       author: fields[1] as String,
//       title: fields[2] as String,
//       content: fields[7] as String,
//       description: fields[3] as String,
//       publishedAt: fields[6] as String,
//       url: fields[4] as String,
//       urlToImage: fields[5] as String,
//     );
//   }

//   @override
//   void write(BinaryWriter writer, HiveArticles obj) {
//     writer
//       ..writeByte(8)
//       ..writeByte(0)
//       ..write(obj.source)
//       ..writeByte(1)
//       ..write(obj.author)
//       ..writeByte(2)
//       ..write(obj.title)
//       ..writeByte(3)
//       ..write(obj.description)
//       ..writeByte(4)
//       ..write(obj.url)
//       ..writeByte(5)
//       ..write(obj.urlToImage)
//       ..writeByte(6)
//       ..write(obj.publishedAt)
//       ..writeByte(7)
//       ..write(obj.content);
//   }
// }
