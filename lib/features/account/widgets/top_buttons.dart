import 'package:amazon_clone_app/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: [
              AccountButton(text: "Your order", onTap: () {}),
              AccountButton(text: "Turn seller", onTap: () {}),
            ],
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: Row(
            children: [
              AccountButton(text: "Log Out", onTap: () {}),
              AccountButton(text: "Your wish list", onTap: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
