import 'package:flutter/material.dart';
import 'package:home_work1/aboutCard.dart';
import 'package:home_work1/button.dart';
import 'package:home_work1/main.dart';
import 'package:home_work1/title.dart';

class MyCard extends StatelessWidget {

  final CardInfo cardInfo;
  final VoidCallback onTap;

  const MyCard({Key? key, required this.cardInfo, required this.onTap}): super(key: key);


  Widget textSection(){
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    return  GestureDetector(
      onTap: onTap,
      child: Stack(
        children:[
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Button()
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.black.withOpacity(0.5),
              ),
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: TitleSection(title: cardInfo.title),
            ),
          ),
          Positioned(
              top: 16,
              left: 16,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black.withOpacity(0.5),
                ),
                child: Center(
                  child: Text(
                    '${cardInfo.numberCard+1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }

}
