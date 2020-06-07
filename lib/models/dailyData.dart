import 'package:equatable/equatable.dart';

class DailyData extends Equatable {
  final DateTime date;
  final int totalConfirmed;
  final int totalActive;
  final int totalRecovered;
  final int totalDeaths;
  final int dailyConfirmed;
  final int dailyActive;
  final int dailyRecovered;
  final int dailyDeaths;

  const DailyData({
    this.date,
    this.totalActive,
    this.totalConfirmed,
    this.totalDeaths,
    this.totalRecovered,
    this.dailyActive,
    this.dailyConfirmed,
    this.dailyDeaths,
    this.dailyRecovered,
  });

  static DailyData fromJson(dynamic json, DateTime date) {
    int totalActive = int.parse(json['totalconfirmed']) -
        int.parse(json['totaldeceased']) -
        int.parse(json['totalrecovered']);
    int dailyActive = int.parse(json['dailyconfirmed']) -
        int.parse(json['dailydeceased']) -
        int.parse(json['dailyrecovered']);
    return DailyData(
        date: date,
        totalConfirmed: int.parse(json['totalconfirmed']),
        totalDeaths: int.parse(json['totaldeceased']),
        totalRecovered: int.parse(json['totalrecovered']),
        totalActive: totalActive,
        dailyConfirmed: int.parse(json['dailyconfirmed']),
        dailyDeaths: int.parse(json['dailydeceased']),
        dailyRecovered: int.parse(json['dailyrecovered']),
        dailyActive: dailyActive);
  }

  @override
  List<Object> get props => [
        totalActive,
        totalConfirmed,
        totalDeaths,
        totalRecovered,
        dailyActive,
        dailyConfirmed,
        dailyDeaths,
        dailyRecovered,
        date
      ];
}
