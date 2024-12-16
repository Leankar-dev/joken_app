import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imageApp = const AssetImage('assets/padrao.png');
  var message = 'Escolha uma opção abaixo:';

  void selectedOption(String chooseUser) {
    var options = ['pedra', 'papel', 'tesoura'];
    var number = Random().nextInt(3);
    var chooseApp = options[number];

// Exibição da imagem escolhida pelo App
    switch (chooseApp) {
      case 'pedra':
        setState(() {
          imageApp = const AssetImage('assets/pedra.png');
        });
        break;
      case 'papel':
        setState(() {
          imageApp = const AssetImage('assets/papel.png');
        });
        break;
      case 'tesoura':
        setState(() {
          imageApp = const AssetImage('assets/tesoura.png');
        });
        break;
    }

    // validação do ganhador
    // usuario vencedor
    if ((chooseUser == 'pedra' && chooseApp == 'tesoura') ||
        (chooseUser == 'tesoura' && chooseApp == 'papel') ||
        (chooseUser == 'papel' && chooseApp == 'pedra')) {
      setState(() {
        message = 'Parabéns!!! Você ganhou :)';
      });
      // App vencedor
    } else if ((chooseApp == 'pedra' && chooseUser == 'tesoura') ||
        (chooseApp == 'tesoura' && chooseUser == 'papel') ||
        (chooseApp == 'papel' && chooseUser == 'pedra')) {
      setState(() {
        message = 'Voce Perdeu!!! :(';
      });
    } else {
      setState(() {
        message = 'Empate!!!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: const Text(
          'JokenPo',
        ),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const Text(
            'Escolha do App:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Image(
            image: imageApp,
          ),
          const SizedBox(height: 30),
          Text(
            message,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => selectedOption('pedra'),
                child: Image.asset(
                  'assets/pedra.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => selectedOption('papel'),
                child: Image.asset(
                  'assets/papel.png',
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => selectedOption('tesoura'),
                child: Image.asset(
                  'assets/tesoura.png',
                  height: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
