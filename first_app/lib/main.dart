import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';
import 'quiz.dart';
import 'result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

//MyAppState deriva de MyApp para que a extensão de StatefulWidget seja possível
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "Qual sua cor favorita?",
      'answers': [
        {'text': 'Preto', 'score': 4},
        {'text': 'Vermelho', 'score': 6},
        {'text': 'Branco', 'score': 4},
        {'text': 'Rosé', 'score': 6}
      ],
    },
    {
      'questionText': "Qual sua rede social favorita?",
      'answers': [
        {'text': 'Instagram', 'score': 6},
        {'text': 'Facebook', 'score': 4},
        {'text': 'TikTok', 'score': 4},
        {'text': 'Twitter', 'score': 5}
      ],
    },
    {
      'questionText': "Qual seu app favorito de música",
      'answers': [
        {'text': 'Spotify', 'score': 4},
        {'text': 'Deezer', 'score': 3},
        {'text': 'Apple Music', 'score': 7},
        {'text': 'Youtube Music', 'score': 6}
      ]
    },
    {
      'questionText':
          "O que te chama mais atenção quando vai comprar um aparelho?",
      'answers': [
        {'text': 'Preço', 'score': 4},
        {'text': 'Conectividade', 'score': 6},
        {'text': 'Bateria', 'score': 5},
        {'text': 'Câmera', 'score': 4}
      ]
    },
    {
      'questionText': "Qual tamanho de aparelho você gostaria de ter?",
      'answers': [
        {'text': 'Grande', 'score': 2},
        {'text': 'Médio', 'score': 2},
        {'text': 'Pequeno', 'score': 2},
        {'text': 'Não me importo', 'score': 1}
      ],
    },
  ];

  var questionIndex = 0;
  var _totalScore = 0;
  void resetQuiz(){
    setState(() {
    questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      questionIndex++;
    });
    print(questionIndex);
    if (questionIndex < _questions.length) {
      //verificador, um IF mas de forma simples
      print("Não temos mais perguntas");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 97, 5, 5),
        accentColor: Colors.red
      ),

      home: Scaffold(
        appBar: AppBar(title: Text('Qual o melhor celular para você?'),
        backgroundColor: Color.fromARGB(255, 97, 5, 5),),
        body: questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, resetQuiz),
      ),
    );
  }
}
