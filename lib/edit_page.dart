import 'dart:io';
import 'dart:math';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'config.dart';
import 'package:permission_handler/permission_handler.dart';

class edit_page extends StatefulWidget {
  String shayri;
  String emojies;
  edit_page(this.shayri, this.emojies);
  @override
  State<edit_page> createState() => _edit_pageState();
}

class _edit_pageState extends State<edit_page> {
  Color bgcolor = Colors.red;
  Color textcolor = Colors.white;
  String textfamily = 'text0';
  String emojies = "";
  double fontSize = 25;
  bool single_color = true;
  List<Color> current_gradiant = [
    const Color(0xff415808),
    const Color(0xffC858C8),
    const Color(0xffFFCC78)
  ];
  WidgetsToImageController Img_controller = WidgetsToImageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emojies = widget.emojies;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text("Photo pe shayri"),
      ),
      body: Column(
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
                Padding(
                  padding: const EdgeInsets.only(right: 9, left: 9, top: 6),
                  child: WidgetsToImage(
                    controller: Img_controller,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      // margin: const EdgeInsets.only(right: 9,left: 9,top: 6),
                      // color: bgcolor,
                      decoration: BoxDecoration(
                        color: single_color ? bgcolor : null,
                        gradient: single_color
                            ? null
                            : LinearGradient(colors: current_gradiant),
                      ),
                      child: Text(
                        "$emojies\n ${widget.shayri}\n $emojies",
                        style: TextStyle(
                            color: textcolor,
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                            fontFamily: textfamily),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
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
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.only(
                      top: 2, bottom: 5, left: 110, right: 110),
                  height: 38,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Image.asset("assets/3rd_page/reload.png"),
                        onTap: () {
                          single_color = false;
                          int random = Random()
                                  .nextInt(Config.grediant_colors.length - 0) +
                              0;
                          current_gradiant = Config.grediant_colors[random];
                          setState(() {});
                        },
                      ),
                      const SizedBox(),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            context: context,
                            isDismissible: false,
                            isScrollControlled: true,
                            builder: (context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height - 90,
                                child: GridView.builder(
                                  itemCount: Config.grediant_colors.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        single_color = false;
                                        current_gradiant =
                                            Config.grediant_colors[index];
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors:
                                                Config.grediant_colors[index],
                                          ),
                                        ),
                                        child: const Text(
                                          "💕❤️😊😘❣️💞💓💗💖💘 \n Pyar Mohabbat Shayri \n 💕❤️😊😘❣️💞💓💗💖💘",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Image.asset("assets/3rd_page/expand.png"),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            barrierColor: Colors.transparent,
                            builder: (context) {
                              return Container(
                                height: 150,
                                color: Colors.white,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      alignment: Alignment.center,
                                      color: Colors.white24,
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      child: GridView.builder(
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 8,
                                                mainAxisSpacing: 10,
                                                crossAxisSpacing: 10),
                                        itemCount: Config.clr.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              single_color = true;
                                              bgcolor = Config.clr[index];
                                              setState(() {});
                                            },
                                            child: Container(
                                              color: Config.clr[index],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        child: Image.asset(
                                            "assets/3rd_page/close.png",
                                            height: 30),
                                        onTap: () {
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
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 15),
                          child: const Text(
                            "Background",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              height: 150,
                              color: Colors.white,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    color: Colors.white24,
                                    width:
                                        MediaQuery.of(context).size.width - 40,
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 8,
                                              mainAxisSpacing: 10,
                                              crossAxisSpacing: 10),
                                      itemCount: Config.clr.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              textcolor = Config.clr[index];
                                            });
                                          },
                                          child: Container(
                                            color: Config.clr[index],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      child: Image.asset(
                                          "assets/3rd_page/close.png",
                                          height: 30),
                                      onTap: () {
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
                        margin: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 15),
                        child: const Text(
                          "Text Color",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    )),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final bytes = await Img_controller.capture();
                          var path = await ExternalPath
                              .getExternalStoragePublicDirectory(
                                  ExternalPath.DIRECTORY_DCIM);
                          print(path);
                          DateTime current = DateTime.now();
                          String imgName = "IMG_${current.year}${current.month}"
                              "${current.day}${current.hour}${current.minute}"
                              "${current.second}${current.millisecond}.jpg";
                          Directory direc = Directory("$path/shayri");
                          var status = await Permission.storage.status;
                          print(status);
                          if (status.isDenied) {
                            Map<Permission, PermissionStatus> statuses = await [
                              Permission.storage,
                            ].request();
                            print(statuses[Permission.storage]);
                            if (statuses[Permission.storage] ==
                                PermissionStatus.granted) {
                              print(statuses[Permission.storage]);
                              if (!direc.existsSync()) {
                                print("directory not available");
                                direc.createSync();
                              } else {
                                print("directory available");
                              }
                              File f = File('${direc.path}/${imgName}');
                              f.createSync();
                              f.writeAsBytesSync(bytes!);
                              Share.shareFiles(['${direc.path}/${imgName}']);
                            }
                          } else {
                            Map<Permission, PermissionStatus> statuses = await [
                              Permission.storage,
                            ].request();
                            if (statuses[Permission.storage] ==
                                PermissionStatus.granted) {
                              print(statuses[Permission.storage]);
                              if (!direc.existsSync()) {
                                print("directory not available");
                                direc.createSync();
                              } else {
                                print("directory available");
                              }
                              File f = File('${direc.path}/${imgName}');
                              f.createSync();
                              f.writeAsBytesSync(bytes!);
                              Share.shareFiles(['${direc.path}/${imgName}']);
                            }
                          }
                          // var storage_permission = await Permission.storage.request();
                          // print(storage_permission);
                          // if(storage_permission.isGranted){
                          //   print("already granted");
                          //   if(!direc.existsSync()){
                          //     print("directory not available");
                          //     direc.createSync();
                          //   } else {
                          //     print("directory available");
                          //   }
                          //   File f=File('${direc.path}/${imgName}');
                          //   f.createSync();
                          //   f.writeAsBytesSync(bytes!);
                          //   Share.shareFiles(['${direc.path}/${imgName}']);
                          // }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.red,
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 15),
                          child: const Text(
                            "Share",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isDismissible: false,
                            barrierColor: Colors.transparent,
                            builder: (context) {
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
                                      width: MediaQuery.of(context).size.width -
                                          40,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: Config.texts.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              textfamily = Config.texts[index];
                                              setState(() {});
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.only(
                                                  left: 7, right: 7),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 55,
                                                      horizontal: 10),
                                              alignment: Alignment.center,
                                              color: Colors.pinkAccent,
                                              child: Text(
                                                "Shayri",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  fontFamily:
                                                      Config.texts[index],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: InkWell(
                                        child: Image.asset(
                                            "assets/3rd_page/close.png",
                                            height: 30),
                                        onTap: () {
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
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: const Text(
                            "Font",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isDismissible: false,
                          barrierColor: Colors.transparent,
                          builder: (context) {
                            return Container(
                              color: Colors.black87,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 300,
                                    width:
                                        MediaQuery.of(context).size.width - 50,
                                    child: ListView.separated(
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            if (Config.emoji[index] ==
                                                "Without Emoji") {
                                              emojies = "";
                                            } else {
                                              emojies = Config.emoji[index];
                                            }
                                            setState(() {});
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            alignment: Alignment.center,
                                            child: Text(
                                              Config.emoji[index],
                                              style:
                                                  const TextStyle(fontSize: 17),
                                            ),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                              color: Colors.white,
                                              thickness: 1.5),
                                      itemCount: Config.emoji.length,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: InkWell(
                                      child: Image.asset(
                                        "assets/3rd_page/close.png",
                                        height: 30,
                                      ),
                                      onTap: () {
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
                        margin: const EdgeInsets.only(
                            right: 10, left: 10, bottom: 10),
                        child: const Text(
                          "Emoji",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                    )),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.black87,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState1) {
                                  return Slider(
                                    activeColor: Colors.pink[300],
                                    inactiveColor: Colors.grey,
                                    value: fontSize,
                                    max: 50,
                                    min: 10,
                                    onChanged: (value) {
                                      setState(() {
                                        setState1(() {
                                          fontSize = value;
                                        });
                                      });
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          color: Colors.red,
                          margin: const EdgeInsets.only(
                              right: 10, left: 10, bottom: 10),
                          child: const Text(
                            "Text Size",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
