import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBrain appBrain = AppBrain();

void main() {
  runApp(ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Center(
            child: Text(
              'اختبار'
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}
class ExamPage extends StatefulWidget {

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  int rightAnswer = 0;
  List <Widget> answerResult = [];

  void checkAnswer(bool whatUserPicked)
  {
    setState(() {
      bool correctAnswer = appBrain.getQuestionAnswer();
      if(whatUserPicked == correctAnswer){
        rightAnswer++;
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ),
        );
      }
      else{
        answerResult.add(
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ),
        );
      }
      if (appBrain.isFinished() == true)
        {
          Alert(
            context: context,
            title: "إنتهاء الإختبار",
            desc: "لقد أجبت على $rightAnswer أسئله صحيحه من أصل 7",
            buttons: [
              DialogButton(
                child: Text(
                  "ابدأ من جديد",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
          rightAnswer = 0;

          appBrain.reset();

          answerResult = [];
        }
      else
        {
          appBrain.nextQuestion();
        }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: answerResult,
        ),
        Expanded(
          flex: 5,
            child: Column(
              children: [
                Image.asset(appBrain.getQuestionImage()),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  appBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                ),
              ],
            )
        ),
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextButton(
                child: Text(
                  'صح',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.indigo,
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: TextButton(
              child: Text(
                'خطأ',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              onPressed: () {
               checkAnswer(false);
              },
            ),
          ),
        ),
      ],
    );
  }
}
