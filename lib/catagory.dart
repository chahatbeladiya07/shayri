import 'package:flutter/material.dart';
import 'package:shayri/mainshayri.dart';
import 'config.dart';

class catagorys extends StatefulWidget {
  var pos;
  catagorys(this.pos);

  @override
  State<catagorys> createState() => _catagorysState();
}

class _catagorysState extends State<catagorys> {
  List <String>list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.pos == 0) {
      list = Config.shubhkamna;
    } else if (widget.pos == 1) {
      list = Config.dosti;
    } else if (widget.pos == 2) {
      list = Config.majedar;
    } else if (widget.pos == 3) {
      list = Config.bhagwan;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.withOpacity(0.6),
        title: Text("${Config.catagory[widget.pos]}"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
                color: Colors.white70,
                size: 27,
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Container(
        color: Colors.black12,
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.pinkAccent,
              margin: EdgeInsets.only(top: 9, left: 8, right: 8),
              child: ListTile(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => mainshayri(list,index,Config.catagory[widget.pos]),));
                },
                leading: Padding(
                  padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
                  child:
                      Image.asset("assets/lists/${Config.photos[widget.pos]}"),
                ),
                title: Text("${Config.title1[index]}"),
                subtitle: Text("${list[index]}", maxLines: 1,),
                trailing: Icon(Icons.navigate_next_rounded),
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
          ),
        ],
      ),
    );
  }
}
