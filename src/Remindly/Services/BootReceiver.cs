using Android.Content;
using AndroidX.Core.App;
using Remindly.Data;
using System.Linq;

namespace Remindly.Services
{
    [BroadcastReceiver(Enabled = true, Exported = false)]
    public class BootReceiver : BroadcastReceiver
    {
        public override void OnReceive(Context context, Intent intent)
        {
            if (intent.Action == Intent.ActionBootCompleted)
            {
                using (var db = new AppDbContext())
                {
                    var reminders = db.Reminders.ToList();
                    foreach (var reminder in reminders)
                    {
                        if (reminder.ReminderDate > System.DateTime.Now)
                        {
                            var service = new ReminderService(context);
                            service.ScheduleNotification(reminder);
                        }
                    }
                }
            }
        }
    }
}