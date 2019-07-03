import 'dart:math';

String LoadGeoSquare(double radius, double longitude, double latitude) {
  double degree = (24901 * 1609) / 360.0;
  double raidusMile = radius;

  double dpmLat = 1 / degree;
  double radiusLat = dpmLat * raidusMile;
  double minLat = latitude - radiusLat;
  double maxLat = latitude + radiusLat;
  double mpdLng = degree * cos(latitude * (pi / 180));
  double dpmLng = 1 / mpdLng;
  double radiusLng = dpmLng * raidusMile;
  double minLng = longitude - radiusLng;
  double maxLng = longitude + radiusLng;
  String data = '${minLat}_${maxLat}_${minLng}_${maxLng}';
  print('四角经纬度为:${data}');
  return data;
}
