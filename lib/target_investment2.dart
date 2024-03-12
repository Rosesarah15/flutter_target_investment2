import 'package:flutter/material.dart';

class MyTargetInvestmentPage2 extends StatefulWidget {
  const MyTargetInvestmentPage2({super.key, required String title});

  @override
  State<MyTargetInvestmentPage2> createState() =>
      _MyTargetInvestmentPage2State();
}

class _MyTargetInvestmentPage2State extends State<MyTargetInvestmentPage2> {
  double _profit = 0.0;
  double _amountSliderValue = 10000;
  double _periodSliderValue = 3;

  void _updateProfit() {
    setState(() {
      _profit = _amountSliderValue / _periodSliderValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 22, 38),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Target Investment',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'images/pl-imagess.png',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Stack(
                alignment: Alignment.center,
                fit: StackFit.loose,
                children: [
                  CircularContainer(
                    icon: Icons.check,
                    iconColor: Colors.white,
                    containerColor: Colors.lightBlue,
                    width: 35,
                    height: 35,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Positioned(
                    left: 45,
                    child: Column(
                      children: [
                        CircularContainer(
                          containerColor: Color.fromARGB(255, 33, 54, 79),
                          height: 65,
                          width: 65,
                          text: '2',
                          fontSize: 30,
                          textBelow: 'Target Investment',
                        ),
                        // SizedBox(
                        //   height: 15,
                        // ),
                        // Text(
                        //   'Target Investment',
                        //   style: TextStyle(fontSize: 15, color: Colors.white),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Positioned(
                    left: 160,
                    child: CircularContainer(
                      containerColor: Color.fromARGB(255, 33, 54, 79),
                      height: 35,
                      width: 35,
                      text: '3',
                      fontSize: 20,
                    ),
                  ),
                  Positioned(
                    left: 180,
                    child: CircularContainer(
                      containerColor: Color.fromARGB(255, 33, 54, 79),
                      height: 35,
                      width: 35,
                      text: '4',
                      fontSize: 20,
                    ),
                  ),
                ]),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Target Investment',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.shield,
                  color: Colors.green,
                  size: 17,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Insured',
                  style: TextStyle(fontSize: 15, color: Colors.green),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              'Amount',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Slider(
                    value: _amountSliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        _amountSliderValue = newValue;
                        _updateProfit();
                      });
                    },
                    min: 10000,
                    max: 1000000000,
                    divisions: 999999,
                    label: '$_amountSliderValue',
                    activeColor: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildText('10,000'),
                        _buildText('1,000,000,000')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Period',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Column(
                children: [
                  Slider(
                    value: _periodSliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        _periodSliderValue = newValue;
                        _updateProfit();
                      });
                    },
                    divisions: 3,
                    label: '${_periodSliderValue.toInt()}',
                    min: 3,
                    max: 12,
                    activeColor: Colors.orange,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildText('12 /m'),
                      _buildText('6 /m'),
                      _buildText('3 /m')
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 33, 54, 79)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTextContainer('UGX', Colors.white, 15),
                    _buildTextContainer(
                        _profit.toStringAsFixed(2), Colors.white, 20,
                        fontWeight: FontWeight.bold),
                    _buildTextContainer('ROI (Profit)', Colors.lightBlue, 12)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 215, 79, 6),
                    minimumSize: const Size(360, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildTextContainer(String text, Color color, double fontSize,
    {FontWeight? fontWeight}) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
  );
}

Widget _buildText(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.white38,
      fontSize: 16,
    ),
  );
}

class CircularContainer extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final Color containerColor;
  final Color? iconColor;
  final String? textBelow;
  final double? fontSize;

  @override
  final Key? key;

  final double width;

  final double height;

  const CircularContainer({
    this.key,
    this.text,
    this.icon,
    required this.containerColor,
    this.iconColor,
    this.textBelow,
    required this.height,
    required this.width,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: containerColor,
          ),
          child: Center(
            child: icon != null
                ? Icon(
                    icon,
                    color: iconColor,
                  )
                : text != null
                    ? Text(
                        text!,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold),
                      )
                    : null,
          ),
        ),
      ],
    );
  }
}
