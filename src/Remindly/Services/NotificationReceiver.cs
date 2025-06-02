using Android.App;
using Android.Content;
using AndroidX.Core.App;

namespace Remindly.Services
{
    [BroadcastReceiver(
        Enabled = true,
        Exported = false,
        DirectBootAware = true)]
    public class NotificationReceiver : BroadcastReceiver
    {
        public override void OnReceive(Context context, Intent intent)
        {
            var notificationManager = NotificationManagerCompat.From(context);
            
            var notification = new NotificationCompat.Builder(context, NotificationHelper.ChannelId)
                .SetSmallIcon(Resource.Drawable.ic_notification)
                .SetContentTitle(intent.GetStringExtra("title"))
                .SetContentText(intent.GetStringExtra("message"))
                .SetPriority(NotificationCompat.PriorityHigh)
                .SetAutoCancel(true)
                .SetVisibility(NotificationCompat.VisibilityPublic)
                .Build();

            notificationManager.Notify(intent.GetIntExtra("reminder_id", 0), notification);
        }
    }
}