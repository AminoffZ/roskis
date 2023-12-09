import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vector_map_tiles/vector_map_tiles.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.title});

  final String title;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final MapController _controller = MapController();
  Style? _style;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _initStyle();
  }

  void _initStyle() async {
    try {
      _style = await _readStyle();
    } catch (e, stack) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print(stack);
      _error = e;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    if (_error != null) {
      children.add(Expanded(child: Text(_error!.toString())));
    } else if (_style == null) {
      children.add(const Center(child: CircularProgressIndicator()));
    } else {
      children.add(Flexible(child: _map(_style!)));
      children.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_statusText()],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
    );
  }

  Future<Style> _readStyle() => StyleReader(
        // TODO: replace with production URL
        uri: dotenv.env['MAP_URL']!,
      ).read();

  Widget _map(Style style) => FlutterMap(
        mapController: _controller,
        options: MapOptions(
          center: style.center ?? const LatLng(60.175125, 24.924145),
          zoom: style.zoom ?? 11.19,
          maxZoom: 22,
          interactiveFlags: InteractiveFlag.rotate |
              InteractiveFlag.drag |
              InteractiveFlag.flingAnimation |
              InteractiveFlag.pinchMove |
              InteractiveFlag.pinchZoom |
              InteractiveFlag.doubleTapZoom,
        ),
        children: [
          VectorTileLayer(
            tileProviders: style.providers,
            theme: style.theme,
            sprites: style.sprites,
            maximumZoom: 22,
            tileOffset: TileOffset.mapbox,
            layerMode: VectorTileLayerMode.vector,
          ),
        ],
      );

  Widget _statusText() => Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: StreamBuilder(
          stream: _controller.mapEventStream,
          builder: (context, snapshot) {
            return Text(
              'Zoom: ${_controller.zoom.toStringAsFixed(2)} Center: ${_controller.center.latitude.toStringAsFixed(4)},${_controller.center.longitude.toStringAsFixed(4)}',
            );
          },
        ),
      );
}
