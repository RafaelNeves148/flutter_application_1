import 'package:flutter/material.dart';
void main() {
  runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/ProfilesPage": (context) => ProfilesPage(),
        "/ShopingMarket": (context) => ShopingMarket(),
        "/ReservaPage": (context) => ReservaPage(),
      },
      home: ProfilesPage());
  }
}

class ProfilesPage extends StatefulWidget{
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilePageState();

  }

  class _ProfilePageState extends State<ProfilesPage> {

    List<ProductModel> profiles = [
      // ProductModel(nome: "Gabriel", imagem: "fallen.webp"),
      ProductModel(nome: "Mouse Pad Fallen", imagem: "mousepad_Fallen.jpg", valor: "Preço: 100,00", estoque: "Estoque: 10 Unidade"),
      ProductModel(nome: "Camisa Furia", imagem: "Camisa_FUria.jpg", valor: "Preço: 399,99", estoque: "Estoque: 5 Unidade"),
      ProductModel(nome: "Headset Fallen", imagem: "headset-pantera-pro-v2-roxo-10.jpg",valor: "Preço: 299,99", estoque: "Estoque: 1 Unidade"),
    ];
    int currentIndex = 0;

    List<ProductModel> carrinhoDeCompras = [];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de vendas')
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //PRIMEIRO ELEMENTO DO LAYOUT COLUMN
            Row(
              children: [
                //Botao de navegação para esquerda
                TextButton(onPressed: () {
                  setState(() {
                    if (currentIndex > 0) {
                      currentIndex--;
                    } else {
                      currentIndex = profiles.length - 1;
                    }
                  });
                }, child: Text("<", style: TextStyle(fontSize: 32),
                )
              ),
              Spacer(),

                //Conteudo central do layout
                Column(
                  children: [
                    Image.asset(
                        cacheWidth: 400,
                        cacheHeight: 300,
                        "assets/${profiles[currentIndex].imagem}"
                    ),
                      Text(profiles[currentIndex].nome,style: TextStyle(fontSize: 24)),
                      
                      Row(
                        children: [
                          
                        ],
                      ),
                      //Botao de seguir usuari
                  ],
                ),
                Spacer(),
                
                //Botao de navegação para direita
                TextButton(onPressed: () {
                  setState(() {
                      if (currentIndex < (profiles.length - 1)){
                        currentIndex++;
                      } else {
                        currentIndex = 0;
                      }
                  });
                }, child: Text(">", style: TextStyle(fontSize: 32),))
              ]
            ),
            SizedBox(height: 44),
            Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 24,),
                          Text(profiles[currentIndex].valor,style: TextStyle(fontSize: 24)),
                          Spacer(),
                          Text(profiles[currentIndex].estoque,style: TextStyle(fontSize: 24)),
                          SizedBox(width: 24,),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 48,),
                            ElevatedButton(onPressed: () {}, child: Text('Reservar')),
                            Spacer(),
                            ElevatedButton(onPressed: () {
                      // Pega o produto que está na tela
                      final product = profiles[currentIndex];
                      // Adiciona ele na lista do carrinho
                      carrinhoDeCompras.add(product);
                    }, 
                    child: Text("Comprar")),
                    SizedBox(width: 48,),
                    SizedBox(height: 100,)
                    ],
                      ),
          Spacer(),
          Divider(),
          Row(
            children: [
              Spacer(),
              IconButton(onPressed: () {
                Navigator.pushNamed(
                    context, 
                    "/ReservaPage",
                  );
              }, icon: Icon(Icons.list_sharp)),
              Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context, 
                    "/ShopingMarket",
                  );
                }, 
                icon: Icon(Icons.shopping_cart_checkout_outlined)
              ),
              Spacer(),
            ],
          )
          ]           
        )
      ),
    );
  }
}

class ShopingMarket extends StatefulWidget {
  const ShopingMarket({super.key});

  @override
  State<ShopingMarket> createState() => _ShopingMarketState();

}

class _ShopingMarketState extends State<ShopingMarket>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Carrinho de Compra')),
      body: Center(
        child: Row(
          children: [
            Text('data')
          ],
        ),
      )
    );
  }
}

class ProductModel {
  String nome;
  String imagem;
  String valor;
  String estoque;
  bool seguindo;

  ProductModel(
    {
      required this.nome,
      required this.imagem,
      required this.valor,
      required this.estoque,
      this.seguindo = false,
    }
  );

  void alternarSeguindo() {
      if (seguindo == true){
    seguindo = false;
      } else {
    seguindo = true;
      }
  }

}

class ReservaPage extends StatefulWidget {
  const ReservaPage({super.key});

  @override
  State<ReservaPage> createState() => _ReservaPageState();

}

class _ReservaPageState extends State<ReservaPage>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Produtos')),
      body: Center(
        child: Row(
          children: [
            Text('data')
          ],
        ),
      )
    );
  }
}

class ReservaModel {
  String nome;
  String imagem;
  String valor;
  String estoque;
  bool seguindo;

  ReservaModel(
    {
      required this.nome,
      required this.imagem,
      required this.valor,
      required this.estoque,
      this.seguindo = false,
    }
  );

}




