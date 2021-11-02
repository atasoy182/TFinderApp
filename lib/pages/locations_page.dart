import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tfinder_app/viewmodel/tf_user_view_model.dart';
import '../constants.dart';

class LocationsPage extends StatefulWidget {
  @override
  _LocationsPageState createState() => _LocationsPageState();
}

class _LocationsPageState extends State<LocationsPage> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: Column(
//        margin: EdgeInsets.only(
//          left: 5,
//          right: 5,
//          top: 5,
//        ),
        children: [
          Container(
              child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 10, right: 0, bottom: 5),
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Yakınımdaki Öğretmenler",
                        style: TextStyle(fontSize: 24),
                      ),
                      Container(
                        //decoration: BoxDecoration(border: Border.all()),
                        padding: EdgeInsets.only(bottom: 20),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            Icons.list,
                            color: turkuazDefault,
                            size: 35,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ))),
          Container(
              child: Container(
                  margin: EdgeInsets.only(top: 5, left: 10, right: 10),
                  height: _size.height - 160,
                  child: MapSample())),
        ],
      ),
    ));
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Position currentPosition;
  var geoLocator = Geolocator();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController newGoogleMapController;
  Set<Marker> _markers = {};
  BitmapDescriptor mapMarker;
  bool isLoading = false;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), "assets/images/marker.png");
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLng = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLng, zoom: 20);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
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
  }

  @override
  Widget build(BuildContext context) {
    final _tfUserModel = Provider.of<TfUserViewModel>(context, listen: false);

    return new Scaffold(
        body: GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomGesturesEnabled: true,
      zoomControlsEnabled: true,
      myLocationButtonEnabled: true,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: _onMapCreated,
      markers: _markers,
      onCameraMove: (CameraPosition position) async {
        if (!isLoading) {
          isLoading = true;
          final LatLngBounds visibleRegion =
              await newGoogleMapController.getVisibleRegion();
          var teachers = await _tfUserModel.getNearTeachers(
              visibleRegion.northeast.latitude.toString(),
              visibleRegion.northeast.longitude.toString(),
              visibleRegion.southwest.latitude.toString(),
              visibleRegion.southwest.longitude.toString(),
            []
          );
          //print("TEACHERS:" + teachers.toString());
          // TODO bütün öğretmenler geldi ve render edilecek, varsa render edilmesin
          // https://www.youtube.com/watch?v=uE-KKOiua_8 bu videodaki alt kısım düşünülebilir.
          print(_tfUserModel.getlocationsWithoutState());
          await Future.delayed(Duration(seconds: 1));
          isLoading = false;
        }
      }
    ));
  }
}

const CameraPosition _kInitialPosition =
    CameraPosition(target: LatLng(-33.852, 151.211), zoom: 11.0);

class _MapCoordinatesBody extends StatefulWidget {
  const _MapCoordinatesBody();

  @override
  State<StatefulWidget> createState() => _MapCoordinatesBodyState();
}

class _MapCoordinatesBodyState extends State<_MapCoordinatesBody> {
  _MapCoordinatesBodyState();

  GoogleMapController mapController;
  LatLngBounds _visibleRegion = LatLngBounds(
    southwest: const LatLng(0, 0),
    northeast: const LatLng(0, 0),
  );

  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: _kInitialPosition,
    );

    final List<Widget> columnChildren = <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SizedBox(
            width: 300.0,
            height: 200.0,
            child: googleMap,
          ),
        ),
      ),
    ];

    if (mapController != null) {
      final String currentVisibleRegion = 'VisibleRegion:'
          '\nnortheast: ${_visibleRegion.northeast},'
          '\nsouthwest: ${_visibleRegion.southwest}';
      columnChildren.add(Center(child: Text(currentVisibleRegion)));
      columnChildren.add(_getVisibleRegionButton());
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );
  }

  void onMapCreated(GoogleMapController controller) async {
    final LatLngBounds visibleRegion = await controller.getVisibleRegion();
    setState(() {
      mapController = controller;
      _visibleRegion = visibleRegion;
    });
  }

  Widget _getVisibleRegionButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text('Get Visible Region Bounds'),
        onPressed: () async {
          final LatLngBounds visibleRegion =
              await mapController.getVisibleRegion();
          setState(() {
            _visibleRegion = visibleRegion;
          });
        },
      ),
    );
  }
}
