// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notify _$NotifyFromJson(Map<String, dynamic> json) => Notify(
      objectId: json['objectId'] as String?,
      title: json['title'] as String?,
      message: json['message'] as String?,
      image: json['image'] as String?,
      views: json['views'] as int?,
      enable: json['enable'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$NotifyToJson(Notify instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objectId', instance.objectId);
  writeNotNull('title', instance.title);
  writeNotNull('message', instance.message);
  writeNotNull('image', instance.image);
  writeNotNull('views', instance.views);
  writeNotNull('enable', instance.enable);
  writeNotNull('createdAt', instance.createdAt);
  writeNotNull('updatedAt', instance.updatedAt);
  return val;
}
