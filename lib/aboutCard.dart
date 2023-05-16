import 'package:flutter/material.dart';
import 'package:home_work1/button.dart';
import 'package:home_work1/main.dart';
import 'package:home_work1/title.dart';

class AboutPage extends StatefulWidget {
  final CardInfo cardInfo;

  const AboutPage({Key? key, required this.cardInfo}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late TextEditingController controller;
  late CardInfo cardInfo2;

  @override
  void initState(){
    
    cardInfo2 = CardInfo(title: widget.cardInfo.title, numberCard: widget.cardInfo.numberCard, imageUrl: widget.cardInfo.imageUrl);
    
    controller = TextEditingController(text: cardInfo2.title);



    super.initState();
  }

  void save(){
    cardInfo2.title = controller.text;
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: SafeArea(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Stack(
                   children:[
                     Image.asset(
                     widget.cardInfo.imageUrl,
                     width: 600,
                     height: 240,
                     fit: BoxFit.cover,
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
                             '${widget.cardInfo.numberCard+1}',
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
                 Button(),
                 Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: TitleSection(title: widget.cardInfo.title),
                  ),
                 const SizedBox(height: 30),
                 TextField(controller: controller),
                 ElevatedButton(
                     onPressed: () {
                       save();
                       Navigator.of(context).pop(cardInfo2);
                     },
                     child: Text('Save')
                 ),
               ],
             ),
           ),
        ),
    );
  }
}
