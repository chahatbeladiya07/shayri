import 'dart:math';

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
  bool single_color=true;
  List<Color> current_gradiant= [Color (0xff415808), Color(0xffC858C8), Color (0xffFFCC78)];
  PageController? page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page=PageController(
      initialPage: widget.newIndex,
    );
  }
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
                  InkWell(
                    onTap: (){
                      showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        barrierColor: Colors.transparent,
                        isScrollControlled: true,
                        builder:(context) {
                        return Container(
                          height: MediaQuery.of(context).size.height-85,
                          child: GridView.builder(
                            itemCount: Config.grediant_colors.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                            itemBuilder: (context, index) {

                              return InkWell(
                                onTap: (){
                                  single_color=false;
                                  current_gradiant=Config.grediant_colors[index];
                                  setState(() {

                                  });
                                },
                                child: Container(
                                  child: Text(""),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors:Config.grediant_colors[index],
                                    ),
                                  ),
                                ),
                              );
                            },

                          ),
                        );
                      },);
                    },
                    child: Image.asset("assets/3rd_page/expand.png"),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("${widget.newIndex + 1}/${widget.shayri.length}",
                      style: TextStyle(fontSize: 18, color: Colors.green[700])),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      child: Image.asset("assets/3rd_page/reload.png"),
                    onTap: (){
                        single_color=false;
                        int random=Random().nextInt(Config.grediant_colors.length-0)+0;
                        current_gradiant=Config.grediant_colors[random];
                        setState(() {

                        });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: PageView.builder(
                  controller: page,
                          onPageChanged: (value) {
                            setState(() {
                              widget.newIndex=value;
                            });
                          },
                          itemCount:widget.shayri.length,
                  itemBuilder: (context, index) {
                  return  ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(8),
                        // color: Colors.pink[300],
                        decoration: BoxDecoration(
                          color: single_color?Colors.pink:null,
                          gradient: single_color?null:LinearGradient(
                              colors: current_gradiant,
                          )
                        ),
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
                  );
                },)
                ),
            // Expanded(
            //     child:ListView(
            //       shrinkWrap: true,
            //       children: [
            //       PageView.builder(
            //         controller: page,
            //         onPageChanged: (value) {
            //           setState(() {
            //             widget.newIndex=value;
            //           });
            //         },
            //         itemCount:widget.shayri.length,
            //         itemBuilder: (context, index) {
            //             return  Text(
            //                 "${Config.emoji[widget.newIndex]} \n ${widget.shayri[widget.newIndex]}\n ${Config.emoji[widget.newIndex+1]}",
            //                 textAlign: TextAlign.center,
            //                 style: TextStyle(
            //                   fontSize: 22,
            //                   color: Colors.white,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               );
            //         },
            //     ),
            //   ],
            //     ),
            //   ),
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
                            page!.jumpToPage(widget.newIndex);
                          }
                        },
                        child: Image.asset("assets/3rd_page/ic_action_previous.png"),
                    ),
                    InkWell(
                        child: Image.asset("assets/3rd_page/pencil2.png"),
                      onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>
                              edit_page("${widget.shayri[widget.newIndex]}","${Config.emoji[widget.newIndex]}"),));
                        }),
                    InkWell(
                        onTap: () {
                          if (widget.newIndex < widget.shayri.length - 1) {
                            widget.newIndex++;
                            page!.jumpToPage(widget.newIndex);
                          }
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
