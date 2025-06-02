using Android;
using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Runtime;
using Android.Widget;
using AndroidX.Core.App;
using AndroidX.Core.Content;
using Remindly.Data;
using Remindly.Services;
using System.Collections.Generic;
using System.Linq;
using Android.Views;

[assembly: UsesPermission(Android.Manifest.Permission.PostNotifications)]
[assembly: UsesPermission(Android.Manifest.Permission.ScheduleExactAlarm)]
[assembly: UsesPermission(Android.Manifest.Permission.UseExactAlarm)]

namespace Remindly
{
    [Activity(Label = "Remindly", MainLauncher = true)]
    public class MainActivity : Activity
    {
        private const int NotificationPermissionRequestCode = 1000;
        private const int AlarmPermissionRequestCode = 1001;
        private ListView _listView;
        private ReminderAdapter _adapter;
        private List<Reminder> _reminders = new List<Reminder>();
        private ReminderService _reminderService;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            // Inicjalizacja kanału powiadomień
            NotificationHelper.CreateNotificationChannel(this);

            _reminderService = new ReminderService(this);

            // Sprawdź i poproś o uprawnienia
            CheckAndRequestPermissions();

            // Inicjalizacja UI
            InitializeUI();

            // Załaduj przypomnienia
            LoadReminders();
        }

        private void InitializeUI()
        {
            _listView = FindViewById<ListView>(Resource.Id.reminderListView);
            _adapter = new ReminderAdapter(this, _reminders);
            _listView.Adapter = _adapter;

            var btnAdd = FindViewById<Button>(Resource.Id.btnAdd);
            btnAdd.Click += (s, e) => 
            {
                StartActivity(new Intent(this, typeof(AddReminderActivity)));
            };

            _listView.ItemClick += (sender, e) => 
            {
                var reminder = _reminders[e.Position];
                var intent = new Intent(this, typeof(AddReminderActivity));
                intent.PutExtra("REMINDER_ID", reminder.Id);
                StartActivityForResult(intent, 1);
            };

            _listView.ItemLongClick += (sender, e) => 
            {
                var reminder = _reminders[e.Position];
                ShowDeleteDialog(reminder);
            };
        }

        private void CheckAndRequestPermissions()
        {
            // Uprawnienia do powiadomień (Android 13+)
            if (Build.VERSION.SdkInt >= BuildVersionCodes.Tiramisu)
            {
                if (ContextCompat.CheckSelfPermission(this, Manifest.Permission.PostNotifications) != Permission.Granted)
                {
                    RequestPermissions(new[] { Manifest.Permission.PostNotifications }, NotificationPermissionRequestCode);
                }
            }

            // Uprawnienia do dokładnych alarmów (Android 12+)
            if (Build.VERSION.SdkInt >= BuildVersionCodes.S)
            {
                var alarmManager = GetSystemService(AlarmService) as AlarmManager;
                if (!alarmManager.CanScheduleExactAlarms())
                {
                    var intent = new Intent(Android.Provider.Settings.ActionRequestScheduleExactAlarm);
                    StartActivity(intent);
                }
            }
        }

        private void ShowDeleteDialog(Reminder reminder)
        {
            new AlertDialog.Builder(this)
                .SetTitle("Usuwanie przypomnienia")
                .SetMessage($"Czy na pewno chcesz usunąć: {reminder.Title}?")
                .SetPositiveButton("Tak", (dialog, which) => DeleteReminder(reminder))
                .SetNegativeButton("Nie", (IDialogInterfaceOnClickListener)null)
                .Show();
        }

        private void DeleteReminder(Reminder reminder)
        {
            try
            {
                using (var db = new AppDbContext())
                {
                    var item = db.Reminders.Find(reminder.Id);
                    if (item != null)
                    {
                        _reminderService.CancelNotification(item.Id);
                        db.Reminders.Remove(item);
                        db.SaveChanges();
                        LoadReminders();
                        Toast.MakeText(this, "Usunięto przypomnienie", ToastLength.Short).Show();
                    }
                }
            }
            catch (Exception ex)
            {
                Toast.MakeText(this, $"Błąd: {ex.Message}", ToastLength.Long).Show();
            }
        }

        protected override void OnResume()
        {
            base.OnResume();
            LoadReminders();
        }

        private void LoadReminders()
        {
            using (var db = new AppDbContext())
            {
                _reminders = db.Reminders.OrderBy(r => r.ReminderDate).ToList();
                _adapter.UpdateData(_reminders);

                // Ponownie zaplanuj powiadomienia (na wypadek restartu urządzenia)
                foreach (var reminder in _reminders.Where(r => r.ReminderDate > DateTime.Now))
                {
                    _reminderService.ScheduleNotification(reminder);
                }
            }
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            if (resultCode == Result.Ok)
            {
                LoadReminders();
                Toast.MakeText(this, "Przypomnienie zaktualizowane", ToastLength.Short).Show();
            }
        }

        public override void OnRequestPermissionsResult(int requestCode, string[] permissions, [GeneratedEnum] Permission[] grantResults)
        {
            base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
            
            if (requestCode == NotificationPermissionRequestCode)
            {
                if (grantResults.Length > 0 && grantResults[0] == Permission.Granted)
                {
                    Toast.MakeText(this, "Uprawnienia do powiadomień przyznane", ToastLength.Short).Show();
                }
                else
                {
                    Toast.MakeText(this, "Brak uprawnień - niektóre funkcje mogą nie działać", ToastLength.Long).Show();
                }
            }
        }
    }
}