using Android.App;
using Android.Content;
using System;
using Android.OS;
using Remindly.Data;

namespace Remindly.Services
{
    public static class AlarmScheduler
    {
        public static void ScheduleAlarm(Context context, Reminder reminder)
        {
            var alarmManager = (AlarmManager)context.GetSystemService(Context.AlarmService);
            var intent = new Intent(context, typeof(NotificationReceiver));
            intent.PutExtra("title", reminder.Title);
            intent.PutExtra("message", reminder.Notes ?? "Przypomnienie");
            intent.PutExtra("reminder_id", reminder.Id);

            var pendingIntent = PendingIntent.GetBroadcast(
                context,
                reminder.Id,
                intent,
                PendingIntentFlags.UpdateCurrent | PendingIntentFlags.Immutable);

            var triggerTime = GetDateTimeInMillis(reminder.ReminderDate);

            if (Build.VERSION.SdkInt >= BuildVersionCodes.M)
            {
                alarmManager.SetExactAndAllowWhileIdle(AlarmType.RtcWakeup, triggerTime, pendingIntent);
            }
            else
            {
                alarmManager.SetExact(AlarmType.RtcWakeup, triggerTime, pendingIntent);
            }
        }

        private static long GetDateTimeInMillis(DateTime dateTime)
        {
            var utcTime = dateTime.ToUniversalTime();
            var epoch = new DateTime(1970, 1, 1, 0, 0, 0, DateTimeKind.Utc);
            return (long)(utcTime - epoch).TotalMilliseconds;
        }
    }
}