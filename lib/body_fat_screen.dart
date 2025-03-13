import 'package:gym_workout/utils/export_all.dart';

class BodyFatScreen extends StatelessWidget {
  const BodyFatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {"date": "7 Jun 2021", "value": 17},
      {"date": "26 May 2021", "value": 18},
      {"date": "10 May 2021", "value": 16},
    ];
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Body Fat"),
          bottom: const TabBar(
            padding: EdgeInsets.all(0),
            isScrollable: true,
            tabs: [
              Tab(text: "3 month"),
              Tab(text: "6 months"),
              Tab(text: "1 year"),
              Tab(text: "2 years"),
              Tab(text: "3 years"),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    titlesData: const FlTitlesData(show: false),
                    minX: 0,
                    maxX: 3,
                    minY: 15,
                    maxY: 19,
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          const FlSpot(1, 15),
                          // const FlSpot(1, 18),
                          const FlSpot(2, 18),
                          const FlSpot(2.6, 16),
                        ],
                        isCurved: true,
                        color: Colors.purple,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView.separated(
                itemCount: data.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final item = data[index];
                  return ListTile(
                    title: Text(item["date"]),
                    trailing: Text(item["value"].toString()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
