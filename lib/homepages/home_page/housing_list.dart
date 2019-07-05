import 'package:copy_station/model/housing_model.dart';
import 'package:flutter/material.dart';

import 'station_info.dart';

class HousingList extends StatelessWidget {
  final List<Rows> rows;

  const HousingList({Key key, this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rows.length * 240.0,
      child: ListView.builder(
          controller: ScrollController(keepScrollOffset: false),
          physics: NeverScrollableScrollPhysics(),
          itemCount: rows.length,
          itemBuilder: (BuildContext context, int position) {
            return StationInfo(rows: rows[position]);
          }),
    );
  }
}
