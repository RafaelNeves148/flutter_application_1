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
        "/ProfilesFollowingPage": (context) => ProfilesFollowingPage(),
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
                          Text(profiles[currentIndex].valor,style: TextStyle(fontSize: 24)),
                          Spacer(),
                          Text(profiles[currentIndex].estoque,style: TextStyle(fontSize: 24)),
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(onPressed: () {}, child: Text('Reservar')),
                            Spacer(),
                            ElevatedButton(onPressed: () async{
                      List<ProductModel> usuariosSeguidos = [];
                      for (var profile in profiles) {
                        if (profile.seguindo == true) {
                          usuariosSeguidos.add(profile);
                        } 
                      }
                      await Navigator.pushNamed(context, "/ProfilesFollowingPage",
                      arguments: {"usuariosSeguidos": usuariosSeguidos},
                      );

                      setState(() {
                      });
                    }, 
                    child: Text("Comprar")),
                    ],
                      ),
          ]           
        )
      ),
    );
  }
}

class ProfilesFollowingPage extends StatefulWidget {
  const ProfilesFollowingPage({super.key});

  @override
  State<ProfilesFollowingPage> createState() => _ProfilesFollowingPageState();

}

class _ProfilesFollowingPageState extends State<ProfilesFollowingPage>{

  @override
  Widget build(BuildContext context) {

    final argumentos = ModalRoute.of(context)!.settings.arguments as Map; 
    final usuariosSeguidos = argumentos["usuariosSeguidos"] as List<ProductModel>;
    return Scaffold(
      appBar: AppBar(title: Text('Perfis que você está seguindo')),
      body: ListView.builder(
        itemCount: usuariosSeguidos.length,
        itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage("assets/${usuariosSeguidos[index].imagem}"),
          ),
          title: Text(usuariosSeguidos[index].nome),
          trailing: IconButton(onPressed: () {
            setState(() {
              usuariosSeguidos[index].alternarSeguindo();
              usuariosSeguidos.removeAt(index);
            });
          }, icon: Icon(Icons.delete_forever_outlined)),
          );
      }
      ),
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




