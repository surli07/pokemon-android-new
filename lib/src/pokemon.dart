import 'package:flutter/material.dart';

class pokemon extends StatefulWidget {
  const pokemon({super.key});

  @override
  State<pokemon> createState() => _pokemonState();
}

class GridLayout {
  final String title;
  final String tipe;
  final String image;

  GridLayout({required this.title, required this.tipe, required this.image});
}

class _pokemonState extends State<pokemon> {
  List<GridLayout> options = [
    GridLayout(
        title: 'Pikachu',
        tipe: 'Listrik',
        image:
            'https://media.japanesestation.com/images/750x422/2016/01/Pikachu.jpg'),
    GridLayout(
        title: 'Bulbasaur',
        tipe: 'Daun',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGT410k5ydOj9UKxtlGyyvPAGzIPSH-jRmppzq9qnClSevwDgmP8p70iYvgSDd_I2DCyI&usqp=CAU'),
    GridLayout(
        title: 'Charmander',
        tipe: 'Api ',
        image:
            'https://static.promediateknologi.id/crop/0x0:0x0/750x500/webp/photo/2023/03/15/charmanderPNG-871864289.png'),
    GridLayout(
        title: 'Raichu',
        tipe: 'Listrik',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5Cn6pTedJhDxsH88DoEWQYOGx617f9eo0bw&usqp=CAU'),
    GridLayout(
        title: 'Nidorina',
        tipe: 'Racun',
        image:
            'https://e1.pxfuel.com/desktop-wallpaper/915/105/desktop-wallpaper-30-nidorina-by-vinailt-nidorina-thumbnail.jpg'),
    GridLayout(
        title: 'Butterfree',
        tipe: 'Serangga',
        image:
            'https://facts.net/wp-content/uploads/2023/07/13-facts-about-butterfree-1689697080.jpg'),
    GridLayout(
        title: 'Pidgeot',
        tipe: 'Normal - Terbang',
        image:
            'https://staticg.sportskeeda.com/editor/2023/02/8a69d-16764792324707-1920.jpg?w=840'),
    GridLayout(
        title: 'Squirtle',
        tipe: 'Air',
        image: 'https://images2.alphacoders.com/437/437300.jpg'),
    GridLayout(
        title: 'Omanyte',
        tipe: 'Batu - Air',
        image:
            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5da9cb0a-4906-4d1f-ac99-0da006178dfc/ddi7bft-faaf0c7d-3ec3-4b22-a90e-c12e27b2adff.png/v1/fill/w_1280,h_1050,q_80,strp/omanyte_by_flowfell_ddi7bft-fullview.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTA1MCIsInBhdGgiOiJcL2ZcLzVkYTljYjBhLTQ5MDYtNGQxZi1hYzk5LTBkYTAwNjE3OGRmY1wvZGRpN2JmdC1mYWFmMGM3ZC0zZWMzLTRiMjItYTkwZS1jMTJlMjdiMmFkZmYucG5nIiwid2lkdGgiOiI8PTEyODAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.SYz8ft-0gnD2xoeKHZSSEvIJqmhRYP-YOOLYPKrFf1U'),
    GridLayout(
        title: 'Ditto',
        tipe: 'Normal',
        image:
            'https://staticg.sportskeeda.com/editor/2023/03/cd353-16794315445877-1920.jpg'),
  ];

  List<GridLayout> filteredOptions = [];

  @override
  void initState() {
    super.initState();

    filteredOptions = options;
  }

  void runFilter(String enteredKeyword) {
    List<GridLayout> _foundPokemon = [];
    if (enteredKeyword.isEmpty) {
      _foundPokemon = options;
    } else {
      _foundPokemon = options
          .where((element) => element.title
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredOptions = _foundPokemon;
    });
  }

  void _selectItem(BuildContext context, GridLayout gridLayout) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _DetailPokemon(gridLayout),
        ));
  }

  @override
  List<Widget> _buildGridCards(int count) {
    List<Widget> cards = List.generate(
      count,
      (int index) {
        GridLayout option = filteredOptions[index];
        return GestureDetector(
          onTap: () => _selectItem(context, option),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.network(
                    option.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        option.title,
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        option.tipe,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return cards;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pokemon",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 15,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        //padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width / 0.5,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.12,
                                  child: TextField(
                                    onChanged: (value) => runFilter(value),
                                    autocorrect: true,
                                    decoration: InputDecoration(
                                      hintText: "search",
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.blue,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 3,
                                          color: Colors.blue,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  width: 350,
                                  child: GridView.count(
                                    crossAxisCount: 2,
                                    padding: const EdgeInsets.all(16.0),
                                    childAspectRatio: 8.0 / 9.0,
                                    children:
                                        _buildGridCards(filteredOptions.length),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailPokemon extends StatelessWidget {
  final GridLayout _gridLayout;
  const _DetailPokemon(this._gridLayout);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(_gridLayout.title),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    _gridLayout.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
