import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [

        SizedBox(
          height: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Payment',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                //color: Colors.black
              ),
            ),

            Image.asset(
              "assets/images/img.png",
              width: 20.w,
              height: 8.h,
            ),

            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward,
                  // color: Colors.black,

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

      ],
    );
  }
}
