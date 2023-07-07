import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  late final PageController controller;
  int pageValue = 0;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChanch(int value) {

    controller.jumpToPage(value);
    setState(() {
      pageValue = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
      ),

      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.grey,
        selectedIndex: pageValue,
        indicatorColor: Colors.white,
        onDestinationSelected: onChanch,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.library_books_outlined,),
            label: "News",
          ),
          NavigationDestination(
            icon: Icon(Icons.language),
            label: "Global",
          ),
          NavigationDestination(
            icon: Icon(Icons.star),
            label: "For you",
          ),
          NavigationDestination(
            icon: Icon(Icons.shelves),
            label: "Trending",
          ),
        ],
      ),
      body: PageView(
        onPageChanged: onChanch,
        controller: controller,
        children: [
          Scaffold(
            backgroundColor: Colors.red,
            body: Center(child: Text("Page 1")),
          ),
          Scaffold(
            backgroundColor: Colors.blue,
            body: Center(child: Text("Page 2")),
          ),
          Scaffold(
            backgroundColor: Colors.green,
            body: Center(child: Text("Page 3")),
          ),
          Scaffold(
            backgroundColor: Colors.yellow,
            body: Center(child: Text("Page 4")),
          ),
        ],
      ),
    );
  }
}