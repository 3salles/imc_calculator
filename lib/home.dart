import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String _infoText = 'Informe seus dados';

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";
    _infoText = "Informe seus dados";
  }

  void _calculateIMC() {
    setState(() {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text);
      double imc = weight / (height * height);

      print(imc);

      if (imc < 18.6) {
        _infoText = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9){
        _infoText = "Peso deal(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9){
        _infoText = "Levemente acima do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40){
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        actions: <Widget>[
          IconButton(onPressed: _resetFields, icon: const Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 0.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Peso",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.2,
                            blurRadius: 14,
                            offset: const Offset(4, 8),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        )),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: weightController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(20.0),
                        hintText: "00,0",
                        hintStyle: const TextStyle(
                            fontSize: 20.0, color: Colors.black26),
                        suffixIcon: const Text(
                          'KG',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Altura",
                  style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 24,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    margin: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 0.2,
                            blurRadius: 14,
                            offset: const Offset(4, 8),
                          ),
                        ],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        )),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: heightController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "0,00",
                        hintStyle: const TextStyle(
                            fontSize: 20.0, color: Colors.black26),
                        suffixIcon: const Text(
                          'M',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: ElevatedButton(
                onPressed: _calculateIMC,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "CALCULAR",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                ),
              ),
            ),
            // const Padding(
            //   padding:  EdgeInsets.all(8.0),
            //   child:  Text("VOCÊ ESTÁ", style: TextStyle(
            //     color: Colors.black26,
            //     fontSize: 18,
            //   ),
            //   ),
            // ),
            // const Padding(
            //   padding:  EdgeInsets.all(16.0),
            //   child:  Text("SAUDÁVEL", style: TextStyle(
            //     color: Colors.greenAccent,
            //     fontSize: 26,
            //   ),),
            // ),
            // const Padding(
            //   padding:  EdgeInsets.all(4.0),
            //   child:  Text('SEU PESO IDEAL É ENTRE', style: TextStyle(
            //     color: Colors.black26,
            //     fontSize: 18,
            //   ),),
            // ),
            // const Padding(
            //   padding:  EdgeInsets.all(8.0),
            //   child:  Text('50 kg a 60 kg', style: TextStyle(
            //     color: Colors.greenAccent,
            //     fontSize: 22,
            //   ),),
            // ),
            Text(_infoText)
          ],
        ),
      ),
    );
  }
}
