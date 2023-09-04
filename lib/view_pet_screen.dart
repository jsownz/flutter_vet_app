import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vet_app/constants.dart';

class ViewPetScreen extends StatefulWidget {
  final String petName;
  final List<String> petImages;
  const ViewPetScreen(
      {super.key, required this.petName, required this.petImages});

  @override
  State<ViewPetScreen> createState() => _ViewPetScreenState();
}

class _ViewPetScreenState extends State<ViewPetScreen> {
  int selectedPage = 0;
  final controller = PageController(
    initialPage: 0,
  );

  List<Map> notesMap = [
    {
      "isAlert": false,
      "date": "19/06/23",
      "note": "Buy dietary food! He started something something something"
    },
    {
      "isAlert": true,
      "date": "12/06/23",
      "note":
          "Ipsum duis esse do cupidatat aliquip voluptate adipisicing aute in mollit est qui."
    },
    {
      "isAlert": false,
      "date": "14/06/23",
      "note":
          "Ex enim laborum ullamco ipsum est laboris labore irure aliquip labore reprehenderit proident nulla."
    },
    {
      "isAlert": false,
      "date": "05/04/23",
      "note":
          "Aliqua ad ad officia sint excepteur aute dolor aliqua consequat excepteur occaecat ipsum."
    },
    {
      "isAlert": true,
      "date": "12/06/23",
      "note":
          "Ipsum duis esse do cupidatat aliquip voluptate adipisicing aute in mollit est qui."
    },
    {
      "isAlert": false,
      "date": "19/03/23",
      "note":
          "Enim sint et sit elit cillum culpa commodo est pariatur sint elit in ullamco magna."
    },
    {
      "isAlert": true,
      "date": "12/06/23",
      "note":
          "Ipsum duis esse do cupidatat aliquip voluptate adipisicing aute in mollit est qui."
    },
    {
      "isAlert": true,
      "date": "12/06/23",
      "note":
          "Ipsum duis esse do cupidatat aliquip voluptate adipisicing aute in mollit est qui."
    },
    {
      "isAlert": true,
      "date": "12/06/23",
      "note":
          "Ipsum duis esse do cupidatat aliquip voluptate adipisicing aute in mollit est qui."
    },
    {
      "isAlert": true,
      "date": "12/06/23",
      "note":
          "Ipsum duis esse do cupidatat aliquip voluptate adipisicing aute in mollit est qui."
    },
  ];

  List<Widget> _pageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.petImages.length; i++) {
      Color color = i == selectedPage ? kOrange : Colors.white;
      double width = i == selectedPage ? 8 : 20;
      double height = i == selectedPage ? 8 : 2;
      list.add(
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(
              100,
            ),
          ),
        ),
      );
      if (i < widget.petImages.length - 1) {
        list.add(
          const SizedBox(
            width: 2,
          ),
        );
      }
    }
    return list;
  }

  List<Widget> notes() {
    List<Widget> notes = [];
    for (int i = 0; i < notesMap.length; i++) {
      notes.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: notesMap[i]["isAlert"]
                      ? const Icon(
                          Icons.notifications_outlined,
                          color: kOrange,
                        )
                      : const Text("")),
            ),
            Expanded(
              flex: 2,
              child: Text(notesMap[i]["date"],
                  style: const TextStyle(
                    color: kMediumGray,
                    fontFamily: 'Open Sans',
                  )),
            ),
            Expanded(
              flex: 4,
              child: Text("${notesMap[i]["note"].substring(0, 23)}...",
                  style: const TextStyle(fontFamily: 'Open Sans')),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: kLightGray,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      );
      if (i < notesMap.length - 1) {
        notes.add(
          const Divider(color: Color(0xFFEBEAEA)),
        );
      }
    }

    return notes;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white, // Change Background color
        systemNavigationBarIconBrightness: Brightness.dark, // Change Icon color
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                        controller: controller,
                        itemCount: widget.petImages.length,
                        pageSnapping: true,
                        onPageChanged: (int page) {
                          setState(() {
                            selectedPage = page;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(widget.petImages[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _pageIndicator(),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.petName,
                              style: kLargeHeading,
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: kLightGray,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.cake_outlined,
                                        color: kOrange,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text('24/09/22 (11 months)',
                                        style:
                                            TextStyle(fontFamily: 'Open Sans')),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.more_horiz,
                              color: kLightGray,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Icon(
                                        Icons.monitor_weight_outlined,
                                        color: kOrange,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text('26.2kg (12/08/23)',
                                        style:
                                            TextStyle(fontFamily: 'Open Sans')),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.more_horiz, color: kLightGray),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 10.0,
                      bottom: 20.0,
                    ),
                    decoration: BoxDecoration(
                      color: kOrange.withOpacity(.15),
                      borderRadius: BorderRadius.circular(
                        8.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child:
                                          Icon(Icons.info_outline, color: kRed),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Text(
                                      "Doctor's Appointment",
                                      style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w500,
                                        color: kRed,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: kButton,
                              child: const Text('Edit', style: kButtonText),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("To",
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        color: kMediumGray)),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text("Lily Kim",
                                  style: TextStyle(fontFamily: 'Open Sans')),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Date",
                                    style: TextStyle(
                                        fontFamily: 'Open Sans',
                                        color: kMediumGray)),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text("20/08/23",
                                  style: TextStyle(fontFamily: 'Open Sans')),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text("Time",
                                  style: TextStyle(
                                      fontFamily: 'Open Sans',
                                      color: kMediumGray)),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text("10:45",
                                  style: TextStyle(fontFamily: 'Open Sans')),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notes', style: kLargeLabel),
                        Icon(
                          Icons.add,
                          color: kOrange,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: notes(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
