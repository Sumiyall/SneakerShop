import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'home_page.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login1(),
  )
);

class Login1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color.fromRGBO(68, 103, 216, 1),
              Color.fromARGB(255, 81, 159, 248),
              Color.fromARGB(255, 153, 70, 192)
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(duration: Duration(milliseconds: 1000), child: Text("test orloo1", style: TextStyle(fontFamily: 'Mogul2', color: Colors.white, fontSize: 40),)),
                  SizedBox(height: 20,),
                  FadeInUp(duration: Duration(milliseconds: 1300), child: Text("Гутлын дэлгүүрт тавтай морил", style: TextStyle(fontFamily: 'Mogul', color: Colors.white, fontSize: 40),)),
                ],
              ),
            ),
            SizedBox(height: 1),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40))
                ),
                child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10,),
                        FadeInUp(duration: Duration(milliseconds: 1400), child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(22, 187, 187, 0.298),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: const TextField(
                                  decoration: InputDecoration(
                                    hintText: "Утасны дугаар",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Нууц үг",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                        SizedBox(height: 40,),
                        FadeInUp(duration: Duration(milliseconds: 1500), child: Text("Нууц үгээ мартсан уу?", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 40,),
                        FadeInUp(duration: Duration(milliseconds: 1600), child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                  );
                          },
                          height: 50,
                          color: Color.fromARGB(255, 40, 134, 211),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text("Нэвтрэх", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        )),
                        SizedBox(height: 50,),
                        FadeInUp(duration: Duration(milliseconds: 1700), child: Text("Сошиал хаягаа ашиглан нэвтрэх", style: TextStyle(color: Colors.grey),)),
                        SizedBox(height: 30,),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: FadeInUp(duration: Duration(milliseconds: 1800), child: MaterialButton(
                                onPressed: (){},
                                height: 50,
                                color: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Center(
                                  child: Text("Facebook", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                            ),
                            SizedBox(width: 30,),
                            Expanded(
                              child: FadeInUp(duration: Duration(milliseconds: 1900), child: MaterialButton(
                                onPressed: () {},
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),

                                ),
                                color: Color.fromARGB(255, 223, 95, 73),
                                child: Center(
                                  child: Text("Google", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                ),
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}