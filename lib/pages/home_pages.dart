import 'package:flutter/material.dart';
import 'package:superheroesapp/pages/superheroes_logic.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SuperHeroesLogic superHeroesLogic = SuperHeroesLogic();
  int correct = 0;
  int incorrect = 0;
  List<Widget> score = [];
  void checkAnswer(String name){    
    if (superHeroesLogic.isFinishedFunc()){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                correct>=incorrect? Icon( Icons.check,color: Colors.green): Icon( Icons.error,color: Colors.red),
                Text(correct>=incorrect? " Felicidades":"Vuelve a intentarlo "),
              ],
            ),
            content: Text("Terminaste el cuestionario con ${correct} respuestas correctas y ${incorrect} respuestas incorrectas"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              ElevatedButton(
                onPressed: () {
                  superHeroesLogic.restartQuiz();
                  Navigator.pop(context);
                  score.clear();
                  correct = 0;
                  incorrect = 0;
                  setState(() {});
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return;
    }
    String correctName = superHeroesLogic.getAnswer();
    if (correctName == name){
      score.add(itemScore((superHeroesLogic.superIndex + 1).toString(), true));
      correct++;
    }else{
      score.add(itemScore((superHeroesLogic.superIndex + 1).toString(), false));
      incorrect++;
    }
    superHeroesLogic.nextQuestion();
    setState(() {});
  }

  Widget itemScore(String numberQuestion, bool isCorrect) {
    return Row(
      children: [
        Text("$numberQuestion:", style: TextStyle(color: Colors.white)),
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.greenAccent : Colors.redAccent,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('¿Como se llama el superheroe?'),
      ),
      body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40)
              ),
              child:Image.network(superHeroesLogic.getImageUrlText(),height: 300),
            ),
            Column(
              children: [
                Row(
                children: [
                  Expanded(
                    child: 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 200,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Color(0xff554687),
                          onPressed: () {checkAnswer(superHeroesLogic.getOptionsText(0));},child: Text(superHeroesLogic.getOptionsText(0),style: TextStyle(color: Colors.white),)
                        ),
                      )
                  ),
                  Expanded(
                    child: 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 200,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Color(0xff6DCDC2),
                          onPressed: () { checkAnswer(superHeroesLogic.getOptionsText(1)); },child: Text(superHeroesLogic.getOptionsText(1),style: TextStyle(color: Colors.white),)
                        ),
                      )
                  ),
                  ],
                ),
                Row(
                children: [
                  Expanded(
                    child: 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 200,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Color(0xffF5C467),
                          onPressed: () {checkAnswer(superHeroesLogic.getOptionsText(2));},child: Text(superHeroesLogic.getOptionsText(2),style: TextStyle(color: Colors.white),)
                        ),
                      )
                  ),
                  Expanded(
                    child: 
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          height: 200,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Color(0xffF06060),
                          onPressed: () {checkAnswer(superHeroesLogic.getOptionsText(3));},child: Text(superHeroesLogic.getOptionsText(3),style: TextStyle(color: Colors.white),)
                        ),
                      )
                  ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: score),
            ],
            ),
          ],
        ),
    );
  }
}
