import 'dart:math';
import 'package:flutter/material.dart';
import 'config.dart';

class Edit_page extends StatefulWidget {
  String shayri;
  Edit_page(this.shayri);
  @override
  State<Edit_page> createState() => _Edit_pageState();
}
class _Edit_pageState extends State<Edit_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Photo pe shayri"),
      ),
      body:Column(
        children: [
          Container(
            color: Colors.black12,
            height: 50,
            width: double.infinity,
          ),
          Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Text("${widget.shayri}",
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.only(right: 9,left: 9,top: 6),
                    color: Colors.red,
                  ),
                ],
              ),
          ),
          Container(
            height: 132,
            width: double.infinity,
            color: Colors.black87,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset("assets/3rd_page/reload.png"),
                      SizedBox(),
                      Image.asset("assets/3rd_page/expand.png"),
                    ],
                  ),
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.only(top: 2,bottom: 5,left: 110,right: 110),
                  height: 38,
                  color: Colors.white,
                ),
                Row(
                  children:[
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                height: 150,
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      color: Colors.white24,
                                      width: MediaQuery.of(context).size.width-40,
                                      child: GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 8,
                                          mainAxisSpacing: 10,
                                          crossAxisSpacing: 10
                                        ),
                                        itemCount: 120,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        child: Image.asset("assets/3rd_page/close.png",height: 30),
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            color: Colors.red.shade600,
                            margin: EdgeInsets.only(right: 10,left: 10,bottom: 15),
                            child: Text("Background",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                    ),
                        )
                    ),
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                height: 150,
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      color: Colors.white24,
                                      width: MediaQuery.of(context).size.width-40,
                                      child: GridView.builder(
                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 8,
                                            mainAxisSpacing: 10,
                                            crossAxisSpacing: 10
                                        ),
                                        itemCount: 120,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              color: Colors.primaries[Random().nextInt(Colors.primaries.length)]
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        child: Image.asset("assets/3rd_page/close.png",height: 30),
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ),

                                  ],
                                ),
                              );
                            },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            color: Colors.red,
                            margin: EdgeInsets.only(right: 10,left: 10,bottom: 15),
                            child: Text("Text Color",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 10,left: 10,bottom: 15),
                          child: Text("Share",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                height: 150,
                                color: Colors.white,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // padding: EdgeInsets.symmetric(vertical: 55),
                                        alignment: Alignment.center,
                                        color: Colors.white24,
                                        width: MediaQuery.of(context).size.width-40,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 12,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.only(left: 7,right: 7),
                                                margin: EdgeInsets.symmetric(vertical: 55,horizontal: 10),
                                                alignment: Alignment.center,
                                                color: Colors.pinkAccent,
                                                child: Text("Shayri",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                                              );
                                            },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: InkWell(
                                          child: Image.asset("assets/3rd_page/close.png",height: 30),
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                              );
                            },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            color: Colors.red.shade600,
                            margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
                            child: Text("Font",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                          ),
                        )
                    ),
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) {
                              return Container(
                                  color: Colors.black87,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 5,),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 300,
                                      width: MediaQuery.of(context).size.width-50,
                                      child:
                                       ListView.separated(
                                        itemBuilder: (context, index) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(vertical: 15),
                                            alignment: Alignment.center,
                                            child: Text("${Config.emoji[index]}",style: TextStyle(fontSize: 17),),
                                          );
                                        },
                                          separatorBuilder: (context, index) =>
                                              Divider(color: Colors.white,thickness:1.5),
                                          itemCount: Config.emoji.length,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                          child: Image.asset("assets/3rd_page/close.png",height: 30,),
                                        onTap: (){
                                            Navigator.pop(context);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 30,
                            color: Colors.red,
                            margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
                            child: Text("Emoji",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                          ),
                        )
                    ),
                    Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.red,
                          margin: EdgeInsets.only(right: 10,left: 10,bottom: 10),
                          child: Text("Text Size",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                        ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ) ,
    );
  }
}
