import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

const double minWidth = 20;
const double maxWidth = 120;

class BottomBarTextOpen extends StatefulWidget {

  @override
  _BottomBarTextOpenState createState() => _BottomBarTextOpenState();
}

class _BottomBarTextOpenState extends State<BottomBarTextOpen>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  final iconList = List<IconData>.unmodifiable([
    FeatherIcons.home,
    FeatherIcons.search,
    FeatherIcons.heart,
    FeatherIcons.user,
  ]);

  int activeIcon = 0;
  bool isOn = false;

  @override
  void initState(){
    super.initState();
    _controller = AnimationController(
      vsync: this, duration: Duration(milliseconds: 600),
    )
      ..addStatusListener((status) {
        print(status);
        if(status == AnimationStatus.forward){
          setState(() {
            isOn =true;
          });
        } else if(status == AnimationStatus.dismissed){
          setState(() {
            isOn = false;
          });
        }
      })
      ..addListener(() {
        print(_controller.status);
      });
    _controller.forward();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  double? lerp(double min, double max) => lerpDouble(min, max, _controller.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomBottomBar(
          icons: iconList,
          onPressed: (i){
            _controller.reverse();
            Timer(
                Duration(seconds: 1), (){
              _toggle();
              setState(() {
                activeIcon = i;
                print('clicked icon $i');
              });
            });
          },
          activeIndex: activeIcon,
          margin: true,
          controller: _controller,
          isOn: isOn,
          lerp: lerp(minWidth, maxWidth)!
      ),
    );
  }

  void _toggle(){
    final bool isOpen = _controller.status == AnimationStatus.completed;
    _controller.fling(
        velocity: isOpen ? -2:2
    );
    print('this is open $isOpen');
  }
}


class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({
    required this.icons,
    required this.onPressed,
    required this.activeIndex,
    required this.margin,
    required this.controller,
    required this.isOn,
    required this.lerp,
  });

  final List<IconData>icons;
  final Function(int) onPressed;
  final int activeIndex;
  final bool margin;
  final AnimationController controller;
  final bool isOn;
  final double lerp;

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar>{
  double ? lerp(double min, double max) => lerpDouble(min, max, widget.controller.value);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            height: 80.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                color: Color(0x0FF020301),
                // borderRadius: BorderRadius.vertical(
                //   top: Radius.circular(20),
                //   bottom: Radius.circular(20),
                // ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for(var i=0; i< widget.icons.length; i++)
                    AnimatedBuilder(
                      animation: widget.controller,
                      builder: (context, child){
                        return GestureDetector(
                          onTap: ()=> widget.onPressed(i),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: i == widget.activeIndex && widget.isOn
                                  ? Color(0xFFFFDB15)
                                  : const Color(0x0FF020301),
                            ),
                            child: Icon(
                              widget.icons[i],
                              color: i == widget.activeIndex && widget.isOn
                                  ? Colors.white
                                  : Colors.grey,
                            ),
                            width: i== widget.activeIndex && widget.isOn
                                ? lerp(minWidth, maxWidth)
                                :20.0,
                          ),
                        );
                      },),
                ],
              ),
            )
        ),

      ],
    );
  }
}









