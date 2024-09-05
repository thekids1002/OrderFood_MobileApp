import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orderfood1/widgets/primary_button.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "History",
            style: TextStyle(
              fontFamily: "SF-PRO",
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset("assets/icons/back-button.svg"),
            onPressed: () {},
          ),
        ),
        body: const Content(),
      ),
    );
  }
}

class Content extends StatefulWidget {
  const Content({super.key});

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    var emptyHistoryWidget = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/history-icon.svg"),
          const Text(
            "No history yet",
            style: TextStyle(
                fontFamily: "SF-PRO",
                fontSize: 30,
                fontWeight: FontWeight.w100),
          ),
          Text(
            "Hit the orange button down\n below to Create an order",
            softWrap: true,
            style: TextStyle(
              fontFamily: "SF-PRO",
              fontSize: 17,
              color: Colors.black.withOpacity(0.57),
            ),
          ),
        ],
      ),
    );

    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: emptyHistoryWidget,
          ),
          Center(
            child: PrimaryButton(
              btnColor: const Color(0xFFFA4A0C),
              textColor: const Color(0xFFF6F6F9),
              text: "Start odering",
              onPressed: () => {},
            ),
          )
        ],
      ),
    );
  }
}
