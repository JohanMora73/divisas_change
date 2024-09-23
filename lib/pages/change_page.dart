import 'package:flutter/material.dart';

class ChangePage extends StatefulWidget {
  const ChangePage({super.key});


  @override
  State<ChangePage> createState() => _ChangePageState();
}

enum Currency { cop, usd, eur}
class _ChangePageState extends State<ChangePage> {
  final _money = TextEditingController();
  //String _selectedCurrency = 'COP'; // Valor predeterminado para la moneda
  Currency? _currency = Currency.cop;
  var _divisas=['COP','EUR','USD'];
  var _div1='0';
  var _div2='0';
  void _canjear(){
    if (_currency==Currency.cop){
      setState(() {
        _div1=(int.parse(_money.text)*(1/4684.13)).toStringAsFixed(2);
        _div2=(int.parse(_money.text)*(1/4212.79)).toStringAsFixed(2);
        _divisas=['COP','EUR','USD'];
      });
    }
    if (_currency==Currency.eur){
      setState(() {
        _div1=(int.parse(_money.text)*(1.1116)).toStringAsFixed(2);
        _div2=(int.parse(_money.text)*4657.1696).toStringAsFixed(2);
        _divisas=['EUR','USD','COP'];
      });
    }
    if (_currency==Currency.usd){
      setState(() {
        _div1=(int.parse(_money.text)*0.8995).toStringAsFixed(2);
        _div2=(int.parse(_money.text)*4190.95).toStringAsFixed(2);
        _divisas=['USD','EUR','COP'];
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              
              Image.asset(
                'assets/images/logo.png', // Imagen en la parte superior derecha
                height: 55, // Ajusta el tamaño de la imagen
              ),

              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.teal, Colors.white],  // Definir los colores del gradiente
                          begin: Alignment.topLeft,  // Punto inicial del gradiente
                          end: Alignment.bottomRight,  // Punto final del gradiente
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Currency change', // Título de la aplicació
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black, fontStyle: FontStyle.normal),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      'Seleccione su divisa',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                        height: 20),
                    //Se definen los radiobuttons para seleccionar la divisa del usuario
                    Text("Seleccione su divisa"),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text('COP',
                              style: TextStyle(
                                  fontSize: 12
                              ),
                            ),
                            leading: Radio<Currency> (
                              value: Currency.cop,
                              groupValue: _currency,
                              onChanged: (Currency? value){
                                setState(() {
                                  _currency= value;
                                });
                              },
                            ),
                          ),
                        ),

                        Expanded(
                          child: ListTile(
                            title: const Text('USD',
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                            leading: Radio<Currency> (
                              value: Currency.usd,
                              groupValue: _currency,
                              onChanged: (Currency? value){
                                setState(() {
                                  _currency= value;
                                });
                              },
                            ),
                          ),
                        ),

                        Expanded(
                          child: ListTile(
                            title: const Text('EUR',
                              style: TextStyle(
                                  fontSize: 12
                              ),),
                            leading: Radio<Currency> (
                              value: Currency.eur,
                              groupValue: _currency,
                              onChanged: (Currency? value){
                                setState(() {
                                  _currency= value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: _money,
                      //Controlador que almacenará el correo
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          //El tipo de cajita que se va a mostrar para ingresar el correo
                          labelText: "Ingrese el monto a cambiar",
                          helperText: "*Campo obligatorio", //para que se haga obligatorio ingresar la información que se solicita en este campo
                          prefixIcon: Icon(Icons.currency_exchange)),
                      //El mensaje que se mostrará en dicha cajita
                      keyboardType: TextInputType.number, //Se define el tipo de teclado que se va a mostrar

                    ),
                    SizedBox(
                      height: 16.0,
                    ),

                    ElevatedButton.icon(
                      style: TextButton.styleFrom(//se le declara el estilo al boton
                        textStyle: const TextStyle(fontSize: 20), //se le da el tamaño al boton
                      ),
                      icon: const Icon(Icons.currency_exchange, size: 20,),//se define el icono en este caso de suma
                      onPressed: (){
                        // Acción
                        _canjear();
                      },
                      label: const Text("convertir"),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    Text(
                      "El valor ingresado en ${_divisas[0]} es equivalente a:",
                      style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "$_div1 ${_divisas[1]}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "$_div2 ${_divisas[2]}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ],
                ),
              ),//Contenido de la app
            ],
          ),
        ),
      ),
    );
  }
}
