import 'dart:async';

import 'package:durood_together_app/Core/DataModels/UserLocation/user_location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class LocationService {
  // Keep Trakcing Of The User
  UserLocation _currentLocation;

  Location location = Location();

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

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude,
      );
    } catch (e) {
      print('Could Not Get the Locaiton: $e');
    }
    return _currentLocation;
  }

  getAddressBasedOnLocation(double latitude, double longitude) async {
    try {
      final coordinates = new Coordinates(latitude, longitude);
      _userAddress =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
    } catch (e) {
      print('Could Not Get the Location: $e');
    }
  }
}
