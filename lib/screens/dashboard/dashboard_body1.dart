import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class DashboardBody1 extends StatelessWidget {
  const DashboardBody1({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'LOOK BACK NEWS', 
                  style: TextStyle(
                    fontFamily: 'KAFEINE',
                    fontSize: 30
                  )
                )
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'WHAT IS LOOK BACK?',
                  style: TextStyle(
                    fontFamily: 'KAFEINE',
                    fontSize: 20
                  )
                )
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: 
                  Text(
                    'Look Back is a clothing shop where you can find more variety that anyone shop in the world. We have clothing brand like Mezcal, Problems, New Era and much others, but the more importan clothing brand is our, you can find clothes of our brand Look Back.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'Rochaline',
                      fontSize: 20
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/content/Playera-Mezcal-Creacion.jpeg',
                  height: 200,
                  width: 200,
                ),
                const Flexible(
                  child: Text(
                    'New clothes arrive each week!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Soulgood',
                      fontSize: 20
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 20),
            ImageSlideshow(
              width: double.infinity,
              height: 200,
              initialPage: 0,
              indicatorColor: Colors.pink,
              indicatorBackgroundColor: Colors.grey,
              autoPlayInterval: 5000,
              isLoop: true,
              children: [
                Image.asset(
                  'assets/images/content/Carrousel1.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/content/Carrousel2.jpeg',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/images/content/Carrousel3.jpeg',
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'CONTACT US',
                  style: TextStyle(
                    fontFamily: 'KAFEINE',
                    fontSize: 20
                  )
                ),
              ],
            ),
            const SizedBox(
              height: 10
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/instagram.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  '@lookback.mx',
                  style: TextStyle(
                      fontFamily: 'Rochaline',
                      fontSize: 20
                    ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/facebook.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Look Back',
                  style: TextStyle(
                      fontFamily: 'Rochaline',
                      fontSize: 20
                    ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/whatsapp.png',
                  height: 30,
                  width: 30,
                ),
                const SizedBox(width: 10),
                const Text(
                  '+524611234567',
                  style: TextStyle(
                      fontFamily: 'Rochaline',
                      fontSize: 20
                    ),
                )
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}