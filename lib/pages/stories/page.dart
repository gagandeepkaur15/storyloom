import 'package:flutter/material.dart';
import 'package:storyloom/localization/demo_localization.dart';
import 'package:storyloom/main.dart';
import 'package:storyloom/widgets/footer_widget.dart';
import 'package:storyloom/classes/language.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  int selectedLanguage = 1;

  void _changeLanguage(Language language) {
    Locale temp; // Renamed variable
    switch (language.languageCode) {
      case 'en':
        temp = Locale(language.languageCode, 'US');
        break;
      case 'ru':
        temp = Locale(language.languageCode, 'RU');
        break;
      case 'de':
        temp = Locale(language.languageCode, 'DE');
        break;
      default:
        temp = Locale(language.languageCode, 'US');
    }
    setState(() {
      selectedLanguage = language.id;
    });
    StoryLoomApp.setLocale(context, temp);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            Image.asset(
              'assets/images/thriller.jpg',
              width: 375,
              height: 192,
            ),
            const SizedBox(height: 40),
            Text(
              DemoLocalization.of(context).getTranslatedValue('moscowt'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Thriller",
              style: TextStyle(
                color: Colors.white24,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _changeLanguage(Language(0, "en")),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: selectedLanguage == 0
                              ? Colors.white24
                              : Colors.black,
                        ),
                        child: const Text(
                          "en",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _changeLanguage(Language(1, "ru")),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: selectedLanguage == 1
                              ? Colors.white24
                              : Colors.black,
                        ),
                        child: const Text(
                          "ru",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _changeLanguage(Language(2, "de")),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          color: selectedLanguage == 2
                              ? Colors.white24
                              : Colors.black,
                        ),
                        child: const Text(
                          "de",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.launch,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              DemoLocalization.of(context).getTranslatedValue('moscows'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.6,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(96, 165, 250, 1),
                    Color.fromRGBO(59, 130, 246, 1),
                  ],
                ),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  fixedSize: const Size(70, 40),
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text("Back"),
              ),
            ),
            const FooterWidget(),
          ],
        ),
      ),
    );
  }
}
