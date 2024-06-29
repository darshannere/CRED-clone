import 'package:cred/Categories.dart';
import 'package:flutter/material.dart';
import 'costum_button.dart';

const primaryGradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(0, 0, 0, 1), Color.fromRGBO(0, 0, 0, 1)],
);
const TextStyle splashHeadingTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w800,
  color: Colors.white,
);

class HOMe extends StatelessWidget {
  // ignore: non_constant_identifier_names
  HOMe({Key? key, required this.content}) : super(key: key);

  final Category content;

  String get img => content.image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // To take all screen's height
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(gradient: primaryGradientColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(45, 0, 0, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          height: 250,
                          width: 150,

                          // 50 percent of screen's height
                          child: Image.asset('assets/images/$img.png'),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            child: Text(
                              content.name,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              content.description,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              CustomButton(
                backgroundColor: Colors.white,
                forgroundColor: Colors.black,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListV(),
                    )),
                title: "Go to category →",
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
