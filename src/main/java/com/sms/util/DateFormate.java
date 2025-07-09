package com.sms.util;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class DateFormate {
    public static String formatLocalDate(LocalDate date) {
        if (date == null) {
            return "N/A"; 
        }
        return date.format(DateTimeFormatter.ofPattern("dd/MM/yyyy"));
    }
}
