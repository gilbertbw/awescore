import 'dart:html';

void main() {
  querySelector("#sample_text_id")
    ..text = "Click me!"
    ..onClick.listen(reverseText);
  
  User gilbert = new User("gilbertbw", 12.34, 3.42);
  
  print(gilbert.score);
  
}

void reverseText(MouseEvent event) {
  var text = querySelector("#sample_text_id").text;
  var buffer = new StringBuffer();
  for (int i = text.length - 1; i >= 0; i--) {
    buffer.write(text[i]);
  }
  querySelector("#sample_text_id").text = buffer.toString();
}

class User {
  final String username;
  int _score;
  int _change;
  
  User(this.username, score, change) {
    num scoreDec = score*100;
    this._score = scoreDec.toInt();
    
    num changeDec = change*100;
    this._change = changeDec.toInt();
  }
  
  num get score {
    num score = this._score.toDouble();
    return score/100;
  }
}