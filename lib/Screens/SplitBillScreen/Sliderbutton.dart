import 'package:flutter/material.dart';

class SliderButton extends StatefulWidget {
  final Widget child;

  final double radius;

  final double height;
  final double width;
  final double buttonSize;

  final Color backgroundColor;
  final Color baseColor;
  final Color highlightedColor;
  final Color buttonColor;

  final Text label;

  final Alignment alignLabel;
  final BoxShadow boxShadow;
  final Widget icon;
  final Function action;


  final bool dismissible;

  final double dismissThresholds;

  final bool disable;
  SliderButton({
    @required this.action,
    this.radius = 100,
    this.boxShadow = const BoxShadow(
      color: Colors.black,
      blurRadius: 4,
    ),
    this.child,
    this.height = 70,
    this.buttonSize = 60,
    this.width = 250,
    this.alignLabel = const Alignment(0, 0),
    this.backgroundColor = const Color(0xFF1B1D21),
    this.baseColor = const Color(0xFF1B1D21),
    this.buttonColor = Colors.white,
    this.highlightedColor = Colors.white,
    this.label = const Text(
      "Send Request",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18,color: Colors.white),
    ),
    this.icon = const Icon(
      Icons.arrow_forward_ios,
      color: Colors.black,
      size: 30.0,
    ),
    this.dismissible = true,
    this.dismissThresholds = 1.0,
    this.disable = false,
  }) : assert(buttonSize <= height);

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  bool flag;

  @override
  void initState() {
    super.initState();
    flag = true;
  }

  @override
  Widget build(BuildContext context) {
    return flag == true
        ? _control()
        : widget.dismissible == true
            ? Container()
            : Container(
                child: _control(),
              );
  }

  Widget _control() => Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color:
                widget.disable ? Colors.grey.shade700 : widget.backgroundColor,
            borderRadius: BorderRadius.circular(widget.radius)),
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              alignment: widget.alignLabel,
              child: widget.label,
            ),
            widget.disable
                ? Tooltip(
                    verticalOffset: 50,
                    message: 'Button is disabled',
                    child: Container(
                      width: widget.width - (widget.height),
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: (widget.height - widget.buttonSize) / 2,
                      ),
                      child: widget.child ??
                          Container(
                            height: widget.buttonSize,
                            width: widget.buttonSize,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  widget.boxShadow,
                                ],
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.circular(widget.radius)),
                            child: Center(child: widget.icon),
                          ),
                    ),
                  )
                : Dismissible(
                    key: Key("cancel"),
                    direction: DismissDirection.startToEnd,
                    dismissThresholds: {
                      DismissDirection.startToEnd: widget.dismissThresholds
                    },
                    onDismissed: (dir) async {
                      setState(() {
                        if (widget.dismissible) {
                          flag = false;
                        } else {
                          flag = !flag;
                        }
                      });
                    },
                    child: Container(
                      width: widget.width - (widget.height),
                      height: widget.height,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                        left: (widget.height - widget.buttonSize) / 2,
                      ),
                      child: widget.child ??
                          Container(
                            height: widget.buttonSize,
                            width: widget.buttonSize,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  widget.boxShadow,
                                ],
                                color: widget.buttonColor,
                                borderRadius:
                                    BorderRadius.circular(widget.radius)),
                            child: Center(child: widget.icon),
                          ),
                    ),
                  ),
            Container(
              child: SizedBox.expand(),
            ),
          ],
        ),
      );
}
