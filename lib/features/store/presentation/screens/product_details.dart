

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Details', style: TextStyle(fontWeight: FontWeight.bold),),
      ),

      body: FadeInDown(
        duration: const Duration(milliseconds: 800),
        from: 30,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Classic Comfort Fit Joggers', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Spacer(),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline))
                  ],
                ),
              ),

              SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(7),
                    child: FadeInImage(
                        placeholder: AssetImage('assets/images/not-found.jpg'),
                        image: NetworkImage('https://i.imgur.com/QkIa5tT.jpeg')
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('Price', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                    Spacer(),
                    FilledButton(
                      onPressed: (){},
                      style: ButtonStyle(
                        shape: WidgetStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(7)
                          )
                        )
                      ),
                      child: Text('Add to cart')
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('2000'),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text('Tecnología NVMe (PCIe Gen4 x4) con lecturas secuenciales de hasta 5000 MB/s, lectura/escritura aleatoria 680K/850K IOPS. Velocidad de transferencia de fecha: 5000.0 megabytes_per_second.Usos específicos: Personal, Juegos, Negocios Amplio almacenamiento de hasta 4 TB Funciona hasta un 43% más rápido que los SSD NVMe Gen3 más rápidos Calificación en MTTF superior a 1.5 millones de horas para mayor longevidad y fiabilidad Compatibilidad con versiones anteriores de Gen3', maxLines: 10,),
              )





            ],
          ),
        ),
      ),
    );
  }
}
