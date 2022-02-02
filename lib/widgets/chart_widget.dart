import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/workout_data.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<WorkoutData> _chartData;

  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SfCircularChart(
      palette: const [
        Color.fromARGB(255, 5, 26, 114),
        Color.fromARGB(255, 7, 64, 203),
        Color.fromARGB(255, 0, 107, 230),
        Color.fromARGB(255, 0, 150, 255),
        Color.fromARGB(255, 0, 200, 255),

        // Color(0xFF00537a),
        // Color(0xFF006899),
        // Color(0xFF007eba),
        // Color(0xFF0694dc),
        // Color(0xFF19abff),
      ],
      legend: Legend(
        isVisible: true,
      ),
      series: <CircularSeries>[
        RadialBarSeries<WorkoutData, String>(
          dataSource: _chartData,
          legendIconType: LegendIconType.rectangle,
          selectionBehavior: SelectionBehavior(enable: true),
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ),
          dataLabelMapper: (WorkoutData data, _) => data.reps.toString(),
          xValueMapper: (WorkoutData data, _) => data.workout,
          yValueMapper: (WorkoutData data, _) => data.reps,
          enableTooltip: true,
          cornerStyle: CornerStyle.endCurve,
        ),
      ],
    ));
  }

  List<WorkoutData> getChartData() {
    final List<WorkoutData> chartData = [
      WorkoutData(15, 20, 20, 'Push Ups'), // push ups
      WorkoutData(10, 12, 20, 'Wide Push ups'), //
      WorkoutData(12, 18, 20, 'Pike Push Ups'), // pike pushups
      WorkoutData(3, 4, 10, 'Pull Ups'), // pull ups
      WorkoutData(3, 5, 10, 'Pistol Squats'), //
    ];
    return chartData;
  }
}
