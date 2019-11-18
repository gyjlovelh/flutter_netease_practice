import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  PageIndicator({
    this.currentPage,
    this.pageCount
  });

  Widget _indicator(bool active) => Expanded(
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4.0
      ),
      child: Container(
        height: 4.0,
        decoration: BoxDecoration(
          color: active ? Colors.orangeAccent : Colors.white,
          borderRadius: BorderRadius.circular(2.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 2.0),
              blurRadius: 2.0
            )
          ]
        ),
      ),
    ),
  );

  List<Widget> _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList.add(_indicator(i == currentPage));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _buildPageIndicators(),
    );
  }
}