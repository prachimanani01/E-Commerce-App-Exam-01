
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../utils/componets/category.dart';
import '../../utils/componets/products.dart';
import '../../utils/componets/sub_category.dart';
import '../../utils/global/routes.dart';
import '../../utils/product/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? dropDownVal;
  double sliderValue = 0;
  RangeValues rangeValue = const RangeValues(0, 2000);
  @override
  void initState() {
    super.initState();
    category.insert(0, "All");
    log("Init State..");
  }

  @override
  Widget build(BuildContext context) {
    TextScaler textScale = MediaQuery.textScalerOf(context);
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.055,
              ),

              Row(
                children: [

                  Text(
                    "Ecomly",
                    style: TextStyle(
                      fontSize: textScale.scale(25),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1,
                    ),
                  ),

                  const Spacer(),
                  Icon(
                    Icons.notification_add,
                    size: h * 0.03,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      height: h * 0.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.search,
                            color: Colors.grey,
                            size: h * 0.036,
                          ),
                          SizedBox(
                            width: w * 0.02,
                          ),
                          Text(
                            "Search for product",
                            style: TextStyle(
                              fontSize: textScale.scale(18),
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                height: h * 0.21,
                width: w,
                decoration: BoxDecoration(
                  color: const Color(0xff534DB7),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(25),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Up To",
                                style: TextStyle(
                                    fontSize: textScale.scale(24),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              Text(
                                "50% OFF",
                                style: TextStyle(
                                  fontSize: textScale.scale(28),
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xffF3F832),
                                ),
                              ),
                              Text(
                                "With code",
                                style: TextStyle(
                                    fontSize: textScale.scale(26),
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: h * 0.01,
                              ),
                              Container(
                                height: h * 0.03,
                                width: w * 0.28,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "Get it now",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: textScale.scale(12),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: h * 0.03,
              ),
              Row(
                children: [
                  Text(
                    "Popular Product",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textScale.scale(24),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.03,
              ),

              if (cat == "All") ...[
                ...category.map(
                      (e) => Column(
                    children: [myProduct(context: context, category: e)],
                  ),
                )
              ] else ...[
                myProduct(
                  context: context,
                  category: cat,
                  min: rangeValue.start,
                  max: rangeValue.end,
                ),
              ],
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),



      bottomNavigationBar: Container(
        width: w,
        height: h * 0.08,
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: w * 0.08,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.home_filled,
                size: h * 0.04,
                color: Colors.blue,
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.grey,
                size: h * 0.04,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.favorite_outline_rounded,
              color: Colors.grey,
              size: h * 0.04,
            ),
            const Spacer(),
            Icon(
              Icons.person_2_outlined,
              color: Colors.grey,
              size: h * 0.04,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
