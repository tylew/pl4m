import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_app/constants/supabase_services.dart';

class MapServices {
  static List<LatLng> fetchedAreas = [];

  static Future<List<Marker>> fetchMarkerWithinRadius(
      {required double longitude,
      required double latitude,
      required double radius}) async {
    final LatLng center = LatLng(latitude, longitude);

    // Check if the area has already been fetched
    if (isAreaFetched(center, radius)) {
      // Area already fetched, return empty list or cached markers
      return [];
    }

    final params = {
      'center_lng': longitude,
      'center_lat': latitude,
      'radius': radius,
    };

    final response = await runStoredProcedure(
        rpc: 'get_posts_within_radius', params: params);

    // Assuming the response is a list of posts with latitude, longitude, title, and description properties
    final List<dynamic> posts = response['data'];

    // Create an array to store the markers
    final List<Marker> markers = [];

    // Build markers based on the post data
    for (var post in posts) {
      final double postLat = post['latitude'];
      final double postLng = post['longitude'];
      final String postTitle = post['title'];
      final String postDescription = post['description'];

      final marker = Marker(
        point: LatLng(postLat, postLng),
        builder: (BuildContext context) {
          // Customize the builder according to your needs
          return const Icon(Icons.nature_rounded);
        },
        // title: postTitle,
        // description: postDescription,
      );

      markers.add(marker);
    }

    // Cache the fetched area to avoid re-fetching
    cacheFetchedArea(center, radius);

    return markers;
  }

  static bool isAreaFetched(LatLng center, double radius) {
    // Check if the area has already been fetched by comparing it to the cached fetched areas
    for (var area in fetchedAreas) {
      final distance = calculateDistance(center, area);
      if (distance <= radius) {
        return true;
      }
    }
    return false;
  }

  static void cacheFetchedArea(LatLng center, double radius) {
    // Cache the fetched area by adding it to the fetchedAreas list
    fetchedAreas.add(center);
  }

  static double calculateDistance(LatLng point1, LatLng point2) {
    // Implement your distance calculation method here
    // This can be based on Haversine formula or other distance calculation algorithms
    // Return the distance between the two points
    return 0.0;
  }
}
