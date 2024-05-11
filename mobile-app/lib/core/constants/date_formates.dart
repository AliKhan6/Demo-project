import 'package:intl/intl.dart';

var onlyDate = DateFormat("yy-MM-dd"); // 20-04-03
var date = DateFormat.yMd(); // 7/10/2020
var monthNameDate = DateFormat.yMMMMd('en_US'); // July 10, 1996
var dayMonthYear = DateFormat.yMMMEd(); // Fri, Apr 3, 2020
var onlyMonth = DateFormat.MMM(); // Jan
var onlyDay = DateFormat('EEEE'); // Sunday
var onlyTime = DateFormat('h:mm a'); // 10:10 AM
var dateAndTime = DateFormat.yMd().add_jm(); // 7/10/1996 5:08 PM
var onlyHrs = DateFormat.Hm(); // 17:08