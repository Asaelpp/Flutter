import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cubit/misc/colors.dart';
import 'package:flutter_cubit/widgets/app-text.dart';
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
            padding: const EdgeInsets.only(top: 40, left: 20),
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: [
                  Tab(
                    text: "Lugares",
                  ),
                  Tab(
                    text: "Inspirações",
                  ),
                  Tab(
                    text: "Emoções",
                  )
                ],
              ),
            ),
          ),
          //contém as imagens abaixo da tabBar
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20),
            height: 350,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    //decoração da caixa de imagem
                    return Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage("img/mountain.jpeg"),
                            fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
                Text("There"),
                Text("Bye")
              ],
            ),
          ),
          //espaço entre o carrosel de imagens e o texto abaixo
          SizedBox(
            height: 30,
          ),
          //aqui começa o explorar mais
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore mais",
                  size: 22,
                ),
                AppText(
                  text: "Veja tudo",
                  color: AppColors.textColor1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//Criação de classe que chama o indicador circular
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

//indicador circular
class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
