import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  void speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Voice Learning App"),
        backgroundColor: Colors.deepPurple,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AlphabetsPage(flutterTts)),
              );
            },
            child: Card(
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Alphabets",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => NumbersPage(flutterTts)),
              );
            },
            child: Card(
              color: Colors.green,
              child: Center(
                child: Text(
                  "Numbers",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ColorsPage(flutterTts)),
              );
            },
            child: Card(
              color: Colors.red,
              child: Center(
                child: Text(
                  "Colors",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AnimalsPage(flutterTts)),
              );
            },
            child: Card(
              color: Colors.orange,
              child: Center(
                child: Text(
                  "Animals",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlphabetsPage extends StatelessWidget {
  final FlutterTts flutterTts;

  AlphabetsPage(this.flutterTts);

  void speakAlphabet(String letter, String word) async {
    await flutterTts.speak("$letter for $word");
  }

  @override
  Widget build(BuildContext context) {
    List<String> letters = [
      'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
      'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
      'U', 'V', 'W', 'X', 'Y', 'Z'
    ];
    List<String> words = [
      'Apple', 'Ball', 'Cat', 'Dog', 'Elephant', 'Fish', 'Guitar', 'Hat', 'Ice', 'Jug',
      'Kite', 'Lion', 'Monkey', 'Nest', 'Orange', 'Parrot', 'Queen', 'Rat', 'Sun', 'Tiger',
      'Umbrella', 'Violin', 'Water', 'Xylophone', 'Yak', 'Zebra'
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Alphabets")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 26,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              speakAlphabet(letters[index], words[index]);
            },
            child: Card(
              color: Colors.primaries[index % Colors.primaries.length],
              child: Center(
                child: Text(
                  '${letters[index]} for ${words[index]}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class NumbersPage extends StatelessWidget {
  final FlutterTts flutterTts;

  NumbersPage(this.flutterTts);

  void speakNumber(String number) async {
    await flutterTts.speak(number);
  }

  @override
  Widget build(BuildContext context) {
    List<String> numbers = List.generate(100, (index) => '${index + 1}');

    return Scaffold(
      appBar: AppBar(title: Text("Numbers")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: numbers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              speakNumber(numbers[index]);
            },
            child: Card(
              color: Colors.teal,
              child: Center(
                child: Text(
                  numbers[index],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ColorsPage extends StatelessWidget {
  final FlutterTts flutterTts;

  ColorsPage(this.flutterTts);

  void speakColor(String color) async {
    await flutterTts.speak(color);
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.red, Colors.green, Colors.blue, Colors.yellow, Colors.orange,
      Colors.purple, Colors.pink, Colors.brown, Colors.teal, Colors.indigo
    ];

    List<String> colorNames = [
      'Red', 'Green', 'Blue', 'Yellow', 'Orange', 'Purple', 'Pink', 'Brown', 'Teal', 'Indigo'
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Colors")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              speakColor(colorNames[index]);
            },
            child: Card(
              color: colors[index],
              child: Center(
                child: Text(
                  colorNames[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AnimalsPage extends StatelessWidget {
  final FlutterTts flutterTts;

  AnimalsPage(this.flutterTts);

  void speakAnimal(String animal) async {
    await flutterTts.speak(animal);
  }

  @override
  Widget build(BuildContext context) {
    List<String> animals = [
      'Cat', 'Dog', 'Elephant', 'Lion', 'Tiger', 'Monkey', 'Giraffe', 'Horse', 'Bear', 'Zebra'
    ];

    return Scaffold(
      appBar: AppBar(title: Text("Animals")),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(animals[index]),
            onTap: () {
              speakAnimal(animals[index]);
            },
          );
        },
      ),
    );
  }
}
