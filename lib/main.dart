import 'package:flutter/material.dart';

void main() {
  runApp(RootView());
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [TopSection(), TotalBalanceSection()],
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 80),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // TODO: Image
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Hey, Arakene",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Welcom back",
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8),
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class TotalBalanceSection extends StatelessWidget {
  const TotalBalanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120),
        Text(
          "Total Balance",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),

        SizedBox(height: 10),

        Text(
          "\$5 194 482",
          style: TextStyle(
            fontSize: 42,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 25),

        BalanceButtons(),
      ],
    );
  }
}

class BalanceButtons extends StatelessWidget {
  const BalanceButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Text("Transfer", style: TextStyle(fontSize: 20)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
            child: Text("Transfer", style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
