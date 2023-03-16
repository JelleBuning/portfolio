
import 'package:flutter/material.dart';
import '../model/navigation_item.dart';

class MobileMenuItem extends StatefulWidget {
  const MobileMenuItem({
    super.key, required this.item, required this.callback,
  });
  final NavigationItem item;
  final Function(int) callback;

  @override
  State<MobileMenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MobileMenuItem> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(3)),
        border: Border.all(
          color:  _hovering ? Colors.white : Colors.transparent
          ),
        ),
      child: InkWell(
        onTap: () {
          widget.callback(widget.item.id);
        },
        onHover: (hovering) {
          setState(() {
            _hovering = hovering; 
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          child: Text(widget.item.name),
        ),
      ),
    );
  }
}
