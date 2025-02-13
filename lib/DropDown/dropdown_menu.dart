import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TypeDropDownCarousel extends StatefulWidget {
  final TypeDropDownCarousalAttributes attributes;

  const TypeDropDownCarousel({
    super.key,
    TypeDropDownCarousalAttributes? attributes,
  }) : attributes = attributes ?? const TypeDropDownCarousalAttributes();

  @override
  State<TypeDropDownCarousel> createState() => _TypeDropDownCarouselState();
}

class _TypeDropDownCarouselState extends State<TypeDropDownCarousel> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.attributes.currIndex;
  }

  @override
  Widget build(BuildContext context) {
    double? width = Get.width ?? MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.attributes.horizontalMargin),
      child: SizedBox(
        height: widget.attributes.tileHeight,
        width: widget.attributes.tileWidth ?? width / 3.3,
        child: CarouselSlider.builder(
          options: CarouselOptions(
            enlargeCenterPage: true,
            viewportFraction: 0.55,
            enlargeFactor: 0.35,
            scrollDirection: Axis.vertical,
            autoPlay: false,
            enableInfiniteScroll: false,
            initialPage: _currentIndex,
            onPageChanged: (index, _) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemCount: widget.attributes.items.length,
          itemBuilder: (ctx, _, index) {
            return GestureDetector(
              onTap: () => widget.attributes.onTap(index),
              child: Container(
                height: widget.attributes.tileHeight,
                width: width,
                color: _currentIndex == index
                    ? const Color(0xffD91E33)
                    : const Color(0xff1A2224),
                alignment: Alignment.center,
                child: Text(
                  widget.attributes.items[index].toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _currentIndex == index ? Colors.white : Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class TypeDropDownCarousalAttributes {
  final int currIndex;
  final double? tileHeight;
  final double? tileWidth;
  final List<String> items;
  final double horizontalMargin;
  final void Function(int) onTap;

  const TypeDropDownCarousalAttributes({
    this.currIndex = 0,
    this.tileHeight = 70,
    this.tileWidth,
    this.items = const ["Option 1", "Option 2", "Option 3"],
    this.horizontalMargin = 8,
    this.onTap = _defaultOnTap,
  });

  static void _defaultOnTap(int index) {
    print("Tapped item: $index");
  }
}
