// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Draft _$DraftFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'objectId',
      'book',
      'songno',
      'title',
      'alias',
      'content',
      'key',
      'author',
      'views',
      'createdAt',
      'updatedAt'
    ],
  );
  return Draft(
    objectId: json['objectId'] as String?,
    book: json['book'] as int?,
    songno: json['songno'] as int?,
    title: json['title'] as String?,
    alias: json['alias'] as String?,
    content: json['content'] as String?,
    key: json['key'] as String?,
    author: json['author'] as String?,
    views: json['views'] as int?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    liked: json['liked'] as bool?,
    id: json['id'] as int?,
  );
}

Map<String, dynamic> _$DraftToJson(Draft instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  writeNotNull('book', instance.book);
  writeNotNull('songno', instance.songno);
  writeNotNull('title', instance.title);
  writeNotNull('alias', instance.alias);
  writeNotNull('content', instance.content);
  writeNotNull('key', instance.key);
  writeNotNull('author', instance.author);
  writeNotNull('views', instance.views);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  writeNotNull('liked', instance.liked);
  writeNotNull('id', instance.id);
  return val;
}
