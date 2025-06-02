﻿using System;
using System.Collections.Generic;
using Android.App;
using Android.Graphics;
using Android.OS;
using Android.Views;
using Android.Widget;
using Google.Android.Material.Card;
using Remindly.Data;
using Remindly.Services;

namespace Remindly
{
    public class ReminderAdapter : BaseAdapter<Reminder>
    {
        private readonly Activity _context;
        private List<Reminder> _reminders;
        private ReminderService _reminderService;

        public ReminderAdapter(Activity context, List<Reminder> reminders)
        {
            _context = context;
            _reminders = reminders;
            _reminderService = new ReminderService(context);
        }

        public override Reminder this[int position] => _reminders[position];
        public override int Count => _reminders.Count;
        public override long GetItemId(int position) => _reminders[position].Id;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            var view = convertView ?? _context.LayoutInflater.Inflate(Resource.Layout.reminder_item, parent, false);
            var reminder = _reminders[position];
            
            var card = view.FindViewById<MaterialCardView>(Resource.Id.reminderCard);
            var title = view.FindViewById<TextView>(Resource.Id.reminderTitle);
            var date = view.FindViewById<TextView>(Resource.Id.reminderDate);
            var notes = view.FindViewById<TextView>(Resource.Id.reminderNotes);
            var deleteCheckbox = view.FindViewById<CheckBox>(Resource.Id.deleteCheckbox);

            title.Text = reminder.Title;
            date.Text = reminder.ReminderDate.ToString("dd.MM.yyyy HH:mm");
            notes.Text = reminder.Notes;

            if (reminder.ReminderDate < DateTime.Now)
            {
                card.SetCardBackgroundColor(Color.ParseColor("#F5F5F5"));
                title.SetTextColor(Color.ParseColor("#9E9E9E"));
                date.SetTextColor(Color.ParseColor("#9E9E9E"));
                notes.SetTextColor(Color.ParseColor("#9E9E9E"));
                
                deleteCheckbox.Visibility = ViewStates.Visible;
                deleteCheckbox.CheckedChange += (sender, e) => 
                {
                    if (e.IsChecked)
                    {
                        new Handler().PostDelayed(() => 
                        {
                            _reminderService.CancelNotification(reminder.Id);
                            using (var db = new AppDbContext())
                            {
                                var item = db.Reminders.Find(reminder.Id);
                                if (item != null)
                                {
                                    db.Reminders.Remove(item);
                                    db.SaveChanges();
                                }
                            }
                            _reminders.Remove(reminder);
                            NotifyDataSetChanged();
                        }, 1000); 
                    }
                };
            }
            else
            {
                card.SetCardBackgroundColor(Color.ParseColor("#FFFFFF"));
                title.SetTextColor(Color.ParseColor("#212121"));
                date.SetTextColor(Color.ParseColor("#3F51B5"));
                notes.SetTextColor(Color.ParseColor("#424242"));
                deleteCheckbox.Visibility = ViewStates.Gone;
                deleteCheckbox.Checked = false;
            }

            return view;
        }

        public void UpdateData(List<Reminder> reminders)
        {
            _reminders = reminders;
            NotifyDataSetChanged();
        }
    }
}