// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrandAdapter extends TypeAdapter<Brand> {
  @override
  final int typeId = 0;

  @override
  Brand read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Brand(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      imageUrl: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Brand obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
