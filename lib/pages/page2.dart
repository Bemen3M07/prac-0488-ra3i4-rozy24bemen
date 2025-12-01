import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});
  

  @override
  State<Page2> createState() => _Page2State();
}



class _Page2State extends State<Page2> {
double km = 0;
  final TextEditingController _kmController = TextEditingController();
  
  

  void clickboton() {
  setState(() {       
      // setstate using for the rerender the screen 
      // if we not use than it not show the sceond text
      
    });
    // this is the output when you tap on the button but 
    // it showing you in console not on screen
    print("button one");  
  }

  @override
  void dispose() {
    _kmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String texto = "Te quedan un total de ";
    
        double autonomia = (context.read<CounterProvider>().FuelTankLiters /
          context.read<CounterProvider>().ConsumptionL100) * 100;
        double autonomiaRestant = autonomia - km;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nom: ${context.watch<CounterProvider>().nombreMoto}'),
          Text(
            'Deposit (Litres): ${context.watch<CounterProvider>().FuelTankLiters}',
          ),
          Text(
            'Consum (L/100km): ${context.watch<CounterProvider>().ConsumptionL100}',
          ),
          Text(
            'Autonomia (Km): $autonomia',
          ),
          Form(
            child: Column(
              children: [
                Text('Introdueix quants km has fet:'),
                TextFormField(
                  controller: _kmController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Introdueix km',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final text = _kmController.text.trim();
                    final parsed = double.tryParse(text) ?? 0.0;
                    // store in provider if needed
                    try {
                      context.read<CounterProvider>().setKmFet(parsed);
                    } catch (_) {}
                    setState(() {
                      km = parsed;
                    });
                  },
                  child: Text('Calcular Consum'),
                ),
                Text(autonomiaRestant.toStringAsFixed(2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
