// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 2;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      id: fields[0] as String?,
      title: fields[1] as String?,
      slug: fields[2] as String?,
      description: fields[3] as String?,
      quantity: fields[4] as num?,
      price: fields[5] as num?,
      priceAfterDiscount: fields[6] as num?,
      imageCover: fields[7] as String?,
      sold: fields[8] as num?,
      ratingsQuantity: fields[9] as num?,
      ratingsAverage: fields[10] as num?,
      images: (fields[11] as List?)?.cast<String>(),
      brand: fields[12] as Brand?,
      category: fields[13] as Category?,
      subcategory: (fields[14] as List?)?.cast<SubCategory>(),
      isFavorite: fields[15] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.priceAfterDiscount)
      ..writeByte(7)
      ..write(obj.imageCover)
      ..writeByte(8)
      ..write(obj.sold)
      ..writeByte(9)
      ..write(obj.ratingsQuantity)
      ..writeByte(10)
      ..write(obj.ratingsAverage)
      ..writeByte(11)
      ..write(obj.images)
      ..writeByte(12)
      ..write(obj.brand)
      ..writeByte(13)
      ..write(obj.category)
      ..writeByte(14)
      ..write(obj.subcategory)
      ..writeByte(15)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
