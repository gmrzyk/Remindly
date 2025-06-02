using System;
using System.Collections.Generic;
using Android.App;
using Android.Graphics;
using Android.Views;
using Android.Widget;
using Google.Android.Material.Card;
using Remindly.Data;

namespace Remindly
{
    public class ReminderAdapter : BaseAdapter<Reminder>
    {
        private readonly Activity _context;
        private List<Reminder> _reminders;

        public ReminderAdapter(Activity context, List<Reminder> reminders)
        {
            _context = context;
            _reminders = reminders;
        }

        public override Reminder this[int position] => _reminders[position];
        public override int Count => _reminders.Count;
        public override long GetItemId(int position) => _reminders[position].Id;

        public override View GetView(int position, View convertView, ViewGroup parent)
        {
            var view = convertView ?? _context.LayoutInflater.Inflate(Android.Resource.Layout.SimpleListItem2, parent, false);
            var reminder = _reminders[position];
    
            var text1 = view.FindViewById<TextView>(Android.Resource.Id.Text1);
            var text2 = view.FindViewById<TextView>(Android.Resource.Id.Text2);
    
            text1.Text = reminder.Title;
            text1.SetTextColor(Color.ParseColor("#3F51B5"));
            text1.TextSize = 18;
            text1.Typeface = Typeface.DefaultBold;
    
            text2.Text = $"{reminder.ReminderDate:dd.MM.yyyy HH:mm} | {reminder.Notes}";
            text2.SetTextColor(Color.ParseColor("#757575"));
            text2.TextSize = 14;
    
            // Tło dla elementu listy
            view.SetBackgroundResource(Resource.Drawable.list_item_bg);
    
            // Marginesy
            view.SetPadding(16, 16, 16, 16);
    
            return view;
        }

        public void UpdateData(List<Reminder> reminders)
        {
            _reminders = reminders;
            NotifyDataSetChanged();
        }
    }
}