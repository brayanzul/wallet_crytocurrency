import 'package:flutter/material.dart';

import '../component/card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              _cardwalletBalance(total: '\$676.989', totalCrypto: '7.5678905 BTC', precent: 2.9999),
              _cardwalletBalance(total: '\$506.289', totalCrypto: '7.2521322 ETH', precent: -7.9999),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sorted by higher %',
                style: TextStyle(color: Colors.black45),
              ),
              Row(
                children: const [
                  Text('24H', style: TextStyle(color: Colors.black45)),
                  Icon(Icons.keyboard_arrow_down, color: Colors.black45,)
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _listCryptoItem(
                    iconUrl: 'https://s3.ap-southeast-1.amazonaws.com/imgnew.outlookindia.com/uploadimage/library/16_9/16_9_5/IMAGE_1642828518.jpg',
                    myCrypto: '4.56789004 BTC',
                    myProfit: '\$19.200',
                    myBalance: '\$6.551',
                    precent: 4.40
                  ),
                  _listCryptoItem(
                    iconUrl: 'https://m.media-amazon.com/images/I/A1u96Y7XKWL._AC_UF894,1000_QL80_.jpg',
                    myCrypto: '10.78900349 ETH',
                    myProfit: '\$27.998',
                    myBalance: '\$8.888',
                    precent: 6.90
                  ),
                ],
              ),
            ),
          )
        )
      ],
    );
  }

  Widget _listCryptoItem({String ?iconUrl, double ?precent, String ?myCrypto, myBalance, myProfit}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              '$iconUrl',
              width: 100,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$myCrypto',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    '$myProfit',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black45
                    )
                  )
                ],
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$myBalance',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, 
                    fontSize: 18
                  ),
                ),
                Text(
                  precent! > 0 ? '+ $precent %' : '$precent %',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, 
                    color: precent > 0 ?Colors.green : Colors.blue
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

  Widget _cardwalletBalance({String ?total, totalCrypto, double ?precent}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: card(
        width: MediaQuery.of(context).size.width - 50,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const ClipOval(
                  child: Material(
                    color: Colors.black87,
                    child: InkWell(
                      splashColor: Colors.black,
                      child: SizedBox(
                        width: 56,
                        height: 56,
                        child: Icon(
                          Icons.account_balance_wallet,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Expanded(
                    child: Text(
                  'Total Wallet Balance',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Row(
                  children: const [
                    Text('USD'),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$total',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.black87,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                  decoration: BoxDecoration(
                    color: precent! > 0 ? Colors.green : Colors.blue,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Text(
                    precent  > 0 ? '+ $precent %' : '$precent %',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$totalCrypto',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black45
              ),
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
      ),
    );
  }
}
