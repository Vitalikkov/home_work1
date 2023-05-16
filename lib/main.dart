import 'package:flutter/material.dart';
import './card.dart';
import 'aboutCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<CardInfo> _listOfCard = [];

  @override
  void initState() {
    genereteCardInfo();

    super.initState();
  }
  void genereteCardInfo(){
    for (int i = 0; i < 5; i++){
      _listOfCard.add(
        CardInfo(
          title: 'title ${i+1}',
          numberCard: i,
        )
      );
    }
  }

  void updateCard(CardInfo newCardInfo) {
    setState(() {
      _listOfCard[newCardInfo.numberCard] = newCardInfo;
    });

  }



  Future<void> pushToAbout(CardInfo cardInfo, BuildContext context) async{
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AboutPage(cardInfo: cardInfo),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView.builder(
          itemCount: _listOfCard.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(10),
              child: MyCard(
                cardInfo: _listOfCard[index],
                onTap: () async {
                 final newCardInfo =  await Navigator.push<CardInfo>(
                    context,
                    MaterialPageRoute(builder: (_) => AboutPage(cardInfo:  _listOfCard[index])
                    ),
                  );

                 if(newCardInfo != null){
                   updateCard(newCardInfo);
                 }
                },
              ),
            );
          }
        ),
      ),
    );
  }
}

class CardInfo {
  String title;
  final int numberCard;
  final String imageUrl;

  CardInfo({required this.title, required this.numberCard, this.imageUrl = './images/lake.jpg'});

}
