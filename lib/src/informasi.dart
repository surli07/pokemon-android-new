import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_coba/src/variabel.dart';

class Informasi extends StatefulWidget {
  const Informasi({Key? key}) : super(key: key);

  @override
  State<Informasi> createState() => _InformasiState();
}

class _InformasiState extends State<Informasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Container(
                  height: heightWidget! / 18,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Chart",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Slab Serif",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 0.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  width: 350,
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child:
                                        LineChart(LineChartData(lineBarsData: [
                                      LineChartBarData(
                                        spots: const [
                                          FlSpot(0, 3),
                                          FlSpot(2.6, 2),
                                          FlSpot(4.9, 5),
                                          FlSpot(6.8, 2.5),
                                          FlSpot(8, 4),
                                          FlSpot(9.5, 3),
                                          FlSpot(11, 4),
                                        ],
                                        isCurved: true,
                                        dotData: FlDotData(show: true),
                                        color: Colors.blue,
                                        barWidth: 5,
                                      )
                                    ])),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 300,
                              height: 300,
                              child: PieChart(PieChartData(
                                centerSpaceRadius: 5,
                                borderData: FlBorderData(show: false),
                                sectionsSpace: 2,
                                sections: [
                                  PieChartSectionData(
                                    value: 35, color: Colors.purple, radius: 100
                                  ),
                                  PieChartSectionData(value: 40, color: Colors.teal, radius: 100),
                                  PieChartSectionData(value: 55, color: Colors.indigo, radius: 100),
                                  PieChartSectionData(value: 70, color: Colors.lightGreen, radius: 100),
                                ],
                              )),
                            ),
                            Container(
                              child: Padding(padding: const EdgeInsets.all(20),
                              child: AspectRatio(aspectRatio: 1,
                              child: BarChart(BarChartData(borderData: FlBorderData(
                                border: const Border(
                                  top: BorderSide.none,
                                  right: BorderSide.none,
                                  left: BorderSide(width: 1),
                                  bottom: BorderSide(width: 1),
                                ),
                              ),
                                groupsSpace: 10,
                                barGroups: [
                                  BarChartGroupData(x: 1,
                                  barRods: [
                                    BarChartRodData(fromY: 0,toY: 50, width: 15, color: Colors.cyan),
                                  ],
                                  ),
                                  BarChartGroupData(x: 2,
                                    barRods: [
                                      BarChartRodData(fromY: 0,toY: 30, width: 15, color: Colors.cyan),
                                    ],
                                  ),
                                  BarChartGroupData(x: 3,
                                    barRods: [
                                      BarChartRodData(fromY: 0,toY: 2, width: 15, color: Colors.cyan),
                                    ],
                                  ),
                                  BarChartGroupData(x: 4,
                                    barRods: [
                                      BarChartRodData(fromY: 0,toY: 77.5, width: 15, color: Colors.cyan),
                                    ],
                                  ),
                                  BarChartGroupData(x: 1,
                                    barRods: [
                                      BarChartRodData(fromY: 0,toY: 89, width: 15, color: Colors.cyan),
                                    ],
                                  ),
                                ],
                              ),),),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
