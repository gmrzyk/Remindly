using Android.App;
using Android.OS;
using Android.Widget;
using Remindly.Data;
using System;

namespace Remindly
{
    [Activity(Label = "Dodaj przypomnienie")]
    public class AddReminderActivity : Activity
    {
        protected override async void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_add_reminder);

            var title = FindViewById<EditText>(Resource.Id.inputTitle);
            var notes = FindViewById<EditText>(Resource.Id.inputNotes);
            var datePicker = FindViewById<DatePicker>(Resource.Id.datePicker);
            var timePicker = FindViewById<TimePicker>(Resource.Id.timePicker);

            FindViewById<Button>(Resource.Id.btnSave).Click += async (s, e) =>
            {
                var reminder = new Reminder
                {
                    Title = title.Text,
                    Notes = notes.Text,
                    ReminderDate = new DateTime(datePicker.Year, datePicker.Month + 1, datePicker.DayOfMonth,
                        timePicker.Hour, timePicker.Minute, 0)
                };

                using (var db = new AppDbContext())
                {
                    db.Database.EnsureCreated();
                    db.Reminders.Add(reminder);
                    await db.SaveChangesAsync();
                }

                Toast.MakeText(this, "Przypomnienie zapisane!", ToastLength.Short).Show();
                Finish();
            };
        }
    }
}