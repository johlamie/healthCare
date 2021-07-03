import 'package:flutter/material.dart';
import 'package:healtcare/components/services/directionModel.dart';
// import 'package:healtcare/components/services/directionRepository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:healtcare/components/services/directionRepository.dart';
import 'package:healtcare/constants.dart';

class MapScreen extends StatefulWidget {
  final LatLng me;
  final LatLng other;
  MapScreen(this.me, this.other);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng mine, destination;
  Marker _origin, _destination;
  CameraPosition _initialCameraPosition;

  void initState() {
    mine = widget.me;
    destination = widget.other;
    // Initialisation de la map de premier plan
    _initialCameraPosition = CameraPosition(target: widget.me, zoom: 15);
    // Initialisation du Marker de l'utilisateur courant
    _origin = Marker(
      markerId: MarkerId('id-1'),
      position: widget.me, // LatLng(48.8490673, 2.3897295),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(
        title: "Vous",
        snippet: "Vous êtes ici.",
      ),
    );
    // Initialisation du Marker de l'utilisateur en détresse
    _destination = Marker(
      markerId: MarkerId('id-2'),
      position: widget.other,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      infoWindow: InfoWindow(
        title: "URGENCE",
        snippet: "Depechez-vous!!!",
      ),
    );
    super.initState();
  }

  GoogleMapController _googleMapController;
  Directions _info;

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  getTrajet() async {
    final directions = await DirectionsRepository().getDirections(
        origin: _origin.position, destination: _destination.position);
    setState(() => _info = directions);
  }

  @override
  Widget build(BuildContext context) {
    getTrajet();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: blackColor,
          ),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Maps',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _origin.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.green,
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('Position'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () => _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: _destination.position,
                    zoom: 14.5,
                    tilt: 50.0,
                  ),
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red[400],
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text('Secourir'),
            )
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              if (_origin != null) _origin,
              if (_destination != null) _destination
            },
            polylines: {
              if (_info != null)
                Polyline(
                  polylineId: PolylineId('overview_polyline'),
                  color: Colors.red,
                  width: 5,
                  points: _info.polylinePoints
                      .map((e) => LatLng(e.latitude, e.longitude))
                      .toList(),
                ),
            },
            // onLongPress: _addMarker,
          ),
          if (_info != null)
            Positioned(
              top: 20.0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6.0,
                  horizontal: 12.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Text(
                  '${_info.totalDistance}, ${_info.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white70,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          _info != null
              ? CameraUpdate.newLatLngBounds(_info.bounds, 100.0)
              : CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
