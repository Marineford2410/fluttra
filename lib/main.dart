import 'package:flutter/material.dart';

main() => runApp(Controles());

class Controles extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Estado();
  }

}

class Estado extends State {

  double precio = 0.0;
  double iva = 0.0;
  double precioTotal = 0.0;
  bool tienesMembresia = false;
  bool palomitas = false;
  bool cubetaPalomera = true;
  String pelicula;
  double calificacion = 0.0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.accessible_forward),
                  labelText: 'Precio',
                  hintText: 'Escribe el precio',
                  helperText: 'Este precio no incluye el IVA',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                ),
                onChanged: (cambio){
                  // print(cambio);
                  setState(() {
                    precio = double.parse(cambio);
                    iva = precio * 0.16;
                    precioTotal = precio * 1.16;
                  });
                },
              ),
            ),
            Text('Precio: $precio'),
            Text('IVA: $iva'),
            Text('Presio Total: $precioTotal'),
            Checkbox(
                value: tienesMembresia,
                onChanged: (cambio) {
                  setState(() {
                    tienesMembresia = cambio;
                  });
                }
            ),
            Text('Tienes menbresia : $tienesMembresia'),
            Switch(
                value: palomitas,
                onChanged: (cambio){
                  setState(() {
                    palomitas = cambio;
                  });
                }
            ),
            Text('¿Quieres palomitas? $palomitas'),
            SwitchListTile(
                value: cubetaPalomera,
                title: Text('¿Quieres cubeta palomera?'),
                subtitle: Text('Es del bromas, pelicula nueva de DC remasterizado'),
                secondary: Icon(Icons.theaters),
                isThreeLine: true,
                onChanged: (cambio){
                  setState(() {
                    cubetaPalomera = cambio;
                  });
                }
            ),
            Text('¿Quiers cubeta? $cubetaPalomera'),
            Row(
              children: <Widget>[
                Radio(
                    value: 'ToyStory 4',
                    groupValue: pelicula,
                    onChanged: (cambio){
                      setState(() {
                        pelicula = cambio;
                      });
                    }
                ),
                Radio(
                    value: 'El Bromas',
                    groupValue: pelicula,
                    onChanged: (cambio){
                      setState(() {
                        pelicula = cambio;
                      });
                    }
                ),
                Radio(
                    value: 'Rey Leon',
                    groupValue: pelicula,
                    onChanged: (cambio){
                      setState(() {
                        pelicula = cambio;
                      });
                    }
                )
              ],
            ),
            Text('Tu pelicula es: $pelicula'),
            Slider(
              min: 0,
              max: 10,
              divisions: 10,
              value: calificacion,
              label: 'Calificacion: $calificacion',
              onChanged: (cambio) {
                setState(() {
                  calificacion = cambio;
                });
              }
            )
          ],
        ),
      )
    );
  }
}