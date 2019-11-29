import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PatientDetailStatistics extends StatelessWidget {
  final Map<String, double> activities;

  PatientDetailStatistics({this.activities});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment(0.0, -0.75),
          child: Text(
            'Preferred Activities',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        new PieChart(dataMap: this.activities),
      ],
    );
  }
}
