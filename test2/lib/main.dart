import 'package:flutter/material.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10.0),
        alignment: Alignment.center,
        color: Colors.brown,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(18.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Per Person Amount",
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.brown.shade400,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ ${calculateTotalPerson(_billAmount, _personCounter, _tipPercentage)}",
                    style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.amberAccent.shade400,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.cyan.shade100,
                  border: Border.all(
                    color: Colors.blue,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Colors.redAccent),
                      decoration: InputDecoration(
                        prefixText: "Bill Amount",
                        prefixIcon: Icon(Icons.money),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Split",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCounter > 1) {
                                    _personCounter--;
                                  }
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.red.shade500),
                                child: Center(
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue.shade900,
                                        fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              "$_personCounter",
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                width: 40.0,
                                height: 40.0,
                                margin: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7.0),
                                    color: Colors.red.shade500),
                                child: Center(
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            " \$ ${calculateTotalTip(_billAmount, _personCounter, _tipPercentage)}",
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "$_tipPercentage%",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        Slider(
                            min: 0,
                            max: 100,
                            divisions: 10,
                            activeColor: Colors.blueAccent.shade700,
                            inactiveColor: Colors.redAccent.shade400,
                            value: _tipPercentage.toDouble(),
                            onChanged: (double newValue) {
                              setState(() {
                                _tipPercentage = newValue.round();
                              });
                            })
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  calculateTotalPerson(double billAmount, int spiltBy, int tipPercentage) {
    var totalPerson =
        (calculateTotalTip(billAmount, spiltBy, tipPercentage) * billAmount) /
            spiltBy;
    return totalPerson;
  }

  calculateTotalTip(double billAmount, int spiltBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 ||
        billAmount.toString().isEmpty ||
        billAmount == false) {
      //
    } else {
      totalTip = (billAmount + tipPercentage) / 100;
    }
    return totalTip;
  }
}
//
//
//
//
//
//
//
//

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;

  List quotes = [
    "Hello i am Abu Niaz."
        "I am from Bangladesh."
        "Now I am Studying at Daffodil International University. "
        "Iam reading department of Software Engineering."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HELTH",
          style: TextStyle(
              fontSize: 24.5,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quotes[_index % quotes.length]),
            FlatButton.icon(
              onPressed: _showQuote,
              icon: Icon(Icons.add_comment),
              label: Text(
                "Click me..!",
                style: TextStyle(color: Colors.indigo.shade700, fontSize: 30.0),
              ),
              color: Colors.green,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text("Information")),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          title: Text("Balance"),
        ),
      ]),
    );
  }

  void _showQuote() {
    setState(() {
      _index += 1;
    });
  }
}

//

//
//
//
//

class Bizcard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HELTH",
          style: TextStyle(fontSize: 25, color: Colors.deepOrange.shade50),
        ),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [_getCard()],
        ),
      ),
      //
      //
      //
      //
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_call), title: Text("Abu")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart), title: Text("Niaz")),
        ],
        backgroundColor: Colors.blue.shade50,
      ),
      //
      //
      //

      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigoAccent.shade100,
          child: Icon(Icons.access_time_sharp),
          onPressed: () => debugPrint("Hello")),
    );
  }

  Container _getCard() {
    return Container(
      width: 300,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.5),
        color: Colors.indigo.shade100,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Abu NIaz",
            style: TextStyle(color: Colors.red),
          ),
          Text("Dept. of SWE")
        ],
      ),
    );
  }
}
//
//

//

//

//

//

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
        centerTitle: true,
        backgroundColor: Colors.blue.shade200,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Text(
                  "TAB Me!..",
                  style: TextStyle(fontSize: 30),
                ),
              )
            ]),
      ),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Abu")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_ic_call_rounded), title: Text("Niaz")),
        ],
        backgroundColor: Colors.brown,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.missed_video_call_outlined),
          onPressed: () => debugPrint("Hello")),
    );
  }
}

void main() => runApp(
      MaterialApp(
        home: BillSplitter(),
      ),
    );
