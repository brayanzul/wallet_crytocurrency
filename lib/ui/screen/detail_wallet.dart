import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../component/appBar.dart';
import '../component/card.dart';

class DetailWalletScreen extends StatelessWidget {
  const DetailWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SafeArea(
          child: appBar(
            left: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
            title: 'Bitcoin Wallet',
            right: const Icon(
              Icons.more_vert,
              color: Colors.black54,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 25),
            _cardWallet(),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Day'),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[200],
                      borderRadius: const BorderRadius.all(Radius.circular(30))
                    ),
                    child: const Text('Week'),
                  ),
                  const Text('Month'),
                  const Text('Year'),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _dot(color : Colors.orange),
                            const Text(
                              'Lower: \$ 5.999',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            _dot(color : Colors.greenAccent),
                            const Text(
                              'Higher: \$ 3.989',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: Stack(
                      children: [
                        const Text('a'),
                        LineChart(
                          sampleData(),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 10,
                          child: Row(
                            children: [
                              _dot(color: Colors.orangeAccent, size: 18),
                              const Text(
                                '1BTC=\$5.694',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(child: _actionButton(text: 'Buy', color: Colors.blue)),
                const SizedBox(width: 20),
                Expanded(child: _actionButton(text: 'Sell', color: Colors.red)),
              ],
            )
          ],
        ),
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      //minX: 0,
      maxX: 10,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    return [
      LineChartBarData(
        spots: [
          const FlSpot(1, 2),
          const FlSpot(3, 3.1),
          const FlSpot(7, 2.0),
          const FlSpot(10, 3.2),
          const FlSpot(12, 2.7),
          const FlSpot(13, 3),
        ],
        isCurved: true,
        color: Colors.orangeAccent,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          color: Colors.orange[100],
        ),
      ),
    ];
  }

  _dot({Color color = Colors.black, double size = 10}){
    return Container(
      margin: const EdgeInsets.all(10),
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20 )),
        child: Container(
          color: color,
        ),
      ),
    );
  }

  _actionButton({Color color = Colors.green, String ?text}){
    return card(
      child: Column(
        children: [
          ClipOval(
            child: Material(
              color: color,
              child: const InkWell(
                splashColor: Colors.black,
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text('$text', style: const TextStyle(fontSize: 24, color: Colors.black54),)
        ],
      )
    );
  }

  _cardWallet(){
    return card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://s3.ap-southeast-1.amazonaws.com/imgnew.outlookindia.com/uploadimage/library/16_9/16_9_5/IMAGE_1642828518.jpg',
                width: 80,
              ),
              const SizedBox(
                width: 20,
              ),
              const Expanded(
                child: Text(
                  'Bitcoin',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ), 
              ),
              const Text('BTC'),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          const Text(
            '41.11340 BTC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black87
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '\$68.9321',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black38
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))
                ),
                child: const Text(
                  '+7.87%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
          const Center(
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.black45,
            ),
          )
        ],
      ),
    );
  }

}
