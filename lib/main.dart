import 'package:flutter/material.dart';
import 'package:shayri/catagory.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.6),
          title: Text("Love Shayri"),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white70,size: 27,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Container(
        color: Colors.black12,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: Config.photos.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => catagorys(index)));
              },
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 9,left: 8,right: 8),
                child: ListTile(
                  hoverColor: Colors.pinkAccent,
                    leading: Padding(
                      padding: const EdgeInsets.only(right: 10,top: 5,bottom: 5),
                      child: Image.asset("assets/lists/${Config.photos[index]}"),
                    ),
                  title: Text("${Config.catagory[index]}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.green),),
                  trailing: Icon(Icons.navigate_next_outlined,color: Colors.white,),
                ),
               // child: Row(
                //   children: [
                //     Padding(
                //       padding: EdgeInsets.all(5),
                //       child: Image.asset("assets/lists/${Lists1.photos[index]}",height: 35,),
                //     ),
                //     SizedBox(width: 10,),
                //     Text("${Lists1.title[index]} Shayri",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                //   ],
                // ),
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


