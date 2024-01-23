import 'dart:ffi';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = new TextEditingController();
  TextEditingController _controller2 = new TextEditingController();
  TextEditingController _controller3 = new TextEditingController();
  TextEditingController _controller4 = new TextEditingController();
  double carprice = 0;
  double down = 0;
  double year = 0;
  double interest = 0;
  double finance = 0;
  double interestperyear = 0;
  double totalinterest = 0;
  double totalinterandfinance = 0;
  double paypermonth = 0;
  void calculation() {
    finance =
        (double.parse(_controller1.text) - double.parse(_controller2.text));
    interestperyear = finance * (double.parse(_controller4.text) / 100);
    totalinterest = interestperyear * (double.parse(_controller3.text));
    totalinterandfinance = finance + totalinterest;
    setState(() {
      paypermonth =
          totalinterandfinance / ((double.parse(_controller3.text)) * 12);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        toolbarHeight: 30,
        backgroundColor: Color.fromARGB(255, 65, 245, 252),
        elevation: 0,
        actions: [
         const Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: const Icon(
              Icons.info,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 65, 245, 252),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(100))),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Car Loan",
                    style: GoogleFonts.robotoMono(
                        fontSize: 100, color: Colors.white),
                  ),
                  Text(
                    "Anas Chelaeh",
                    style: GoogleFonts.robotoMono(
                        fontSize: 15, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 40, 0),
            child: Column(
              children: [
                inputForm("ราคารถ", _controller1, "เช่น 800000"),
                inputForm("เงินดาวน์", _controller2, "เช่น 100000"),
                inputForm("จำนวนปีที่ผ่อน", _controller3, "เช่น 4"),
                inputForm("ดอกเบี้ย % ต่อปี", _controller4, "เช่น 5"),
              ],
            ),
          ),
         const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              calculation();
            },
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 65, 245, 252),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "คำนวณ",
                  style:
                      GoogleFonts.robotoMono(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ),
         const SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ดอกเบี้ยต่อปี : " + interestperyear.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
              ),
             const SizedBox(
                height: 10,
              ),
              Text(
                "รวมดอกเบี้ยทั้งหมด : " + totalinterest.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
              ),
             const SizedBox(
                height: 10,
              ),
              Text(
                "ผ่อนเดือนละ : " + paypermonth.toStringAsFixed(2),
                style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
         const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget inputForm(
      String title, TextEditingController controller, String hinttext) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20, color:Colors.white),
        ),
       const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hinttext),
          ),
        ),
       const SizedBox(
          height: 5,
        )
      ],
    );
  }
}

class GoogleFonts {
  static robotoMono({required int fontSize, required Color color}) {}
}
