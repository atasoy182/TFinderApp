import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tfinder_app/model/tf_user_model.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

import 'package:tfinder_app/constants.dart';

@immutable
class ExampleExpandableFab extends StatelessWidget {
  final int tabIndex;
  final TfUser tfuser;
  static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
  const ExampleExpandableFab({Key key, @required this.tabIndex, this.tfuser}) : super(key: key);

  void _showAction(BuildContext context, int index) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(_actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return tabIndex == 1 ? requestPageFabs(context) : profilPageFabs(context, tfuser);
  }

  ExpandableFab requestPageFabs(BuildContext context) {
    return ExpandableFab(
      tabIndex: tabIndex,
      distance: 112.0,
      children: [
        ActionButton(
          tabIndex: tabIndex,
          onPressed: () => _showAction(context, 0),
          icon: const Icon(Icons.add),
        ),
        ActionButton(
          tabIndex: tabIndex,
          onPressed: () => _showAction(context, 1),
          icon: Container(
            margin: EdgeInsets.only(left: 5),
            child: const ImageIcon(
              AssetImage("assets/images/contract.png"),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  ExpandableFab profilPageFabs(BuildContext context, TfUser tfUser) {
    return ExpandableFab(
      tabIndex: tabIndex,
      distance: 112.0,
      children: [
        ActionButton(
          tabIndex: tabIndex,
          onPressed: () => _showAction(context, 0),
          icon: const Icon(Icons.message),
        ),
        ActionButton(
          tabIndex: tabIndex,
          onPressed: () => _showAction(context, 2),
          icon: Container(
            //margin: EdgeInsets.only(left: 5),
            child: const ImageIcon(
              AssetImage("assets/images/bubbleComment.png"),
              color: Colors.white,
            ),
          ),
        ),
        ActionButton(
          tabIndex: tabIndex,
          onPressed: () => showDialog<void>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(height: 50, child: Center(child: Text("Haritaları Aç ?"))),
                actions: [
                  TextButton(
                    onPressed: () => _launchMapsUrl(tfUser.locationX, tfUser.locationY),
                    child: const Text('Evet'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Hayır'),
                  ),
                ],
              );
            },
          ),
          icon: const Icon(Icons.location_on),
        ),
        ActionButton(
          tabIndex: tabIndex,
          onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return Scaffold(
                  body: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(margin: EdgeInsets.only(left: 15), child: Text(tfUser.cepTel, style: TextStyle(fontSize: 20))),
                            IconButton(
                              onPressed: () {
                                Clipboard.setData(ClipboardData(
                                  text: tfUser.cepTel,
                                ));
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kopyalandı')));
                              },
                              icon: Icon(Icons.copy),
                            )
                          ],
                        ),
                        Divider(),
                        ListTile(
                          leading: CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage("assets/images/whatsapp.png"), // no matter how big it is, it won't overflow
                          ),
                          title: new Text('Whatsapp ile mesaj at'),
                          onTap: () async {
                            var whatsappUrl = "whatsapp://send?phone=$tfUser.cepTel";
                            await canLaunch(whatsappUrl) ? launch(whatsappUrl) : print("Merhaba numaranızı TFinder uygulamasından buldum.");
                            Navigator.pop(context);
                          },
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.call, color: defaultLink),
                          title: new Text('Ara'),
                          onTap: () {
                            launch("tel://$tfUser.cepTel");
                            Navigator.pop(context);
                          },
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                );
              }),
          icon: const Icon(Icons.phone),
        )
      ],
    );
  }

  void _launchMapsUrl(String lat, String lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    Key key,
    this.initialOpen,
    @required this.distance,
    @required this.children,
    @required this.tabIndex,
  }) : super(key: key);

  final bool initialOpen;
  final double distance;
  final List<Widget> children;
  final int tabIndex;

  @override
  _ExpandableFabState createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(widget.tabIndex),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(widget.tabIndex),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab(int tabIndex) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.close,
                color: tabIndex == 1 ? yesilDefault : Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0; i < count; i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab(int tabIndex) {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            backgroundColor: tabIndex == 1 ? yesilDefault : Theme.of(context).primaryColor,
            onPressed: _toggle,
            child: tabIndex == 1
                ? const Icon(
                    Icons.create,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  _ExpandingActionButton({
    Key key,
    @required this.directionInDegrees,
    @required this.maxDistance,
    @required this.progress,
    @required this.child,
  }) : super(key: key);

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
    this.onPressed,
    @required this.icon,
    @required this.tabIndex,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget icon;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        color: tabIndex == 1 ? yesilDefault : Theme.of(context).primaryColor,
        elevation: 4.0,
        child: IconButton(
          padding: EdgeInsets.all(0),
          onPressed: onPressed,
          icon: icon,
          color: Colors.white,
        ));
  }
}

@immutable
class FakeItem extends StatelessWidget {
  const FakeItem({
    Key key,
    @required this.isBig,
  }) : super(key: key);

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
      height: isBig ? 128.0 : 36.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.grey.shade300,
      ),
    );
  }
}
