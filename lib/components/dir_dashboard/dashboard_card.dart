import 'package:flutter/material.dart';
import 'package:food_app/model/dashboard_item.dart';

class DashboardCard extends StatelessWidget{

  final DashboardItem _dashboardItem;
  final VoidCallback _onTap;
  final double _height, _width;

  const DashboardCard(this._dashboardItem, this._height, this._width, this._onTap );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 10.0,
        child: InkWell(
          onTap: _onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                    image: AssetImage(_dashboardItem.img),
                  fit: BoxFit.contain,
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 20,),
                Text(
                  _dashboardItem.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu',
                    letterSpacing: 2.0,
                    color: Colors.redAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    _dashboardItem.subtitle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 2.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
