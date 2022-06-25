import 'package:flutter/material.dart';
import 'package:intercorp_app/details/BottomButton.dart';
import 'package:intercorp_app/utils/constants.dart';
import 'package:intercorp_app/utils/sample_data.dart';
import 'package:intercorp_app/utils/widget_functions.dart';
import '../details/BorderBox.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);

    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        BorderBox(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.menu,
                            color: COLOR_BLACK,
                          ),
                        ),
                        BorderBox(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.person,
                            color: COLOR_BLACK,
                          ),
                        )
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "Tipo de Casa",
                      style: themeData.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(10),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "FLIA FLORES",
                      style: themeData.textTheme.headline1,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: padding,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: [
                      "Casa Cabaña",
                      "Casa Premoldeada",
                      "Steel Framing"
                    ].map((filter) => ChoiceOptions(text: filter)).toList()),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: ((context, index) {
                            return Item(itemData: RE_DATA[index]);
                          })),
                    ),
                  )
                ],
              ),
              Positioned(
                  width: size.width,
                  bottom: 20,
                  child: Center(
                    child: BottomButton(
                      icon: Icons.map_outlined,
                      text: "Ver Mapa",
                      width: size.width * 0.35,
                    ),
                  ))
            ],
          )),
    );
  }
}

class ChoiceOptions extends StatelessWidget {
  final String text;

  const ChoiceOptions({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: COLOR_GREY.withAlpha(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(left: 25),
      child: Text(this.text, style: themeData.textTheme.headline5),
    );
  }
}

class Item extends StatelessWidget {
  final dynamic itemData;

  const Item({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final sidePadding = EdgeInsets.symmetric(horizontal: 0);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(itemData["image"])),
            Positioned(
              top: 15,
              right: 15,
              child: BorderBox(
                height: 50,
                width: 50,
                padding: sidePadding,
                child: Icon(
                  Icons.favorite_border,
                  color: COLOR_BLACK,
                ),
              ),
            )
          ],
        ),
        addVerticalSpace(5),
        Row(
          children: [
            Text(
              "${itemData["amount"]}",
              style: themeData.textTheme.headline1,
            ),
            addHorizontalSpace(10),
            Text(
              "${itemData["address"]}",
              style: themeData.textTheme.bodyText2,
            ),
          ],
        ),
        addVerticalSpace(10),
        Text(
          "${itemData["bedrooms"]} baños / ${itemData["bathrooms"]} habitaciones / ${itemData["area"]} m2",
          style: themeData.textTheme.headline5,
        )
      ]),
    );
  }
}
