import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amazon_clone_app/providers/user_provider.dart';

class AdressBox extends StatelessWidget {
  const AdressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return Container(
      height: 40,
      width: double.infinity, // ✅ Ensure full width
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 114, 226, 221),
            Color.fromARGB(255, 162, 236, 233),
          ],
          stops: [0.5, 1.0],
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, size: 20, color: Colors.black),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              'Deliver to ${user.name} - ${user.address}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, top: 2),
            child: Icon(Icons.arrow_drop_down_outlined, size: 18),
          ),
        ],
      ),
    );
  }
}
