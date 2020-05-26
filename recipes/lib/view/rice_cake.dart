import 'package:recipes/components/back_button.dart';
import 'package:flutter/material.dart';
import 'package:recipes/recipe_constants.dart';

class RiceCake extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '떡뽁이 요리법',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('images/rice_cake.jpg'),
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
                  Icons.star_half,
                ),
                Icon(
                  Icons.star_border,
                ),
              ],
            ),
            Text(
              '1. 떡을 흐르는 물에 씻어주세요',
              style: kTextHowToCook,
            ),
            Text(
              '2. 어묵과 대파는 먹기좋은 크기로 잘라주세요',
              style: kTextHowToCook,
            ),
            Text(
              '3. 설탕3스푼, 진간장1스푼, 고춧가루2.5스푼, 고추장2.5스푼, 생수2스푼, 후추톡톡 ,통깨톡톡 양념장을 만들어 준비해둡니다',
              style: kTextHowToCook,
            ),
            Text(
              '4. 냄비나 주물럭팬에 떡과 어묵을 넣고 생수 한컵반~두컵 넣어줍니다',
              style: kTextHowToCook,
            ),
            Text(
              '5. 생수가 보글보글 끓기시작하면 중약불로 양념을 잘 풀어주세요',
              style: kTextHowToCook,
            ),
            Align(
              alignment: Alignment.center,
              child: BackToMain(),
            )
          ],
        ),
      ),
    );
  }
}
