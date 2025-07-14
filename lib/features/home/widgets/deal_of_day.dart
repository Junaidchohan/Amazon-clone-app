import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 10, top: 15),
          child: Text("Deal of the day", style: TextStyle(fontSize: 20)),
        ),
        Image.network(
          "https://www.shutterstock.com/shutterstock/photos/2591636917/display_1500/stock-photo-kiev-ukraine-february-apple-iphone-pro-black-titanium-2591636917.jpg",
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          alignment: Alignment.topLeft,

          padding: EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text("\$100", style: TextStyle(fontSize: 18)),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 15, top: 5, right: 40),
          child: Text("Junaid", maxLines: 2, overflow: TextOverflow.ellipsis),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://www.shutterstock.com/shutterstock/photos/2502458641/display_1500/stock-photo-the-box-with-the-iphone-is-on-a-laptop-on-the-screen-of-which-there-is-a-render-with-the-iphone-2502458641.jpg",
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.shutterstock.com/shutterstock/photos/2502458641/display_1500/stock-photo-the-box-with-the-iphone-is-on-a-laptop-on-the-screen-of-which-there-is-a-render-with-the-iphone-2502458641.jpg",
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.shutterstock.com/shutterstock/photos/2502458641/display_1500/stock-photo-the-box-with-the-iphone-is-on-a-laptop-on-the-screen-of-which-there-is-a-render-with-the-iphone-2502458641.jpg",
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://www.shutterstock.com/shutterstock/photos/2502458641/display_1500/stock-photo-the-box-with-the-iphone-is-on-a-laptop-on-the-screen-of-which-there-is-a-render-with-the-iphone-2502458641.jpg",
                fit: BoxFit.fitHeight,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(color: Colors.cyan[800]),
          ),
        ),
      ],
    );
  }
}
