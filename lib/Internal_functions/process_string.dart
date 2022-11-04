List process_String(String s) {
  if (s.contains("@")) {
    // 9am , 9a , 9:00 , 9 , today , tommorow ,tod/tom , day after, 2,3,4,5 days
    List splitstring = s.split('@');
    String timey = splitstring[1];
    //9a
    List tim = timey.split('');
    String tim0 = tim[0].toUpperCase();
    DateTime now = DateTime.now();
    //* 9
    if (timey.length == 1) {
      if (now.hour.toInt() >= 12) {
        String r = tim0 + ":00" + " PM";
        List ret = [splitstring[0], r];
        return ret;
      } else {
        String r = tim0 + ":00" + " AM";
        List ret = [splitstring[0], r];
        return ret;
      }
    }
    //* 10 , 9a , 9p ,

    if (timey.length == 2) {
      String tim1 = tim[1].toUpperCase();

      if (tim1 == "A") {
        String r = tim[0] + ":00 " + "AM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (tim1 == "P") {
        String r = tim[0] + ":00 " + "PM";
        List ret = [splitstring[0], r];
        return ret;
      } else {
        if (now.hour.toInt() >= 12) {
          String r = tim[0] + tim[1] + ":00 " + "PM";
          List ret = [splitstring[0], r];
          return ret;
        } else {
          String r = tim[0] + tim[1] + ":00 " + "AM";
          List ret = [splitstring[0], r];
          return ret;
        }
      }
    } else if (timey.length == 3) {
      //* 10a  , 10p , 9am , 9pm , tod , tom
      String tim1 = tim[1].toUpperCase();
      String tim2 = tim[2].toUpperCase();

      if (tim0 == "T" && tim1 == "O" && tim2 == "D") {
        List ret = [splitstring[0], "Today"];
        return ret;
      } else if (tim0 == "T" && tim1 == "O" && tim2 == "M") {
        List ret = [splitstring[0], "Tomorrow"];
        return ret;
      } else if (tim1 == "P" && tim2 == "M") {
        String r = tim0 + ":00 " + "PM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (tim1 == "A" && tim2 == "M") {
        String r = tim0 + ":00 " + "AM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (tim2 == "A") {
        String r = tim0 + tim1 + ":00 " + "AM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (tim2 == "P") {
        String r = tim0 + tim1 + ":00 " + "PM";
        List ret = [splitstring[0], r];
        return ret;
      }
      //* 10pm , 9:45
    } else if (timey.length == 4) {
      //! DOES NOT WORK FOR 2 digit numbers

      String tim1 = tim[1].toUpperCase();
      String tim2 = tim[2].toUpperCase();
      String tim3 = tim[3].toUpperCase();
      DateTime now = DateTime.now();
      print(now);
      if (now.hour.toInt() >= 12 && tim2 != "P" && tim2 != "A") {
        String r = tim0 + ":" + tim2 + tim3 + " PM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (now.hour.toInt() <= 12 && tim2 != "P" && tim2 != "A") {
        String r = tim0 + ":" + tim2 + tim3 + " AM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (tim2 == "P") {
        String r = tim0 + tim1 + ":00" + " PM";
        List ret = [splitstring[0], r];
        return ret;
      } else if (tim2 == "A") {
        String r = tim0 + tim1 + ":00" + " AM";
        List ret = [splitstring[0], r];
        return ret;
      }
    }
    //* 10:30
    else if (timey.length == 5) {
      String tim1 = tim[1].toUpperCase();
      String tim3 = tim[3].toUpperCase();
      String tim4 = tim[4].toUpperCase();
      if (now.hour.toInt() < 12) {
        String r = tim0 + tim1 + ":" + tim3 + tim4 + " AM";
        List ret = [splitstring[0], r];
        return ret;
      } else {
        String r = tim0 + tim1 + ":" + tim3 + tim4 + " PM";
        List ret = [splitstring[0], r];
        return ret;
      }
    }

    // return split_string;
  } else {
    List splitstring = [s, null];
    return splitstring; 
  }
}
