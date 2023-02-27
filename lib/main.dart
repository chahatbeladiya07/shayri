import 'package:flutter/material.dart';
import 'catagory.dart';
import 'config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List list=List.filled(Config.catagory.length, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
          title: Text("Love Shayri"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white70,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: Config.photos.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap:() {
                setState(() {
                  list[index]=true;
                });
              },
              onTapUp:(details){
                list[index]=false;
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => catagorys(index),));
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: 9,left: 8,right: 8),
                child: ListTile(
                  selectedTileColor: Colors.pink,
                  selected: list[index],
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 10,top: 5,bottom: 5),
                      child: Image.asset("assets/lists/${Config.photos[index]}"),
                    ),
                  title: Text("${Config.catagory[index]}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.green),),
                  trailing: Icon(Icons.navigate_next_outlined,color: Colors.white,),
                ),
              ),

            );
          },
        ),
      ),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.black12,
              child: Image.asset("assets/banner_hanumanji.png",),
          ),
        ],
      ),
    );
  }
}


