import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String enteredNumber = '';
  Widget resultText = Text(
    'Trivia about your number', 
    textAlign: TextAlign.center, 
    style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
    );

  Future<String> fetchTrivia(String number) async{
    final response = await http.get(Uri.parse('http://numbersapi.com/${number}'));
    return response.body;
  }

  getTrivia(String number){
    setState(() {
      resultText = FutureBuilder(
        future: fetchTrivia(number),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting){
            return Container(
                        color: Colors.grey[850],
                        child: Center(
                          child: SpinKitFadingCircle(
                            color: Colors.white,
                            size: 50,
                          ),
                        )
                    );
          } else if (snapshot.hasData) {
            return Text(
              snapshot.data.toString(), 
              textAlign: TextAlign.center, 
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SedgwickAve',
                fontSize: 35,
                
              ),
              );
          } else {
            return Text(
              'An Error has occured!', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                color: Colors.white,
              ),
              );
          }
        }
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Number Trivia App', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  hintText: 'Enter any integer',
                  hintStyle: TextStyle(color: Colors.grey[800], fontSize: 20),
      
                ),
                onChanged: (val){
                  if(int.tryParse(val)!=null){
                    setState(() {
                      enteredNumber = val;
                    });
                  } else{
                    setState(() {
                      enteredNumber = '';
                    });
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey),),
                child: Text('Enter', style: TextStyle(fontSize: 30),),
                onPressed: (){
                  if(int.tryParse(enteredNumber)!=null){
                    getTrivia(enteredNumber);
                  } else{
                    setState(() {
                      resultText = Text(
                        'Invalid Input', 
                        textAlign: TextAlign.center, 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          ),
                        );
                    });
                  }
      
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: resultText,
            ),
          ],
          ),
      ),
    );
  }
}
