import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:robbi/widgets/background.dart'; 
import '../routes.dart';
import '../theme/theme.dart' as tema;

class InstructionsPage extends StatelessWidget {
  const InstructionsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Stack(
          children: [
              tema.gradientBackGround,  
              instructions(context),
          ],
       ),
    );
  } 


  Widget instructions( BuildContext context) { 
      return Container(
        height: MediaQuery.of(context).size.height * 0.75,
        margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Card(
            margin: EdgeInsets.all(20.0),
            child: Column( 
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                     SizedBox(height: 20.0,),
                     Text('Indicaciones', style: TextStyle(  fontSize:  30.0)),
                     SizedBox(height: 10.0,),
                     tileInstruction('Area segura', Colors.green),
                     tileInstruction('Area relativamente segura', Colors.orange),
                     tileInstruction('Area peligrosa', Colors.red),
                     tileInstruction('Sin informacion', Colors.grey),
                     
                     ElevatedButton(
                          onPressed: (){
                              Get.toNamed(Routes.routeHome);
                          },
                          child: Text(
                               'Continuar',
                               style: TextStyle(color: Colors.white, fontSize: 25.0),
                            )
                        )
                     
                ],
            ),
        ),
      );
  } 

  Widget tileInstruction(String text, Color color) {
      return ClipRRect(
         borderRadius: BorderRadius.circular(20.0),
         
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: ListTile( 
               title: Text(text, style: TextStyle( fontSize: 20.0 ),),
               trailing: Icon(Icons.location_on_outlined, color: color, size: 50.0,),
           ),
         ),
      ); 
  }
}