
import 'package:superheroesapp/models/superheroes_question_model.dart';

class SuperHeroesLogic {

  int superIndex = 0;
  bool isFinished = false;

List<SuperHeroesQuestionModel> superHeroesList = [
  SuperHeroesQuestionModel(imageUrl: 'https://e.rpp-noticias.io/xlarge/2020/06/10/005600_954931.jpg',answer: 'Capitan america',options: ['Capo america', 'Americano', 'Capitan america','America capitan'],),
  SuperHeroesQuestionModel(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfHCoa-AZcOOmUfmDQT4Y7W3AOM_I_K_t9IQ&s',answer: 'Hulk',options: ['Shrek', 'Hulk', 'Jolk','Duende verde'],),
  SuperHeroesQuestionModel(imageUrl: 'https://www.shutterstock.com/image-vector/spiderman-suit-icon-logo-super-600w-2407844867.jpg',answer: 'Spiderman',options: ['Spiderman', 'Spiderboy', 'Man-Spider', 'Venom'],),
  SuperHeroesQuestionModel(imageUrl: 'https://i.pinimg.com/564x/24/54/e8/2454e8c93f9f76d83788640e6dc5df7d.jpg',answer: 'Antman',options: ['Antman', 'Bugman', 'Wasp', 'Miniman'],),
  SuperHeroesQuestionModel(imageUrl: 'https://theaveng3rs.wordpress.com/wp-content/uploads/2015/05/4506760-1624744-jim622_varcov_col.jpg',answer: 'Thor',options: ['Odin', 'Thor', 'Loki', 'Zeus'],),
  SuperHeroesQuestionModel(imageUrl: 'https://imgcdn.stablediffusionweb.com/2024/10/24/d6a47fb5-4d32-4d64-b20a-dc532b2826e4.jpg',answer: 'Ironman',options: ['Robotman', 'Ironman', 'Steelman', 'Tony'],),
];

  String getImageUrlText(){
    return superHeroesList[superIndex].imageUrl;
  }

  String getAnswer(){
    return superHeroesList[superIndex].answer;
  }
  
  void nextQuestion(){
    if (superIndex <superHeroesList.length-1){
      superIndex++;
    }else{
      isFinished = true;
    }
  }

  bool isFinishedFunc(){
    return isFinished;
  }
  
  String getOptionsText(int i){
    return superHeroesList[superIndex].options[i];
  }

  void restartQuiz(){
    superIndex = 0;
    isFinished = false;
  }
}