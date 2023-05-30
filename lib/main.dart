import 'package:flutter/material.dart';
import 'package:calculate/quizz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main(){
  runApp(MaterialApp(home: quizz(),));
}
class quizz extends StatefulWidget {
  const quizz({Key? key}) : super(key: key);

  @override
  State<quizz> createState() => _quizzState();
}

class _quizzState extends State<quizz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('images/hack.jpg'),
                  fit: BoxFit.cover
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          getQus(),
                          style: TextStyle(color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),),
                      ),
                      SizedBox(height: 300,),
                      // Container(height: 30,width: 500,),
                      Container(
                        color: Colors.green,
                        height: 30,
                        width: double.maxFinite,
                        child: TextButton(
                            onPressed: () {
                              check(true);
                            },
                            child: Text('TRUE', style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        color: Colors.red,
                        height: 30,
                        width: double.maxFinite,
                        child: TextButton(
                            onPressed: () {
                              check(false);
                            },
                            child: Text('FAlSE', style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),)),
                      ),
                      Row(
                        children: ico,
                      ),
                    ]
                ),
              ),
            ),
          )),
    );
  }

  List _question = [
    quiz(qus: 'Car have 4 wheels', ans: true),
    quiz(qus: 'Bike have three wheels', ans: false),
    quiz(qus: 'Sky color is blue', ans: true),
    quiz(qus: 'Human blood color is green', ans: false),
    quiz(qus: 'Kerala is the state of America', ans: false),
    quiz(qus: 'India is Asian country', ans: true),
    quiz(qus: 'Malayalam is the mother tongue of kerala', ans: true),
    quiz(qus: 'Lionel Messi is a cricket player', ans: false),
    quiz(qus: '125 less than 25', ans: false),
    quiz(qus: 'Cat have 4 legs', ans: true),
  ];

  List<Icon> ico = [];
  int count = 0;
  int _qusNo = 0;

  void nextQus() {
    if (_qusNo < _question.length) {
      _qusNo++;
    }
  }

  String getQus() {
    return _question[_qusNo].qus;
  }

  bool getAns() {
    return _question[_qusNo].ans;
  }

  bool isFinished() {
    if (_qusNo >= _question.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int reset() {
    _qusNo = 0;
    count = 0;
    return _qusNo;
  }

  void check(bool answer) {
    bool value = getAns();
    setState(() {
      if (isFinished() == true) {
        //print('Finished');
        if (count <= 5) {
          Alert(context: context, title: 'THE END', desc: 'You are failed')
              .show();
          reset();
          ico = [];
        } else {
          Alert(
              context: context,
              title: 'THE END',
              desc: 'You are passed with $count marks')
              .show();
          reset();
          ico = [];
        }
      } else {
        if (value == answer) {
          print(count);
          ico.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          count++;
        } else {
          ico.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        nextQus();
      }
    });
  }


}
