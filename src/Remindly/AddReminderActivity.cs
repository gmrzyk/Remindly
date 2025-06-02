using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;
using Remindly.Data;
using System;

namespace Remindly
{
    [Activity(Label = "Dodaj/Edytuj przypomnienie")]
    public class AddReminderActivity : Activity
    {
        private EditText _titleInput;
        private EditText _notesInput;
        private DatePicker _datePicker;
        private TimePicker _timePicker;
        private int? _reminderId;

        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_add_reminder);

            _titleInput = FindViewById<EditText>(Resource.Id.inputTitle);
            _notesInput = FindViewById<EditText>(Resource.Id.inputNotes);
            _datePicker = FindViewById<DatePicker>(Resource.Id.datePicker);
            _timePicker = FindViewById<TimePicker>(Resource.Id.timePicker);
            
            _reminderId = Intent.GetIntExtra("REMINDER_ID", -1);
            var saveButton = FindViewById<Button>(Resource.Id.btnSave);

            if (_reminderId != -1)
            {
                LoadReminderData();
                saveButton.Text = "Zaktualizuj";
            }

            saveButton.Click += (s, e) => 
            {
                try
                {
                    SaveReminder();
                    SetResult(Result.Ok);
                    Finish();
                }
                catch (Exception ex)
                {
                    Toast.MakeText(this, "Błąd zapisu: " + ex.Message, ToastLength.Long).Show();
                }
            };
        }

        private void LoadReminderData()
        {
            using (var db = new AppDbContext())
            {
                var reminder = db.Reminders.Find(_reminderId);
                if (reminder != null)
                {
                    _titleInput.Text = reminder.Title;
                    _notesInput.Text = reminder.Notes;
                    _datePicker.UpdateDate(
                        reminder.ReminderDate.Year,
                        reminder.ReminderDate.Month - 1,
                        reminder.ReminderDate.Day);
                    _timePicker.Hour = reminder.ReminderDate.Hour;
                    _timePicker.Minute = reminder.ReminderDate.Minute;
                }
            }
        }

        private void SaveReminder()
        {
            var reminderDate = new DateTime(
                _datePicker.Year,
                _datePicker.Month + 1,
                _datePicker.DayOfMonth,
                _timePicker.Hour,
                _timePicker.Minute,
                0);

            using (var db = new AppDbContext())
            {
                Reminder reminder;
                if (_reminderId.HasValue && _reminderId != -1)
                {
                    reminder = db.Reminders.Find(_reminderId);
                    if (reminder == null)
                        throw new Exception("Nie znaleziono przypomnienia do edycji");
                }
                else
                {
                    reminder = new Reminder();
                    db.Reminders.Add(reminder);
                }

                reminder.Title = _titleInput.Text;
                reminder.Notes = _notesInput.Text;
                reminder.ReminderDate = reminderDate;

                db.SaveChanges();
            }
        }
    }
}