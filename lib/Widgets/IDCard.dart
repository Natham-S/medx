import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class IDCard extends StatelessWidget{
  const IDCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(


      children: [
        SizedBox(width: 18,),
        Container(
          height: 120,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://images.pexels.com/photos/2379004/pexels-photo-2379004.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
              fit: BoxFit.fill,
            ),
          ),


        ),
        SizedBox(width: 36,),


        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name          :   HackPrix"),
            Text("Gender        :   Male"),
            Text("DOB             :   26-11-2000"),
            Text("Age              :   24"),
            Text("Blood Group   :   B+")
          ],
        )
        
        
         ],
    );
  }
  
}