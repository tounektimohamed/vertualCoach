import 'package:flutter/material.dart';
import 'package:mohamed/choice.dart';

class Result extends StatefulWidget {
  final int simonLevel;
  final int celebrityPoints;
  final int patternPoints;
  Result(
      {this.simonLevel = 0, this.celebrityPoints = 0, this.patternPoints = 0});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.06,
                vertical: MediaQuery.of(context).size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                (widget.simonLevel +
                            widget.patternPoints +
                            widget.celebrityPoints >=
                        13)
                    ? Text(
                        "Rest assured, you don't have Alzheimer's!",
                      
                      )
                    : Text(
                        "Unfortunately, you might have early onset Alzheimer's and you need to see a doctor point blank",
           
                      
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Text(
                  'Simon Points',
            
                ),
                (widget.simonLevel >= 6)
                    ? Text(
                        widget.simonLevel.toString(),
                    
                      )
                    : Text(
                        widget.simonLevel.toString(),
                   
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'Celebrity Points',
                  textAlign: TextAlign.left,
                
                ),
                (widget.celebrityPoints > 4)
                    ? Text(
                        widget.celebrityPoints.toString(),
                
                      )
                    : Text(
                        widget.celebrityPoints.toString(),
                      
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  'Riddle Points',
               
                ),
                (widget.patternPoints > 2)
                    ? Text(
                        widget.patternPoints.toString(),
           
                      )
                    : Text(
                        widget.patternPoints.toString(),
          
                      ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChoiceScreen(),
                        ),
                        (Route<dynamic> route) => false);
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(27.0),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25),
                    child: ListTile(
                      title: Text(
                        "Back to Home Page ",
                        textAlign: TextAlign.center,
                     
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
