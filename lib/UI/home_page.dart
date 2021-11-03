import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rally_pedia_app/UI/theme.dart';
import 'package:rally_pedia_app/UI/widgets/show_cars.dart';
import 'package:rally_pedia_app/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CarsShow(),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Cars")
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      // return ListView(children: [
                      //   snapshot.data.documents.map((document))
                      // ],)
                      return Expanded(child: _buildList(snapshot.data));
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        SizedBox(
          width: 20,
        )
      ],
    );
  }

  Widget _buildList(QuerySnapshot snapshot) {
    return ListView.builder(
      itemCount: snapshot.docs.length,
      itemBuilder: (context, index) {
        final doc = snapshot.docs[index];
        return Container(
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: primaryClr),
          child: GestureDetector(
            child: ListTile(
              onTap: () => print(doc["Name"]),
              title: Text(
                doc["Name"],
                style: subHeadingStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
