// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fruit_salad_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FruitSaladAdapter extends TypeAdapter<FruitSalad> {
  @override
  final int typeId = 0;

  @override
  FruitSalad read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FruitSalad(
      productId: fields[3] as String,
      color: fields[5] as int,
      categories: (fields[6] as List).cast<String>(),
      price: fields[2] as int,
      name: fields[0] as String,
      imageUrl: fields[1] as String,
      quantity: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FruitSalad obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imageUrl)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.productId)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.categories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FruitSaladAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
