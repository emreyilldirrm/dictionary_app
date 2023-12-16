import 'package:dictionary_app/Detail_page.dart';
import 'package:dictionary_app/Word_D_A_O.dart';
import 'package:dictionary_app/Words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool Searching_in_progress=false;
  String Searching_word="";



  Future<List<Words>>show_all_words() async{
    var word_list = words_D_A_O().bring_all_words();

    return word_list;
  }

  Future<List<Words>>filter_words(String filter) async{
    var word_list = words_D_A_O().filter_char(filter);

    return word_list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:Searching_in_progress ?
            TextField(
              decoration: InputDecoration(hintText: "Aramak için kelime giriniz"),
              onChanged: (searching_word_now){
                setState(() {
                  Searching_word = searching_word_now;
                  print(Searching_word);
                });
              },
            )
            :Text("Dictionary"),
        actions: [Searching_in_progress ?
          IconButton(
          onPressed: (){
              setState(() {
              Searching_in_progress=false;
              Searching_word="";
              });
              },
              icon: Icon(Icons.cancel))
          :IconButton(
              onPressed: (){
                    setState(() {
                      Searching_in_progress=true;
                    });
              },
              icon: Icon(Icons.search))
          ,

        ],
      ),
      body: FutureBuilder<List<Words>>(
        future: Searching_in_progress ?filter_words(Searching_word)
            :show_all_words(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            var word_list =snapshot.data;

            return ListView.builder(
                itemCount: word_list!.length,
                itemBuilder: (context, index) {
                   var word = word_list[index];

                   return GestureDetector(
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => Detail_page(word:word),));
                     },
                     child: SizedBox(
                       height: 50,
                       child: Card(
                              child:Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(word.ingilizce),
                                    Text(word.turkce),
                                  ]) ,),
                     ),
                   );

                },);

          }else{
            return Center();
          }

        },
      ),
    );
  }
}
