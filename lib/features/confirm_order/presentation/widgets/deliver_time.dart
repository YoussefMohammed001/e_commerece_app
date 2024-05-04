import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeliveryTime extends StatelessWidget {
  const DeliveryTime({super.key, required this.time});
final String time;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [   SizedBox(
        height: 1.h,
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Delivery time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                // color: Colors.black
              ),
            ),

             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  time,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),

              ],
            ),

            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  //color: Colors.black,
                  size: 20,
                )),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        Divider(
          color: Colors.grey[200],
          thickness: 1,
          height: 1,
        ),],
    );
  }
}
