// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesAdapter extends TypeAdapter<Articles> {
  @override
  Articles read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Articles(
      sourceName: fields[0] as String,
      author: fields[1] as String,
      title: fields[2] as String,
      description: fields[3] as String,
      url: fields[4] as String,
      urlToImage: fields[5] as String,
      publishedAt: fields[6] as String,
      content: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Articles obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.sourceName)
      ..writeByte(1)
      ..write(obj.author)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.url)
      ..writeByte(5)
      ..write(obj.urlToImage)
      ..writeByte(6)
      ..write(obj.publishedAt)
      ..writeByte(7)
      ..write(obj.content);
  }

  @override
  int get typeId => 101;
}
