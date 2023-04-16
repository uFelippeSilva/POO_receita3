import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme = ThemeData(primarySwatch: Colors.deepPurple);

  void changeTheme(Color color) {
    setState(() {
      theme = ThemeData(
          primarySwatch: MaterialColor(color.value, {
        50: color.withOpacity(0.1),
        100: color.withOpacity(0.2),
        200: color.withOpacity(0.3),
        300: color.withOpacity(0.4),
        400: color.withOpacity(0.5),
        500: color.withOpacity(0.6),
        600: color.withOpacity(0.7),
        700: color.withOpacity(0.8),
        800: color.withOpacity(0.9),
        900: color.withOpacity(1.0),
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar(
          title: const Text("Seja um pintor e mude a cor da tela aqui==>"),
          changeTheme: changeTheme,
        ),
        body: DataBodyWidget(
          objects: [
            "La Fin Du Monde - Bock - 65 ibu",
            "Sapporo Premiume - Sour Ale - 54 ibu",
            "Duvel - Pilsner - 82 ibu",
          ],
        ),
        bottomNavigationBar: NewNavBar(
          icons: [
            Icons.coffee_outlined,
            Icons.local_drink_outlined,
            Icons.flag_outlined,
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final Function(Color) changeTheme;

  const MyAppBar({Key? key, required this.title, required this.changeTheme})
      : super(key: key);

  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
      actions: [
        PopupMenuButton<Color>(
          onSelected: widget.changeTheme,
          itemBuilder: (BuildContext context) => <PopupMenuEntry<Color>>[
            PopupMenuItem<Color>(
              value: Colors.red,
              child: const Text('Vermelho'),
            ),
            PopupMenuItem<Color>(
              value: Colors.blue,
              child: const Text('Azul'),
            ),
            PopupMenuItem<Color>(
              value: Colors.green,
              child: const Text('Verde'),
            ),
          ],
          icon: const Icon(Icons.color_lens),
        ),
      ],
    );
  }
}

class NewNavBar extends StatelessWidget {
  final List<IconData> icons;

  NewNavBar({required this.icons});

  void botaoFoiTocado(int index) {
    print("Não faz nada ainda meu bom $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado,
      items: List.generate(
        icons.length,
        (index) => BottomNavigationBarItem(
          icon: Icon(icons[index]),
          label: '',
        ),
      ),
    );
  }
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  DataBodyWidget({required this.objects});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: objects
          .map(
            (obj) => Expanded(
              child: Center(
                child: Text(obj),
              ),
            ),
          )
          .toList(),
    );
  }
}
