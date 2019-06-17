import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleInvoceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(170),
      margin: EdgeInsets.only(
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
          ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              elevation: 5.0,
              child: _content(),
            ),
          ),
          Align(
            alignment: FractionalOffset(1.0, 0.0),
            child: Container(
              width: ScreenUtil().setWidth(100),
              height: ScreenUtil().setHeight(100),
              child: Image.asset('images/single_invoce_info_icon.png',),
            ),
          ),
        ],
      ),
    );
  }

  Widget _content(){
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(5),
                  top: ScreenUtil().setWidth(5),
                  right: ScreenUtil().setWidth(5)),
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(70),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment(0, 0),
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setHeight(45),
                    decoration: BoxDecoration(
                        color: Color(0xff7C6ECD),
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(40),
                        right: ScreenUtil().setWidth(20)),
                    child: Text(
                      '普',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(30)),
                    ),
                  ),
                  Text(
                    '增值税普通发票',
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(40)),
                  )
                ],
              ),
            ),
            MySeparator(
              color: Colors.grey,
              width: 5.0,
            ),
            Container(
              margin: EdgeInsets.only(
                  left: ScreenUtil().setWidth(5),
                  bottom: ScreenUtil().setWidth(5),
                  right: ScreenUtil().setWidth(5)),
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(69),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      '公司抬头',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(40)),
                    ),
                    flex: 1,
                  ),
                  Text(
                    '普通发票',
                    style: TextStyle(
                        color: Colors.grey, fontSize: ScreenUtil().setSp(30)),
                  )
                ],
              ),
            ),
          ],
        ),
    );
  }
}

class MySeparator extends StatelessWidget {
  final double height;
  final Color color;
  final double width;

  const MySeparator(
      {this.height = 1, this.color = Colors.black, this.width = 10.0});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
