import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDropDown extends StatelessWidget {
  const AppDropDown({
    required this.attributes,
    super.key,
  });

  final AppDropDownAttributes attributes;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: attributes.height ?? 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // If dropdown is hidden, show the button
          attributes.showDropDown
              ? const SizedBox.shrink()
              : GestureDetector(
                  onTap: () => attributes.toggleDropDown(),
                  child: Container(
                    width: (attributes.width ?? width / 3.3) - 30,
                    height: attributes.height ?? 38,
                    decoration: BoxDecoration(
                      color: const Color(0xff050D10),
                      border: Border.all(
                        color: const Color(0xff868686),
                        width: 0.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffEFEFEF).withOpacity(0.15),
                          offset: const Offset(3, -2),
                          blurRadius: 6,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        (attributes.optionsList.isNotEmpty &&
                                attributes.selectedIndex <
                                    attributes.optionsList.length)
                            ? attributes.optionsList[attributes.selectedIndex]
                                .toUpperCase()
                            : "DEFAULT",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
          // If dropdown is visible, show the dropdown options
          attributes.showDropDown
              ? (attributes.optionsList.isNotEmpty)
                  ? TypeDropDownCarousel(
                      tileHeight: (attributes.height ?? 50) * 2,
                      tileWidth: attributes.width ?? 200,
                      currIndex: attributes.selectedIndex,
                      items: attributes.optionsList,
                      onTap: (index) {
                        if (index != null) {
                          attributes.updateSelectedIndex(
                              index); // Update selected option
                          attributes
                              .toggleDropDown(); // Close dropdown after selection
                        }
                      },
                    )
                  : const SizedBox.shrink()
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class TypeDropDownCarousel extends StatefulWidget {
  const TypeDropDownCarousel({
    super.key,
    required this.currIndex,
    required this.onTap,
    required this.items,
    this.tileWidth,
    this.tileHeight,
    this.horizontalMargin,
    this.horizontalPadding,
    this.textAlignment,
    this.textStyle,
  });

  final int currIndex;
  final Function(int) onTap;
  final List<String> items;
  final double? tileWidth;
  final double? tileHeight;
  final double? horizontalMargin;
  final double? horizontalPadding;
  final TextStyle Function(int)? textStyle;
  final Alignment? textAlignment;

  @override
  State<TypeDropDownCarousel> createState() => _TypeDropDownCarouselState();
}

class _TypeDropDownCarouselState extends State<TypeDropDownCarousel> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currIndex; // Initialize with current index
  }

  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin ?? 8),
      child: SizedBox(
        height: widget.tileHeight ?? 70,
        width: widget.tileWidth ?? width / 3.3,
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
                _currentIndex =
                    index; // Update selected index when user scrolls
              });
            },
          ),
          itemCount: widget.items.length,
          itemBuilder: (ctx, _, index) {
            return GestureDetector(
              onTap: () {
                widget.onTap(index); // Notify parent widget about selection
                setState(() {
                  _currentIndex = index; // Update UI instantly
                });
              },
              child: Container(
                height: widget.tileHeight ?? 70,
                width: width,
                color: _currentIndex == index
                    ? const Color(0xffD91E33)
                    : const Color(0xff1A2224),
                padding: EdgeInsets.symmetric(
                    horizontal: widget.horizontalPadding ?? 0),
                alignment: widget.textAlignment ?? Alignment.center,
                child: Text(
                  widget.items[index].toUpperCase(),
                  textAlign: TextAlign.center,
                  style: widget.textStyle != null
                      ? widget.textStyle!(index)
                      : GoogleFonts.montserrat(
                          fontSize: _currentIndex == index ? 14 : 12,
                          color: Colors.white,
                          fontWeight:
                              _currentIndex == index ? FontWeight.w500 : null,
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

// Attributes class for AppDropDown
class AppDropDownAttributes {
  AppDropDownAttributes({
    required this.optionsList,
    required this.selectedIndex,
    required this.showDropDown,
    required this.toggleDropDown,
    required this.updateSelectedIndex,
    this.width,
    this.height,
    this.textColor,
    this.tagText,
  });

  final VoidCallback toggleDropDown;
  final int selectedIndex;
  final List<String> optionsList;
  final bool showDropDown;
  final void Function(int) updateSelectedIndex;
  final double? width;
  final double? height;
  final Color? textColor;
  final String? tagText;
}
