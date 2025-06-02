using Android.App;
using Android.Content;
using Android.OS;
using AndroidX.Core.App;

namespace Remindly.Services
{
    public static class NotificationHelper
    {
        public const string ChannelId = "remindly_channel";

        public static void CreateNotificationChannel(Context context)
        {
            if (Build.VERSION.SdkInt < BuildVersionCodes.O)
                return;

            var channel = new NotificationChannel(
                ChannelId,
                "Przypomnienia",
                NotificationImportance.High)
            {
                Description = "Kanał powiadomień dla przypomnień",
                LockscreenVisibility = NotificationVisibility.Public
            };

            var notificationManager = context.GetSystemService(Context.NotificationService) as NotificationManager;
            notificationManager?.CreateNotificationChannel(channel);
        }
    }
}