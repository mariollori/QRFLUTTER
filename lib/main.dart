
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: QrCode(),
));

class QrCode extends StatefulWidget {
  @override
  _QrCodeState createState() => _QrCodeState();
}
class _QrCodeState extends State<QrCode> {
 String _data="";

 _scan() async{

    await FlutterBarcodeScanner.scanBarcode("#000000", "Cancel", true, ScanMode.BARCODE).then((value)=> setState(()=> _data = value));
     
 }
 @override
 Widget build(BuildContext context){
   return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children:[
         Center(
           child: Container(
             child: Text(_data,style: TextStyle(fontSize: 30.0),),
           ),
         ),
         FlatButton(
           child: Text(
              "Escaner un codigo QR",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
           ),
           onPressed: ()=>_scan(),
         ),
         Text(_data)
       ],
     ),
   );
 }
}

