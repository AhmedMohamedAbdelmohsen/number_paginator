import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  _NumbersPageState createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final int _numPages = 50;
  int _currentPage = 0;
  final NumberPaginatorController _controller = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    var pages = List.generate(
      _numPages,
      (index) => Center(
        child: Text(
          "Page ${index + 1}",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );

    return Scaffold(
      body: pages[_currentPage],
      // card for elevation
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: NumberPaginator(
          numberPages: _numPages,
          initialPage: 0,
          controller: _controller,
          showFirstButton: true,
          showLastButton: true,
          config: NumberPaginatorUIConfig(
              height: 48,
              backgroundColor: const Color(0xffFCFCFC),
              buttonShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              buttonSelectedForegroundColor: Colors.white,
              buttonUnselectedForegroundColor: Colors.black,
              buttonTextStyle: TextStyle(color: Colors.white),
              buttonUnselectedBackgroundColor: Colors.white,
              buttonSelectedBackgroundColor: const Color(0xFF374761)),
          onPageChange: (index) {
            setState(() {
              _currentPage = index;
            });
            // refreshFunc(_currentPage);
          },
        ),
      ),
    );
  }
}
