import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText;

    if (resultScore >= 22) {
      resultText = ('O melhor aparelho para você é Apple');
    } else if (resultScore >= 19 && resultScore <= 20) {
      resultText = ('O melhor aparelho para você é Samsung');
    } else if (resultScore >= 17 && resultScore <= 18) {
      resultText = ('O melhor aparelho para você é Motorola');
    } else if (resultScore <= 16) {
      resultText = ('O melhor aparelho para você é Xiomi');
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetHandler,
            child: Text("Tentar Novamente!"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 97, 5, 5)
            ),
          )
        ],
      ),
    );
  }
}
