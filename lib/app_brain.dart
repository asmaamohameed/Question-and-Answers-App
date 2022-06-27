import 'questions.dart';

class AppBrain{

  int questionNumber = 0;

  List<Question> questionGroup = [
    Question(
      q:'عدد كواكب المجموعه الشمسيه هو ثمانيه كواكب',
      i:'images/image-1.jpg',
      a:true,
    ),
    Question(
      q:'القطط هي حيوانات لاحمه',
      i:'images/image-2.jpg',
      a:true,
    ),
    Question(
      q:'الصين موجوده في القاره الافريقيه',
      i:'images/image-3.jpg',
      a:false,
    ),
    Question(
      q:'الأرض مسطحه وليست كرويه',
      i:'images/image-4.jpg',
      a:false,
    ),
    Question(
        q: 'بإستطاعة الإنسان البقاء على قيد الحياة بدون أكل اللحوم',
        i: 'images/image-5.jpg',
        a: true),
    Question(
        q: 'الشمس تدور حول الأرض والأرض تدور حول القمر',
        i: 'images/image-6.jpg',
        a: false),
    Question(
        q: 'الحيوانات لا تشعر بالألم',
        i: 'images/image-7.jpg',
        a: false
    ),
  ];


  void nextQuestion(){
    if(questionNumber < questionGroup.length - 1)
      {
        questionNumber++;
      }
    else
      {

      }
  }

  String getQuestionText() {
    return questionGroup[questionNumber].questionText;
  }

  String getQuestionImage() {
    return questionGroup[questionNumber].questionImage;
  }

  bool getQuestionAnswer() {
    return questionGroup[questionNumber].questionAnswer;
  }

  bool isFinished (){
    if (questionNumber >= questionGroup.length - 1){
      return true;
    }
    else
      {
        return false;
      }
  }

  void reset()
  {
    questionNumber = 0;
  }
}