// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CurrencyEntityAdapter extends TypeAdapter<CurrencyEntity> {
  @override
  final int typeId = 0;

  @override
  CurrencyEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CurrencyEntity(
      countryName: fields[0] as String,
      countryCode: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CurrencyEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.countryName)
      ..writeByte(1)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrencyEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
