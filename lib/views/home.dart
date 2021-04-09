import 'package:flutter/material.dart';
import 'package:user/services/database.dart';

import 'package:user/views/quiz_play.dart';
import 'package:user/widget/drawer.dart';
import 'package:user/widget/widget.dart';

class Home extends StatefulWidget {
  static const idscreen = '/Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Stream quizStream;
  DatabaseService databaseService = new DatabaseService();

  Widget quizList() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       IconButton(
          //         icon: Icon(Icons.menu),
          //         onPressed: (){
          //           Navigato
          //         },
          //       ),
          //       RichText(
          //         text: TextSpan(
          //           style: TextStyle(fontSize: 22),
          //           children: <TextSpan>[
          //             TextSpan(
          //               text: 'Honesty',
          //               style: TextStyle(
          //                 fontWeight: FontWeight.w600,
          //                 color: Colors.black54,
          //                 fontSize: 30,
          //               ),
          //             ),
          //             TextSpan(
          //                 text: ' 2.0',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.w600,
          //                   color: Colors.blue,
          //                   fontSize: 30,
          //                 )),
          //           ],
          //         ),
          //       ),
          //       IconButton(
          //         icon: Icon(Icons.more_vert),
          //         onPressed: null,
          //       )
          //     ],
          //   ),
          // ),
          StreamBuilder(
            stream: quizStream,
            builder: (context, snapshot) {
              return snapshot.data == null
                  ? Container()
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: QuizTile(
                            noOfQuestions: snapshot.data.documents.length,
                            imageUrl: snapshot
                                .data.documents[index].data['quizImgUrl'],
                            title: snapshot
                                .data.documents[index].data['quizTitle'],
                            description:
                                snapshot.data.documents[index].data['quizDesc'],
                            id: snapshot.data.documents[index].data["quizId"],
                          ),
                        );
                      });
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    databaseService.getQuizData().then((value) {
      quizStream = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawerwidget(),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Center(child: AppLogo()),
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
        //brightness: Brightness.li,
      ),

      body: quizList(),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => CreateQuiz()));
      //   },
      // ),
    );
  }
}

class QuizTile extends StatelessWidget {
  final String imageUrl, title, id, description;
  final int noOfQuestions;

  QuizTile(
      {@required this.title,
      @required this.imageUrl,
      @required this.description,
      @required this.id,
      @required this.noOfQuestions});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuizPlay(id)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        height: 150,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                color: Colors.black26,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        description,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
