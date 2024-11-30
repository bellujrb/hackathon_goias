import 'package:flutter_modular/flutter_modular.dart';
import 'package:hackathon_goias/module/home/presenter/collect_screen.dart';
import 'package:hackathon_goias/module/home/presenter/exchange_screen.dart';
import 'package:hackathon_goias/module/home/presenter/home_screen.dart';

class AppModule extends Module {

  @override
  List<Bind> get binds => [

  ];

  @override
  List<ChildRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen()),
    ChildRoute('/exchange', child: (context, args) => const RedeemScreen()),
    ChildRoute('/collect', child: (context, args) => const CollectScreen()) 
  ];
}