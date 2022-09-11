import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:shellhacks2022/Data/Models/event.dart';

import '../../../Data/Models/user.dart';
import '../../Screens/event_page.dart';

class SingleEvent extends StatelessWidget {
  // list of events with details

  final String? title;
  List<dynamic>? participants;
  final DateTime? eventTime;
  final int? zipCode;
  final User? owner;
  final String? url;

  SingleEvent(
      {this.eventTime,
      this.owner,
      this.participants,
      this.title,
      this.zipCode,
      this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(   
        splashColor: Colors.amber,
        onDoubleTap: (() {
          
        EventPage.events.add(Event(
          id: "id",
          eventTime: eventTime,
          owner: owner,
          participants: participants,
          title: title,
          url: url,
          zipCode: 12345,
        ));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Added Succesfully!"),
    ));
        }),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      Image.network(
                        url ?? "",
                        height: 400,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0.8),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            child: Text(
                              participants!.length.toString(),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Card(
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      eventTime!.day.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      getMonthName(eventTime!.month),
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ListTile(
                          title: Text(
                            title!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Text(
                            zipCode.toString(),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // get name of month from int
  String getMonthName(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Invalid Month';
    }
  }
}
