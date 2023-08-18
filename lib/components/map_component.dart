import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

class MapComponent extends StatefulWidget {
  const MapComponent({super.key});

  @override
  State<MapComponent> createState() => _MapComponentState();
}

class _MapComponentState extends State<MapComponent> {
  final PopupController _popupLayerController = PopupController();

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(0, 0),
        zoom: 7,
        minZoom: 0,
        maxZoom: 19,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/tylewis/clgy48jdp004t01pz7uwh88iw/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidHlsZXdpcyIsImEiOiJjbGd5M3B6MzYwMTEwM2dzdXkyNjk3NTdpIn0.xNTtJqe72cDiSborXvIWGQ',
          userAgentPackageName: 'com.example.app',
        ),
        // const MarkerLayer(
        //   markers: <Marker>[],
        // ),
        PopupMarkerLayer(
            options: PopupMarkerLayerOptions(
          markers: <Marker>[],
          popupController: _popupLayerController,
          popupDisplayOptions: PopupDisplayOptions(
            builder: (_, Marker marker) {
              // Access the builder from the marker
              final WidgetBuilder builder = marker.builder;
              // Use the builder to build the content for the popup
              final Widget content = builder(context);
              // Return the content widget
              return content;
            },
          ),
        )),
        CurrentLocationLayer(
          followOnLocationUpdate: FollowOnLocationUpdate.always,
          turnOnHeadingUpdate: TurnOnHeadingUpdate.never,
          style: const LocationMarkerStyle(
            marker: DefaultLocationMarker(
              child: Icon(
                Icons.navigation,
                color: Colors.white,
              ),
            ),
            markerSize: Size(40, 40),
            markerDirection: MarkerDirection.heading,
          ),
        )
      ],
    );
  }
}
