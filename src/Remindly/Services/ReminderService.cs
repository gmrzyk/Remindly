using Android.App;
using Android.Content;
using Android.OS;
using Remindly.Data;
using System;

namespace Remindly.Services
{
    public class ReminderService
    {
        private readonly Context _context;

        public ReminderService(Context context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public void ScheduleNotification(Reminder reminder)
        {
            try
            {
                if (reminder.ReminderDate <= DateTime.Now) return;

                var intent = new Intent(_context, typeof(NotificationReceiver));
                intent.PutExtra("title", reminder.Title);
                intent.PutExtra("message", reminder.Notes ?? "Przypomnienie");
                intent.PutExtra("reminder_id", reminder.Id);

                var pendingIntent = PendingIntent.GetBroadcast(
                    _context,
                    reminder.Id,
                    intent,
                    PendingIntentFlags.UpdateCurrent | PendingIntentFlags.Immutable);

                var triggerTime = GetDateTimeInMillis(reminder.ReminderDate);
                var alarmManager = _context.GetSystemService(Context.AlarmService) as AlarmManager;
                
                if (Build.VERSION.SdkInt >= BuildVersionCodes.M)
                {
                    alarmManager?.SetExactAndAllowWhileIdle(AlarmType.RtcWakeup, triggerTime, pendingIntent);
                }
                else
                {
                    alarmManager?.SetExact(AlarmType.RtcWakeup, triggerTime, pendingIntent);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Błąd planowania powiadomienia: {ex}");
            }
        }

        private long GetDateTimeInMillis(DateTime dateTime)
        {
            var offset = new DateTimeOffset(dateTime);
            return offset.ToUnixTimeMilliseconds();
        }

        public void CancelNotification(int reminderId)
        {
            try
            {
                var intent = new Intent(_context, typeof(NotificationReceiver));
                var pendingIntent = PendingIntent.GetBroadcast(
                    _context,
                    reminderId,
                    intent,
                    PendingIntentFlags.UpdateCurrent | PendingIntentFlags.Immutable);

                var alarmManager = _context.GetSystemService(Context.AlarmService) as AlarmManager;
                alarmManager?.Cancel(pendingIntent);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Błąd anulowania powiadomienia: {ex}");
            }
        }
    }
}