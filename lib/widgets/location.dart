// Edit sayfasından lokasyon seçilmesine olanak tanır.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowChangeLocation extends StatefulWidget {
  final String locationX;
  final String locationY;

  const ShowChangeLocation({Key key, @required this.locationX, @required this.locationY}) : super(key: key);

  @override
  _ShowChangeLocationState createState() => _ShowChangeLocationState();
}

class _ShowChangeLocationState extends State<ShowChangeLocation> {
  LatLng _ltlng;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Konum Değiştir",
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.all(0),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 32,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                var myList;
                if (_ltlng != null) {
                  myList = [];
                  myList.add(_ltlng.latitude);
                  myList.add(_ltlng.longitude);
                }

                Navigator.pop(context, myList);
              },
              padding: EdgeInsets.all(0),
              icon: Icon(
                Icons.check,
                color: Colors.black,
                size: 32,
              ),
            ),
          ],
          backwardsCompatibility: false,
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.grey),
        ),
        body: MapSample(
          callback: (latLng) {
            _ltlng = latLng;
          },
          locationX: widget.locationX,
          locationY: widget.locationY,
        ));
  }
}

class MapSample extends StatefulWidget {
  final Function callback;
  final String locationX;
  final String locationY;

  const MapSample({Key key, @required this.callback, this.locationX, this.locationY}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Position currentPosition;
  var geoLocator = Geolocator();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController newGoogleMapController;
  Set<Marker> _markers = {};
  String locationX;
  String locationY;
  BitmapDescriptor mapMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/images/marker.png");
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    locationX = widget.locationX;
    locationY = widget.locationY;
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLng = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(target: latLng, zoom: 20);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    // TODO set marker yapılmalı
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 20,
  );

  _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    newGoogleMapController = controller;
    locatePosition();

    if (locationX != null && locationY != null && locationX.length > 0 && locationY.length > 0) {
      setState(() {
        _markers.add(Marker(icon: mapMarker, markerId: MarkerId("ID - 1"), position: LatLng(double.parse(locationX), double.parse(locationY))));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: locationX != null ? _getMySavedLocation() : _kGooglePlex,
      onMapCreated: _onMapCreated,
      markers: _markers,
      onTap: (LatLng) {
        setState(() {
          _markers.add(Marker(icon: mapMarker, markerId: MarkerId("ID - 1"), position: LatLng));
        });
        widget.callback(LatLng);
      },
    ));
  }

  _getMySavedLocation() {
    return CameraPosition(
      target: LatLng(double.parse(locationX), double.parse(locationY)),
      zoom: 20,
    );
  }
}
