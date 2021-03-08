import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:movie_recommendation_app/domain/models/item_model.dart';
import 'package:movie_recommendation_app/display/guidelines/colors.dart'
    as Guidelines;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool clicked = false;
  ItemModel _selectedGenre;
  ItemModel _selectedScore;
  List<ItemModel> genres;
  List<ItemModel> scores;

  @override
  void initState() {
    scores = [
      ItemModel(title: 'Any score', value: null),
      ItemModel(title: '5', value: 5),
      ItemModel(title: '6', value: 6),
      ItemModel(title: '7', value: 7),
      ItemModel(title: '8', value: 8),
    ];
    genres = [
      ItemModel(title: 'All genres', value: null),
      ItemModel(title: 'Action', value: 5),
      ItemModel(title: 'Animation', value: 6),
      ItemModel(title: 'Anime', value: 39),
      ItemModel(title: 'Comedy', value: 9),
      ItemModel(title: 'Drama', value: 3),
      ItemModel(title: 'Horror', value: 19),
    ];

    _selectedGenre = genres[0];
    _selectedScore = scores[0];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Guidelines.Colors.mainColor,
        title: Text(
          'What should I watch',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Container(
          child: FlipCard(
            front: null,
            back: null,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(15.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            clicked
                ? Container()
                : Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Genre',
                            style: TextStyle(
                              color: Guidelines.Colors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5.0),
                            height: 30.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                width: 1.0,
                                color: Guidelines.Colors.mainColor,
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<ItemModel>(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Guidelines.Colors.mainColor,
                                ),
                                isExpanded: false,
                                underline: Container(),
                                hint: Text(
                                  '',
                                  style: TextStyle(),
                                ),
                                value: _selectedGenre,
                                onChanged: (ItemModel newValue) {
                                  setState(() {
                                    _selectedGenre = newValue;
                                  });
                                },
                                items: genres.map((ItemModel filter) {
                                  return DropdownMenuItem<ItemModel>(
                                    value: filter,
                                    child: Row(
                                      children: [
                                        Text(
                                          filter.title,
                                          style: TextStyle(
                                            color: Guidelines.Colors.mainColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Min Score',
                            style: TextStyle(
                              color: Guidelines.Colors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5.0),
                            height: 30.0,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              border: Border.all(
                                width: 1.0,
                                color: Guidelines.Colors.mainColor,
                              ),
                            ),
                            child: Theme(
                              data: ThemeData(canvasColor: Colors.white),
                              child: DropdownButton<ItemModel>(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Guidelines.Colors.mainColor,
                                ),
                                isExpanded: false,
                                underline: Container(),
                                hint: Text(
                                  '',
                                  style: TextStyle(),
                                ),
                                value: _selectedScore,
                                onChanged: (ItemModel newValue) {
                                  setState(() {
                                    _selectedScore = newValue;
                                  });
                                },
                                items: scores.map((ItemModel filter) {
                                  return DropdownMenuItem<ItemModel>(
                                    value: filter,
                                    child: Row(
                                      children: [
                                        Text(
                                          filter.title,
                                          style: TextStyle(
                                            color: Guidelines.Colors.mainColor,
                                            fontSize: 14.0,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
