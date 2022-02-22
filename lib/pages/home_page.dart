
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {  


 
  final CameraPosition initialPosition = const CameraPosition(target: LatLng(8.893260, -75.787453),zoom: 17);
  int index = 1; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
                    items: const [
                       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                       BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                   ], 
              currentIndex: index,
              onTap: (i){
                  setState(() {
                     index = i; 
                  });
              },              
          ),
        body: OrientationBuilder(builder: (context, orientation){
           if(orientation == Orientation.landscape){
              return Container(); 
           }else{
               return MapPage(initialPosition: initialPosition); 
           }
        }),
      ),
    );
  } 

 
}

class MapPage extends StatefulWidget {
   MapPage({
    Key? key,
    required this.initialPosition,
  }) : super(key: key);

  final CameraPosition initialPosition;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> { 

      GoogleMapController? _controller;
      Location currentLocation = Location();
      Set<Marker> _markers={};
    
    
     Set<Circle> cir   = Set<Circle>();  
     Set<Circle> circles = Set.from([Circle(
    circleId: CircleId('1'),
    center: LatLng(8.893260, -75.787453),
    radius: 300,
    fillColor: Colors.green.withOpacity(0.2),
    strokeWidth: 1,
    strokeColor: Colors.red  
)]);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
             GoogleMap(
               onMapCreated: ((controller) {
                 _controller = controller;
               }),
               initialCameraPosition: widget.initialPosition,
               circles: cir,
               myLocationEnabled: true,

               onTap: (latlng){
                    setState(() {
                        cir = Set.from(
                            [Circle(
                                circleId: CircleId('1'),
                                center: LatLng(latlng.latitude, latlng.longitude),
                                radius: 300,
                                fillColor: Colors.green.withOpacity(0.2),
                                strokeWidth: 1,
                                strokeColor: Colors.red  
                            )]
                        );
                    });
               },
               ),
              Positioned(
                   top: 10,
                   right: 15,
                   left: 15,
                   child: Container(
                     color: Colors.white,
                     child: Row(
                       children: <Widget>[
                         IconButton(
                           splashColor: Colors.grey,
                           icon: Icon(Icons.menu),
                           onPressed: () {},
                         ),
                         const Expanded(
                           child: TextField(
                             cursorColor: Colors.black,
                             keyboardType: TextInputType.text,
                             textInputAction: TextInputAction.go,
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 contentPadding:
                                     EdgeInsets.symmetric(horizontal: 15),
                                 hintText: "Search..."),
                           ),
                         ),
                        const Padding(
                           padding:  EdgeInsets.only(right: 8.0),
                           child: CircleAvatar(
                             backgroundColor: Colors.deepPurple,
                             child: Text('RD'),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),

        ],
    );
  } 

     void getLocation() async{
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc){
 
      _controller?.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
        target: LatLng(loc.latitude ?? 0.0,loc.longitude?? 0.0),
        zoom: 12.0,
      )));
      print(loc.latitude);
      print(loc.longitude);
      setState(() {
        _markers.add(Marker(markerId: MarkerId('Home'),
            position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0)
        ));
      });
       });
  }
}