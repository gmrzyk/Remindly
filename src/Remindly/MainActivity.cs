using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using Remindly.Data;
using System.Collections.Generic;
using System.Linq;

namespace Remindly
{
    [Activity(Label = "Remindly", MainLauncher = true)]
    public class MainActivity : Activity
    {
        private ListView _listView;
        private ReminderAdapter _adapter;
        private List<Reminder> _reminders = new List<Reminder>();

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            _listView = FindViewById<ListView>(Resource.Id.reminderListView);
            _adapter = new ReminderAdapter(this, _reminders);
            _listView.Adapter = _adapter;

            FindViewById<Button>(Resource.Id.btnAdd).Click += (s, e) => 
            {
                StartActivityForResult(new Intent(this, typeof(AddReminderActivity)), 1);
            };

            _listView.ItemClick += (sender, e) => 
            {
                var intent = new Intent(this, typeof(AddReminderActivity));
                intent.PutExtra("REMINDER_ID", _reminders[e.Position].Id);
                StartActivityForResult(intent, 2);
            };

            _listView.ItemLongClick += (sender, e) => 
            {
                var reminder = _reminders[e.Position];
                ShowDeleteDialog(reminder);
            };

            LoadReminders();
        }

        private void ShowDeleteDialog(Reminder reminder)
        {
            new AlertDialog.Builder(this)
                .SetTitle("Usuwanie przypomnienia")
                .SetMessage($"Czy na pewno chcesz usunąć:\n{reminder.Title}?")
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
            }
        }

        protected override void OnActivityResult(int requestCode, Result resultCode, Intent data)
        {
            base.OnActivityResult(requestCode, resultCode, data);
            if (resultCode == Result.Ok)
            {
                LoadReminders();
            }
        }
    }
}