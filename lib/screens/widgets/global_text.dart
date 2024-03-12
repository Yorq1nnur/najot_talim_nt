import 'package:flutter/material.dart';
import '../../size/app_size.dart';

class GlobalMoney extends StatelessWidget {
  const GlobalMoney({super.key, required this.title1, required this.title2, required this.title3, required this.imgPath});

  final String title1;
  final String title2;
  final String title3;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 54.getH(),
                width: 54.getW(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.circular(8.getW()),
                ),
                child: Image.asset(imgPath),
              ),
              SizedBox(width: 10.getW()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title1,
                    style: TextStyle(
                      color: const Color(0xFF151940),
                      fontSize: 18.getW(),
                    ),
                  ),
                  SizedBox(height: 3.getH()),
                  Text(
                    title2,
                    style: TextStyle(
                      color: const Color(0xFF7F8192),
                      fontSize: 12.getW(),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                title3,
                style: TextStyle(
                  color: const Color(0xFF151940),
                  fontSize: 14.getW(),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.getH()),
      ],
    );
  }
}

List<GlobalMoney> money = [
  const GlobalMoney(
    title1: 'Behance Project',
    title2: '23rd march 2021',
    title3: "\$320",
    imgPath: "assets/images/img1.png",
  ),
  const GlobalMoney(
    title1: 'Uber Monthly',
    title2: '04th february 2021',
    title3: "\$650",
    imgPath: "assets/images/img2.png",
  ),
  const GlobalMoney(
    title1: 'ATM Withdraws',
    title2: 'BDT ACCOUNT',
    title3: "\$480",
    imgPath: "assets/images/img3.png",
  ),
  const GlobalMoney(
    title1: 'Transfer Money',
    title2: 'INR ACCOUNT',
    title3: "\$320",
    imgPath: "assets/images/img4.png",
  ),
  const GlobalMoney(
    title1: 'Behance Project',
    title2: '23rd march 2021',
    title3: "\$320",
    imgPath: "assets/images/img1.png",
  ),
  const GlobalMoney(
    title1: 'Uber Monthly',
    title2: '04th february 2021',
    title3: "\$650",
    imgPath: "assets/images/img2.png",
  ),
  const GlobalMoney(
    title1: 'ATM Withdraws',
    title2: 'BDT ACCOUNT',
    title3: "\$480",
    imgPath: "assets/images/img3.png",
  ),
  const GlobalMoney(
    title1: 'Transfer Money',
    title2: 'INR ACCOUNT',
    title3: "\$320",
    imgPath: "assets/images/img4.png",
  ),
  const GlobalMoney(
    title1: 'Behance Project',
    title2: '23rd march 2021',
    title3: "\$320",
    imgPath: "assets/images/img1.png",
  ),
  const GlobalMoney(
    title1: 'Uber Monthly',
    title2: '04th february 2021',
    title3: "\$650",
    imgPath: "assets/images/img2.png",
  ),
  const GlobalMoney(
    title1: 'ATM Withdraws',
    title2: 'BDT ACCOUNT',
    title3: "\$480",
    imgPath: "assets/images/img3.png",
  ),
  const GlobalMoney(
    title1: 'Transfer Money',
    title2: 'INR ACCOUNT',
    title3: "\$320",
    imgPath: "assets/images/img4.png",
  ),
  const GlobalMoney(
    title1: 'Behance Project',
    title2: '23rd march 2021',
    title3: "\$320",
    imgPath: "assets/images/img1.png",
  ),
  const GlobalMoney(
    title1: 'Uber Monthly',
    title2: '04th february 2021',
    title3: "\$650",
    imgPath: "assets/images/img2.png",
  ),
  const GlobalMoney(
    title1: 'ATM Withdraws',
    title2: 'BDT ACCOUNT',
    title3: "\$480",
    imgPath: "assets/images/img3.png",
  ),
  const GlobalMoney(
    title1: 'Transfer Money',
    title2: 'INR ACCOUNT',
    title3: "\$320",
    imgPath: "assets/images/img4.png",
  ),
];