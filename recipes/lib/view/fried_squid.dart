import 'package:flutter/material.dart';
import 'package:recipes/components/back_button.dart';
import 'package:recipes/recipe_constants.dart';

class FriedSquid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '오징어 튀김 요리법',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/fried_squid.jpg'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('난이도 : '),
                Icon(
                  Icons.star,
                ),
                Icon(
                  Icons.star,
                ),
                Icon(
                  Icons.star,
                ),
                Icon(
                  Icons.star_border,
                ),
                Icon(
                  Icons.star_border,
                ),
              ],
            ),
            Text(
              '1. 오징어를 가위로 적당한 크기로 잘라주세요',
              style: kTextHowToCook,
            ),
            Text(
              '2. 오징어를 튀김가루에 골고루 묻혀주세요',
              style: kTextHowToCook,
            ),
            Text(
              '3. 튀김반죽을 튀김가루 1: 찬물 1.4 비율로 만든 다음 냉동실에 30분정도 차갑게 만듭니다',
              style: kTextHowToCook,
            ),
            Text(
              '4. 오징어에 튀김옷을 입힌 뒤 기름에 넣어 앞,뒤 약 2분정도를 튀겨냅니다',
              style: kTextHowToCook,
            ),
            Text(
              '5. 튀김옷이 노릇해지면서 거품이 줄어들면 건져내서 기름을 약간 빼주세요',
              style: kTextHowToCook,
            ),
            Align(
              alignment: Alignment.center,
              child: BackToMain(),
            ),
          ],
        ),
      ),
    );
  }
}
