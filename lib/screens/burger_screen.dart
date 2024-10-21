import 'package:flutter/material.dart';

class BurgerScreen extends StatelessWidget {
  const BurgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Burgers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: Color(0xFFFF0000),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'shravanchilka16@gmail.com',
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: -10,
                  top: 0,
                  child: Icon(
                    Icons.favorite_outline,
                    size: 24,
                  ),
                ),
              ],
            ),

            // Stack(
            //   children: [
            //     Center(
            //       child: Container(
            //         height: 400,
            //         width: 250,
            //         color: Colors.red.shade100,
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           mainAxisAlignment: MainAxisAlignment.end,
            //           children: [
            //             Text(
            //               'Burgers',
            //               style: Theme.of(context).textTheme.displayMedium,
            //             ),
            //             Text(
            //               '517 items',
            //               style: Theme.of(context).textTheme.titleSmall,
            //             ),
            //             SizedBox(
            //               height: 24,
            //             )
            //           ],
            //         ),
            //       ),
            //     ),
            //     Image(
            //       image: AssetImage('assets/burger.png'),
            //     ),
            //   ],
            // ),
            // Container(
            //   height: 400,
            //   color: Colors.red.shade100,
            //   child: Column(
            //     children: [
            //       Image(
            //         image: AssetImage('assets/burger.png'),
            //       ),
            //       Text(
            //         'Burgers',
            //         style: Theme.of(context).textTheme.displayMedium,
            //       ),
            //       Text(
            //         '517 items',
            //         style: Theme.of(context).textTheme.titleSmall,
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
