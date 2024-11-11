import 'package:flutter/material.dart';
import 'package:finals/constants/reusable.dart';
import 'package:finals/constants/images.dart';
import 'package:finals/constants/fonts.dart';

enum Order {
  nail1,
  nail2,
  nail3,
  nail4,
  nail5,
  nail6,
  nail7,
  nail8,
  nail9,
  nail10,
  nail11,
  nail12,
  nail13,
  nail14,
  nail15,
  nail16,
  nail17,
  nail18,
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Set<Order> selectedOrders = {};
  int order = 0;
  int items = 0;

  void toggleOrderSelection(Order selectedOrder) {
    setState(() {
      if (selectedOrders.contains(selectedOrder)) {
        order -= getOrderPrice(selectedOrder);
        items -= 1;
        selectedOrders.remove(selectedOrder);
      } else {
        order += getOrderPrice(selectedOrder);
        items += 1;
        selectedOrders.add(selectedOrder);
      }
    });
  }

  int getOrderPrice(Order selectedOrder) {
    switch (selectedOrder) {
      case Order.nail1:
        return 199;
      case Order.nail2:
        return 149;
      case Order.nail3:
        return 179;
      case Order.nail4:
        return 189;
      case Order.nail5:
        return 219;
      case Order.nail6:
        return 209;
      case Order.nail7:
        return 169;
      case Order.nail8:
        return 179;
      case Order.nail9:
        return 189;
      case Order.nail10:
        return 209;
      case Order.nail11:
        return 199;
      case Order.nail12:
        return 219;
      case Order.nail13:
        return 189;
      case Order.nail14:
        return 149;
      case Order.nail15:
        return 209;
      case Order.nail16:
        return 229;
      case Order.nail17:
        return 189;
      case Order.nail18:
        return 169;
      default:
        return 0;
    }
  }

  Widget buildOrderCard(Order order, String imagePath, String label) {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          toggleOrderSelection(order);
        },
        color: selectedOrders.contains(order)
            ? kActiveCardColor
            : kInactiveCardColor,
        cardChild: ImageContent(
          image: AssetImage(imagePath),
          label: label,
        ),
      ),
    );
  }

 @override
Widget build(BuildContext context) {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          children: [
            Row(
              children: <Widget>[
                buildOrderCard(Order.nail1, 'asset/image/1.JPG', 'NAIL #1'),
                buildOrderCard(Order.nail2, 'asset/image/2.JPG', 'NAIL #2'),
                buildOrderCard(Order.nail3, 'asset/image/3.JPG', 'NAIL #3'),
              ],
            ),
            Row(
              children: <Widget>[
                buildOrderCard(Order.nail4, 'asset/image/4.JPG', 'NAIL #4'),
                buildOrderCard(Order.nail5, 'asset/image/5.JPG', 'NAIL #5'),
                buildOrderCard(Order.nail6, 'asset/image/6.JPG', 'NAIL #6'),
              ],
            ),
            Row(
              children: <Widget>[
                buildOrderCard(Order.nail7, 'asset/image/7.JPG', 'NAIL #7'),
                buildOrderCard(Order.nail8, 'asset/image/8.JPG', 'NAIL #8'),
                buildOrderCard(Order.nail9, 'asset/image/9.JPG', 'NAIL #9'),
              ],
            ),
            Row(
              children: <Widget>[
                buildOrderCard(Order.nail10, 'asset/image/10.JPG', 'NAIL #10'),
                buildOrderCard(Order.nail11, 'asset/image/11.JPG', 'NAIL #11'),
                buildOrderCard(Order.nail12, 'asset/image/12.JPG', 'NAIL #12'),
              ],
            ),
            Row(
              children: <Widget>[
                buildOrderCard(Order.nail13, 'asset/image/13.JPG', 'NAIL #13'),
                buildOrderCard(Order.nail14, 'asset/image/14.JPG', 'NAIL #14'),
                buildOrderCard(Order.nail15, 'asset/image/15.JPG', 'NAIL #15'),
              ],
            ),
            Row(
              children: <Widget>[
                buildOrderCard(Order.nail16, 'asset/image/16.JPG', 'NAIL #16'),
                buildOrderCard(Order.nail17, 'asset/image/17.JPG', 'NAIL #17'),
                buildOrderCard(Order.nail18, 'asset/image/18.JPG', 'NAIL #18'),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color(0xFF674846),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child: Text('ORDER SUMMARY', style: headingTextStyle)),
                    content: Text(
                        'Your Orders: \n ${selectedOrders.toString()} \n\n Total Cost: $order PHP \n Total Number of Items: $items'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('BACK', style: subheadingTextStyle),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text(
              'PLACE ORDER',
              style: buttonTextStyle,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}}