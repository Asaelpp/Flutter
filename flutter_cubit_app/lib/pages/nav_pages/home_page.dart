import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        //coloca o texto "Discover" no início da página
        crossAxisAlignment: CrossAxisAlignment.start,
        //Viabiliza a criação dos objetos da tela a partir daqui
        children: [
          //Contém o menu de hamburguer e o Icone, sendo uma NAVBAR
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 30,
                  color: Colors.black54,
                ),
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)),
                ),
              ],
            ),
          ),
          //Cria um espaço para inserir o texto
          SizedBox(
            height: 40,
          ),
          //Cria um container para inserção de dados, no caso o texto
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Descubra"),
          ),
          //Cria mais um espaço entre o texto acima e os próximos textos de navegação
          SizedBox(
            height: 30,
          ),
          //TabBar
          Container(
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "Places",
                ),
                Tab(
                  text: "Inspirations",
                ),
                Tab(
                  text: "Emotions",
                )
              ],
            ),
          ),
          Container(
            height: 300,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [Text("Hi"), Text("There"), Text("Bye")],
            ),
          )
        ],
      ),
    );
  }
}
