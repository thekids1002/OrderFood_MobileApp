import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orderfood1/widgets/primary_button.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Orders",
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
    return SizedBox(
      height: double.infinity,
      child: Column(
        children: [
          const Expanded(child: _EmptyCartWidget()),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: PrimaryButton(
                btnColor: const Color(0xFFFA4A0C),
                textColor: const Color(0xFFF6F6F9),
                text: "Start ordering",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCartWidget extends StatelessWidget {
  const _EmptyCartWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: SvgPicture.asset("assets/icons/empty_cart_icon.svg"),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "No orders yet",
              style: TextStyle(
                fontFamily: "SF-PRO",
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Hit the orange button down\nbelow to create an order",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "SF-PRO",
                fontSize: 17,
                color: Colors.black.withOpacity(0.57),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
