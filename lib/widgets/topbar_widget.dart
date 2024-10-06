import 'package:flutter/material.dart';

class TopBarWidget extends StatefulWidget {
  final Function(int) onMenuItemSelected;
  const TopBarWidget({
    super.key,
    required this.onMenuItemSelected,
  });

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  bool isMenuSelected = false;
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black,
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage("assets/images/storyloom.png"),
              ),
              TextButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isMenuSelected = !isMenuSelected;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    !isMenuSelected ? "Menu" : "Close",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        // AnimatedOpacity for fade-in effect
        Expanded(
          child: AnimatedOpacity(
            opacity: isMenuSelected ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: isMenuSelected
                ? Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 30),
                    color: Colors.black,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildMenuItem("Home", 0),
                        _buildMenuItem("Stories", 1),
                        _buildMenuItem("Genres", 2),
                        _buildMenuItem("Folktales", 3),
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(String title, int index) {
    bool isSelected = selectedOption == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
          isMenuSelected = false;
        });
        widget.onMenuItemSelected(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 38,
          ),
        ),
      ),
    );
  }
}
