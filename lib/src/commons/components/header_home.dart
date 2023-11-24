import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget implements PreferredSizeWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white, // Cor do background branco
                  hintText: 'Busque partidas perto de você',
                  contentPadding: const EdgeInsets.all(12.0),
                  prefixIcon: const Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // Borda arredondada
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(25.0), // Borda arredondada
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              )
            ],
          )),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
