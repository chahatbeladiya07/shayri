import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shayri/config.dart';
import 'edit_page.dart';

class mainshayri extends StatefulWidget {
  List shayri;
  int newIndex;
  String appbar_title;
  mainshayri(this.shayri, this.newIndex, this.appbar_title);
  @override
  State<mainshayri> createState() => _mainshayriState();
}
class _mainshayriState extends State<mainshayri> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.appbar_title}"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 7),
        child: Column(
          children: [
            Container(
              height: 33,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/3rd_page/expand.png"),
                  SizedBox(
                    width: 20,
                  ),
                  Text("${widget.newIndex + 1}/${widget.shayri.length}",
                      style: TextStyle(fontSize: 18, color: Colors.green[700])),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset("assets/3rd_page/reload.png")
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(4),
                    width: double.infinity,
                    color: Colors.pink[600],
                    child: Text(
                      "${Config.emoji[widget.newIndex]} \n ${widget.shayri[widget.newIndex]}\n ${Config.emoji[widget.newIndex+1]}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        FlutterClipboard.copy(
                          "${Config.emoji[widget.newIndex]} \n ${widget.shayri[widget.newIndex]}\n ${Config.emoji[widget.newIndex+1]}",
                        ).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Copied"))));
                      },
                        child: Image.asset("assets/3rd_page/copy1.png")),
                    InkWell(
                        onTap: () {
                          if (widget.newIndex > 0) {
                            widget.newIndex--;
                          }
                          setState(() {});
                        },
                        child: Image.asset("assets/3rd_page/ic_action_previous.png"),
                    ),
                    InkWell(
                        child: Image.asset("assets/3rd_page/pencil2.png"),
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              Edit_page("${Config.emoji[widget.newIndex]} \n "
                                  "${widget.shayri[widget.newIndex]}\n ${Config.emoji[widget.newIndex+1]}",
                          ),));
                        }),
                    InkWell(
                        onTap: () {

                          if (widget.newIndex < widget.shayri.length - 1) {
                            widget.newIndex++;
                          }
                          setState(() {});
                        },
                        child: Image.asset("assets/3rd_page/ic_action_next_item.png")),
                    InkWell(
                      onTap: () async{
                       await Share.share("${Config.emoji[widget.newIndex]} \n "
                            "${widget.shayri[widget.newIndex]}\n ${Config.emoji[widget.newIndex+1]}");
                      },
                        child: Image.asset("assets/3rd_page/ic_action_share.png")),
                  ],
                ),
              ),
            ),
          ],
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
