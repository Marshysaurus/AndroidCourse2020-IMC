import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/imc_model.dart';

class ResultadoIMC extends StatelessWidget {
  final IMCModelo imcModelo;

  ResultadoIMC({this.imcModelo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                height: 200,
                width: 200,
                child: imcModelo.esNormal ? SvgPicture.asset("assets/images/happy.svg", fit: BoxFit.contain,) : SvgPicture.asset("assets/images/sad.svg", fit: BoxFit.contain,) ,
              ),

              SizedBox(
                height: 50,
              ),
              Text("Tu IMC es ${imcModelo.imc.toStringAsFixed(2)}", style: TextStyle(color: Colors.red[700], fontSize: 34, fontWeight: FontWeight.w700),),
              Text("${imcModelo.resultado}", style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w500),),

              SizedBox(height: 16,),

              imcModelo.esNormal ? Text("Tu peso está normal, sigue así!")
                  : Text("Tu peso no se encuentra bien, intenta seguir una dieta...")
              ,
              SizedBox(height: 16),

              Container(
                child: FlatButton.icon(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                  label: Text("Vuelve a calcular tu IMC"),
                  textColor: Colors.white,
                  color: Colors.pink,

                ),
                width: double.infinity,
                padding: EdgeInsets.only(left: 16, right: 16),
              )

            ],
          ),
        )
    );
  }
}