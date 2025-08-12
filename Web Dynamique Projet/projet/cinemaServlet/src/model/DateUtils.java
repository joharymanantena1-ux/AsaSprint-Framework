package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
// import java.util.Date;

public class DateUtils {
    public static java.sql.Date convertToDate(String date) {
        try {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = inputFormat.parse(date);
            return new java.sql.Date(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}




