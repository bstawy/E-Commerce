// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubCategoryAdapter extends TypeAdapter<SubCategory> {
  @override
  final int typeId = 3;

  @override
  SubCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCategory(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      categoryId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SubCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
