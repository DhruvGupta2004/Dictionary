import 'package:dictionary/services/dictClient.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _HomePageState();
}

class _HomePageState extends State<homepage> {

  DictClient dClient = DictClient();

  TextEditingController tc = TextEditingController();

  String meaning = 'null';

  // void initState(){
  //
  //   print("i was called first");
  //   super.initState();
  // }

  _callAPI(q) async{

    print("the api is called with api word $q");

    meaning = await dClient.searchForWord(query: q);
    dClient.searchForWord(query: q);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("DICTIONARY"),
            centerTitle: true,
          ),


          drawer: Drawer(
            child: DrawerHeader(
              child: SizedBox(
                height: MediaQuery.of(context).size.height *0.01 ,
                child:  Container(
                  child: Column(
                    children: [
                      ListTile(
                        tileColor: Colors.green,
                        title: Text("My_Profile"),
                        onTap:(){
                          print("my profile is clicked");
                        },
                      ),

                      ListTile(
                        title: Text("Home"),
                      ),

                      ListTile(
                        title: Text("Settings"),
                      ),

                      ListTile(
                        title: Text("Logout"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),


          body: SizedBox(
            // color: Colors.teal,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    controller: tc,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.clear)),
                        label: const Text("DICT"),
                        hintText: "Enter a Word Here"),
                    // style: ,
                    keyboardType: TextInputType.text,
                    onChanged: (string) {
                      // print(textfield.text); //controller--> text
                      print("This is the text from the textfield $string");
                    },
                    onEditingComplete: () {
                      // print(
                      //     // "this is the final submission from the textfield ${txtfld.text}");
                    },
                  ),

                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                      overlayColor: MaterialStateProperty.all(Colors.blue)
                    ),
                      onPressed:(){
                      _callAPI(tc.text);
                      } , child: const Text("Search")
                  ),

                  Container(
                    color: Colors.yellow,
                    height: 200,
                    width: 300,
                    child: Center(
                      child: Text(
                          meaning,
                          style:const TextStyle(fontSize: 25)
                      ),
                    )
                  )
                ],

              ),
            ),
          ),
        ));
  }
}
