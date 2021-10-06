import 'dart:async';

import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart';


class LocationService {
  // Keep Trakcing Of The User
  UserLocation _currentLocation;

  loc.Location location = loc.Location();

  // Address
  List _userAddress;

  // Continuously Emit Location Updates
  StreamController<UserLocation> _locationController =
  StreamController<UserLocation>.broadcast();

  LocationService() {
    location.requestPermission().then((granted) => {
      if (granted != null)
        {
          location.onLocationChanged.listen((locationData) => {
            if (locationData != null)
              {
                _locationController.add(
                  UserLocation(
                    latitude: locationData.latitude,
                    longitude: locationData.longitude,
                    addresses: this._userAddress,
                  ),
                ),
                getAddressBasedOnLocation(
                    locationData.latitude, locationData.longitude)
              }
          })
        }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  // Future<UserLocation> getLocation() async {
  //   try {
  //     var userLocation = await location.getLocation();
  //     _currentLocation = UserLocation(
  //       latitude: userLocation.latitude,
  //       longitude: userLocation.longitude,
  //     );
  //   } catch (e) {
  //     print('Could Not Get the Locaiton: $e');
  //   }
  //   return _currentLocation;
  // }

  getAddressBasedOnLocation(double latitude, double longitude) async {
    try {
      List<Placemark> placemark = await placemarkFromCoordinates(latitude, longitude);
      this._userAddress = placemark;
      // print(this._userAddress);
    } catch (e) {
      print('Could Not Get the Location: $e');
    }
  }
}
