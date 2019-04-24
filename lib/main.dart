import 'package:flighttickets/CustomShapeClipper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'Flight List Mock Up',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: appTheme,
    ));

// Var fro Gradient TopPart
Color firstColor = Color(0xFFF47D10);
Color secondColor = Color(0xFFEF772C);

// Theme Configuration
ThemeData appTheme =
    ThemeData(primaryColor: Color(0XFFF3791A), fontFamily: 'Oxygen');

// Var For Dropdwon Location
List<String> locations = [
  'Bandung (BDO)',
  'Jakarta (CGK)',
  'New York City (JFK)',
  'Medan (KNO)',
  'Boston (BOS)',
  'Pekanbaru (SSK)'
];

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          HomeScreenTopPart(),
          homeScreenBottomPart,
        ],
      ),
    );
  }
}

// Var for Dropdown Builder
const TextStyle dropDownLabelStyle =
    TextStyle(color: Colors.white, fontSize: 16.0);
const TextStyle dropDownMenuItemStyle =
    TextStyle(color: Colors.black, fontSize: 16.0);

class HomeScreenTopPart extends StatefulWidget {
  @override
  _HomeScreenTopPartState createState() => _HomeScreenTopPartState();
}

class _HomeScreenTopPartState extends State<HomeScreenTopPart> {
  // Var for get Index Dropdown
  var selectedIndex = 0;
  var isFligthSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // For Top Background
        ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 400.0,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [firstColor, secondColor])),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    // For First Row TopPart on Main Column
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        SizedBox(height: 16.0),
                        PopupMenuButton(
                            onSelected: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            // Another Row in First Row
                            child: Row(
                              children: <Widget>[
                                Text(
                                  locations[selectedIndex],
                                  style: dropDownLabelStyle,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                )
                              ],
                            ),

                            // For Pop Up Dropdown
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuItem<int>>[
                                  PopupMenuItem(
                                    child: Text(
                                      locations[0],
                                      style: dropDownMenuItemStyle,
                                    ),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      locations[1],
                                      style: dropDownMenuItemStyle,
                                    ),
                                    value: 1,
                                  )
                                ]),
                        Spacer(),
                        Icon(
                          Icons.settings,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text('Bade Kamana\nUjang ?',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 35.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        controller: TextEditingController(text: locations[0]),
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                        cursorColor: appTheme.primaryColor,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 15.0),
                            suffixIcon: Material(
                              elevation: 2.0,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              child: Icon(Icons.search, color: Colors.black),
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        child: ChoiceChip(
                          icon: Icons.flight_takeoff,
                          text: 'Flights',
                          isSelected: isFligthSelected,
                        ),
                        onTap: () {
                          setState(() {
                            isFligthSelected = true;
                          });
                        },
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      InkWell(
                        child: ChoiceChip(
                          icon: Icons.hotel,
                          text: 'Hotels',
                          isSelected: !isFligthSelected,
                        ),
                        onTap: () {
                          setState(() {
                            isFligthSelected = false;
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}

class ChoiceChip extends StatefulWidget {
  // Var for Parameter Constructor
  final IconData icon;
  final String text;
  final bool isSelected;
  // Constructor Call Init
  ChoiceChip({this.icon, this.text, this.isSelected});

  @override
  _ChoiceChipState createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<ChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            widget.icon,
            size: 25.0,
            color: Colors.white,
          ),
          SizedBox(width: 5.0),
          Text(
            widget.text,
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          )
        ],
      ),
    );
  }
}

// Var for View All Style Bottom Header
var viewAllStyle = TextStyle(fontSize: 14.0, color: appTheme.primaryColor);

// Bottom Areas
var homeScreenBottomPart = Column(
  children: <Widget>[
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Current Watched Itmes', style: dropDownMenuItemStyle),
          Spacer(),
          Text('VIEW ALL(17)', style: viewAllStyle)
        ],
      ),
    ),
    Container(
      height: 210,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: cityCards,
      ),
    )
  ],
);

// Var CityCard element
List<CityCard> cityCards = [
  CityCard('assets/images/lasvegas.jpg', 'Las Vegas', 'Feb 2019', '45', '4299', '2250'),
  CityCard('assets/images/athens.jpg', 'Athens', 'Apr 2019', '50', '6542', '3224'),
  CityCard('assets/images/sydney.jpeg', 'Sydney', 'Jan 2019', '30', '3254', '1542'),
];

// Method Widget for List City Picture
class CityCard extends StatelessWidget {

  final String imagePath, cityName, monthYear, discount, oldPrice, newPrice;

  CityCard(this.imagePath, this.cityName, this.monthYear, this.discount, this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 210.0,
          width: 160.0,
          child: Image.asset(imagePath, fit: BoxFit.cover,),
        )
      ],
    );
  }
}