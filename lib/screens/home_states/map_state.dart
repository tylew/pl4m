import 'package:flutter/material.dart';
import 'package:map_app/components/map_component.dart';
import 'package:map_app/main.dart';

class MapState extends StatefulWidget {
  const MapState({
    super.key,
  });

  @override
  State<MapState> createState() => _MapStateState();
}

class _MapStateState extends State<MapState>
    with AutomaticKeepAliveClientMixin<MapState> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: appTheme.primaryColor, // Outline color
          width: 3.0, // Outline width
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child: MapComponent(),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
