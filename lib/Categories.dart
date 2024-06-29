import 'dart:math';

import 'package:cred/Home.dart';
import 'package:flutter/material.dart';
import 'package:cred/data.dart';

class ListV extends StatefulWidget {
  ListV({Key? key}) : super(key: key);

  @override
  State<ListV> createState() => _ListVState();
}

class Category {
  final String name;
  final String image;
  final String description;

  Category(this.name, this.image, this.description);
}

TextStyle tstyle = const TextStyle(fontSize: 14, color: Colors.white);
TextStyle descstyle = const TextStyle(fontSize: 10.5, color: Colors.grey);

class _ListVState extends State<ListV> {
  bool isGrid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),

            Container(
              padding: const EdgeInsets.only(
                left: 23,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                'explore',
                style: descstyle,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 22,
                  ),
                  child: const Text('CRED',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.55),
                Switch(
                  value: isGrid,
                  onChanged: (bool newValue) {
                    setState(() {
                      isGrid = newValue;
                    });
                  },
                )
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];
                  final type = category['type'];
                  final contents = category['contents'] as List<Category>;
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 23,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$type',
                          style: descstyle,
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 100),
                        child: isGrid
                            ? Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.6,
                                    mainAxisSpacing: 0,
                                    crossAxisCount:
                                        4, // Set the cross-axis count to 4
                                  ),
                                  shrinkWrap: true,
                                  itemCount: contents.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    Category content = contents[i];
                                    final name = content.name;
                                    final image = content.image;
                                    return GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          // ignore: unnecessary_null_comparison
                                          builder: (context) => content != null
                                              ? HOMe(
                                                  content: content,
                                                )
                                              : Container(),
                                        ),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            FittedBox(
                                                fit: BoxFit.contain,
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  height: 120,
                                                  width: 120,
                                                  padding:
                                                      const EdgeInsets.all(9),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 76, 75, 75)),
                                                  ),
                                                  child: Image.asset(
                                                      'assets/images/$image.png'),
                                                )),
                                            Text(
                                              name,
                                              textAlign: TextAlign
                                                  .center, // Set the text alignment to center
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: contents.length,
                                itemBuilder: (BuildContext cont, int i) {
                                  Category content = contents[i];
                                  final name = content.name;
                                  final image = content.image;
                                  final description = content.description;
                                  return GestureDetector(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        // ignore: unnecessary_null_comparison
                                        builder: (context) => content != null
                                            ? HOMe(
                                                content: content,
                                              )
                                            : Container(),
                                      ),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.all(20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                              fit: BoxFit.cover,
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: 80,
                                                width: 80,
                                                padding:
                                                    const EdgeInsets.all(9),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255, 76, 75, 75)),
                                                ),
                                                child: Image.asset(
                                                    'assets/images/$image.png'),
                                              )),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                padding: EdgeInsets.all(6),
                                                width: 230,
                                                // padding:
                                                //     const EdgeInsets.all(6.0),
                                                child: Text(
                                                  name,
                                                  textAlign: TextAlign
                                                      .left, // Set the text alignment to center
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(6),
                                                alignment: Alignment.centerLeft,
                                                width: 230,
                                                // padding:
                                                //     const EdgeInsets.all(6.0),
                                                child: Text(description,
                                                    textAlign: TextAlign
                                                        .left, // Set the text alignment to center
                                                    style: descstyle),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
            // Implement the list of categories/subcategories and layout toggle button here
          ],
        ),
      ),
    );
  }
}
