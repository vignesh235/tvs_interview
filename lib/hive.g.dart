// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TouristAdapter extends TypeAdapter<Tourist> {
  @override
  final int typeId = 0;

  @override
  Tourist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Tourist(
      id: fields[0] as int,
      touristName: fields[1] as String,
      touristEmail: fields[2] as String,
      touristLocation: fields[3] as String,
      createdAt: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Tourist obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.touristName)
      ..writeByte(2)
      ..write(obj.touristEmail)
      ..writeByte(3)
      ..write(obj.touristLocation)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TouristAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
