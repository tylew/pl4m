import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;
final session = supabase.auth.currentSession;

Future<dynamic> runStoredProcedure(
    {required String rpc, required Map<String, dynamic> params}) async {
  final response = await supabase.rpc(rpc, params: params);
  return response;
}
