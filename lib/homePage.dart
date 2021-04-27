import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;
  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");
  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OutPut: $sum',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: t1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Number 1',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: t2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter Number 2', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.greenAccent,
                    child: Text('Add'),
                    onPressed: doAddition,
                  ),
                  MaterialButton(
                    color: Colors.greenAccent,
                    child: Text('Sub'),
                    onPressed: () {
                      setState(() {
                        num1 = int.parse(t1.text);
                        num2 = int.parse(t2.text);
                        if (num1 > num2) {
                          sum = num1 - num2;
                        }
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: Colors.greenAccent,
                    child: Text('Mul'),
                    onPressed: () {
                      setState(() {
                        num1 = int.parse(t1.text);
                        num2 = int.parse(t2.text);
                        sum = num1 * num2;
                      });
                    },
                  ),
                  MaterialButton(
                    color: Colors.greenAccent,
                    child: Text('Div'),
                    onPressed: () {
                      setState(() {
                        num1 = int.parse(t1.text);
                        num2 = int.parse(t2.text);
                        sum = num1 ~/ num2;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: Text(
                  'Clear',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                color: Colors.amber,
                onPressed: () {
                  setState(() {
                    num1 = 0;
                    num2 = 0;
                    t1.text = "0";
                    t2.text = "0";
                    sum = 0;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
