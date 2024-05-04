import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShipTo extends StatelessWidget {
  const ShipTo({super.key, required this.address});
final String address;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(
          height: 2.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Ship to',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                //color: Colors.black
              ),
            ),

             Text(
              address,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
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
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
