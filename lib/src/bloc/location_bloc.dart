import 'package:rxdart/rxdart.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';


class LocationBloc {
  
  final _location = Location();

  final _locationController = BehaviorSubject<String>();

  final _addressController = BehaviorSubject<String>();

  Observable<String> get address => _addressController.stream;
  Function(String) get setAddress => _addressController.sink.add;

  Observable<String> get location => _locationController.stream;

    LocationBloc() {
      getLocation();
    }

   getLocation() async{
    
    LocationData currentLocation ;
    try {
      currentLocation = await _location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    final coordinates = new Coordinates(currentLocation.latitude, currentLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    String first = addresses.first.addressLine.toString();
    //String first = addresses.first.subLocality;
    print("$first"+" "+"hey");
    
    _locationController.sink.add(first);
  }


  dispose() {
    _locationController.close();
    _addressController.close();
  }
}