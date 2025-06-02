using Android.Widget;
using System;

namespace Remindly
{
    public static class DateTimeExtensions
    {
        public static DateTime GetDateTime(this DatePicker picker)
        {
            return new DateTime(picker.Year, picker.Month + 1, picker.DayOfMonth);
        }

        public static void SetDateTime(this DatePicker picker, DateTime date)
        {
            picker.UpdateDate(date.Year, date.Month - 1, date.Day);
        }

        public static DateTime GetDateTime(this TimePicker picker)
        {
            return DateTime.Today.AddHours(picker.Hour).AddMinutes(picker.Minute);
        }

        public static void SetDateTime(this TimePicker picker, DateTime time)
        {
            picker.Hour = time.Hour;
            picker.Minute = time.Minute;
        }

        // Nowe metody dla kompatybilności
        public static int Month(this DateTime date) => date.Month;
        public static int Day(this DateTime date) => date.Day;
        public static int Hour(this DateTime date) => date.Hour;
        public static int Minute(this DateTime date) => date.Minute;
    }
}