import 'dart:math';
import 'package:meta/meta.dart';
import 'package:najot_talim_nt/utils/serializable.dart';
import 'point.dart';

@immutable
class Chip implements Serializable {
  /// Unique identifier of a chip, starts
  /// from a zero.
  final int number;

  final Point<int> targetPoint;

  final Point<int> currentPoint;

  const Chip(
    this.number,
    this.targetPoint,
    this.currentPoint,
  );

  Chip move(Point<int> point) => Chip(number, targetPoint, point);

  @override
  void serialize(SerializeOutput output) {
    output.writeInt(number);
    output.writeSerializable(PointSerializableWrapper(targetPoint) as Serializable);
    output.writeSerializable(PointSerializableWrapper(currentPoint) as Serializable);
  }
}

class ChipDeserializableFactory extends DeserializableHelper<Chip> {
  const ChipDeserializableFactory() : super();

  @override
  Chip deserialize(SerializeInput input) {
    const pd = PointDeserializableFactory();

    final number = input.readInt() ?? -1;
    final targetPoint = input.readDeserializable(pd as DeserializableHelper)!;
    final currentPoint = input.readDeserializable(pd as DeserializableHelper)!;
    return Chip(number, targetPoint, currentPoint);
  }
}
