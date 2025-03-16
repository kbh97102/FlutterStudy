import 'package:flutter/material.dart';

class CardSection extends StatelessWidget {
  const CardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Wallets",
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "View All",
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 18,
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        Card(
          amount: "6 500",
          name: "Euro",
          code: "EUR",
          icon: Icons.euro_rounded,
          isInverted: false,
        ),
        Transform.translate(
          offset: Offset(0, -20),
          child: Card(
            amount: "7 000",
            name: "Bitcoin",
            code: "BTC",
            icon: Icons.currency_bitcoin,
            isInverted: true,
          ),
        ),
        Transform.translate(
          offset: Offset(0, -40),
          child: Card(
            amount: "6 500",
            name: "Dollar",
            code: "USD",
            icon: Icons.attach_money_outlined,
            isInverted: false,
          ),
        ),
      ],
    );
  }
}

class Card extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;

  // TODO: underbar == private?
  final _blackColor = const Color(0XFF1F2123);

  const Card({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: isInverted ? Colors.white : _blackColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: isInverted ? _blackColor : Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      code,
                      style: TextStyle(
                        color: isInverted ? _blackColor : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Transform.scale(
              scale: 2.2,
              child: Transform.translate(
                offset: Offset(8, 15),
                child: Icon(
                  icon,
                  color: isInverted ? _blackColor : Colors.white,
                  size: 88,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
