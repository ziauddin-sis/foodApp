
import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text('Add to Cart'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/1.jpg'),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Material(
                        color: Colors.white,
                        elevation: 5,
                        shadowColor: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'PKR \n200/-',
                                maxLines: 2,
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontFamily: 'Ubuntu',
                                ),
                              ),
                              VerticalDivider(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Shotgun Chicken Burger',
                                      maxLines: 1,
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Juicy chicken burger with our signature sauce',
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey[400],
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'GST 27.0',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.red[400],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Center(
                    child: IconButton(
                        icon: Icon(Icons.remove_circle,),
                      color: Colors.red,
                        onPressed: (){
                          print('You click me');
                        },
                    ),
                  ),
//                  Text('2'),
//                  IconButton(
//                    icon: Icon(
//                      Icons.add_circle,
//                      color: Colors.red,
//                    ),
//                    onPressed: (){},
//                  ),
//-                  Align(
//                    child: RaisedButton(
//                      child: Text('Add to Cart'),
//                        onPressed: (){},
//                        ),
//                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
