import 'package:equatable/equatable.dart';

class SingleDayData extends Equatable{
  final DateTime date;
  final int value;

  const SingleDayData({
    this.date,
    this.value
  });

@override
  List<Object> get props => [
        date,
        value
      ];
}
