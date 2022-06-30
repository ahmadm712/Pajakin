import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:pajakin/utils/styles.dart';

class RadialBarChart extends StatelessWidget {
  Map data;

  RadialBarChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int datapengeluaran = data['total_pengeluaran'] as int;
    int datapemasukan = data['total_pemasukan'] as int;
    int dataSaldo = data['total_saldo'] as int;
    final List<ChartData> chartData = [
      ChartData(
          'Pengeluaran',
          datapengeluaran != 0
              ? (datapengeluaran / dataSaldo * 100).toInt()
              : 0,
          Colors.red),
      ChartData(
          'Pemasukan',
          datapemasukan != 0
              ? ((dataSaldo - datapengeluaran) / dataSaldo * 100).toInt()
              : 0,
          kColorPrimary),
    ];
    return SfCircularChart(series: <CircularSeries>[
      PieSeries<ChartData, String>(
          dataSource: chartData,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          sortingOrder: SortingOrder.descending,
          strokeColor: kColorPrimary,
          pointColorMapper: (ChartData data, _) => data.color,
          emptyPointSettings: EmptyPointSettings(
              mode: EmptyPointMode.average,
              borderColor: Colors.black,
              borderWidth: 2),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y)
    ]);
  }
}

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.color,
  );
  final String x;
  final int y;
  final Color color;
}
