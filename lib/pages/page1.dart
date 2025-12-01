import 'package:examen_ra3/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../providers/counter_provider.dart';
import 'package:provider/provider.dart';


class Page1 extends StatefulWidget {
  const Page1({super.key});
  @override
  State<Page1> createState() => _Page1State();
}

class Moto {
final String marcaModelo;
final double fuelTankLiters; // Depósito en litros
final double consumptionL100; // Consumo en Litros por 100km

Moto({
required this.marcaModelo,
required this.fuelTankLiters,
required this.consumptionL100,
});
}

final List<Moto> motos = [
Moto(
marcaModelo: 'Honda PCX 125', fuelTankLiters: 8.0, consumptionL100: 2.1),
Moto(
marcaModelo: 'Yamaha NMAX 125',
fuelTankLiters: 7.1,
consumptionL100: 2.2),
Moto(
marcaModelo: 'Kymco Agility City 125',
fuelTankLiters: 7.0,
consumptionL100: 2.5),
Moto(
marcaModelo: 'Piaggio Liberty 125',
fuelTankLiters: 6.0,
consumptionL100: 2.3),
Moto(
marcaModelo: 'Sym Symphony 125',
fuelTankLiters: 5.5,
consumptionL100: 2.4),
Moto(
marcaModelo: 'Vespa Primavera 125',
fuelTankLiters: 8.0,
consumptionL100: 2.8),
Moto(
marcaModelo: 'Kawasaki J125',
fuelTankLiters: 11.0,
consumptionL100: 3.5),
Moto(
marcaModelo: 'Peugeot Pulsion 125',
fuelTankLiters: 12.0,
consumptionL100: 3.0),
];




class _Page1State extends State<Page1> {
  Moto? _nomMoto;



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<CounterProvider>().counter.toString(),),
          DropdownButton<Moto>(
            value:  _nomMoto,
            hint: const Text('Selecciona una moto'),
            items: motos
                .map((moto) => DropdownMenuItem<Moto>(
                      value: moto,
                      child: Text(moto.marcaModelo),
                    ))
                .toList(),
            onChanged: (Moto? moto) => setState(() => _nomMoto = moto),
          ),
          Text(_nomMoto?.marcaModelo ?? 'Ninguna moto seleccionada'),
          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().setNombreMoto(_nomMoto?.marcaModelo ?? '');
              context.read<CounterProvider>().setFuelTankLiters(_nomMoto?.fuelTankLiters ?? 0.0);
              context.read<CounterProvider>().setConsumptionL100(_nomMoto?.consumptionL100 ?? 0.0);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(initialIndex: 1)),
              );
            },
            child: Text('Calcular'),
          ),
        ],
      ),
    );
  }
}
