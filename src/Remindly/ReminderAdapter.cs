using System.Collections.Generic;
using Android.App;
using Android.Views;
using Android.Widget;
using Remindly.Data;
using Android.Graphics;

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
            var view = convertView ?? _context.LayoutInflater.Inflate(Android.Resource.Layout.SimpleListItem1, parent, false);
            var reminder = _reminders[position];
            var text = view.FindViewById<TextView>(Android.Resource.Id.Text1);
            text.Text = $"{reminder.Title} - {reminder.ReminderDate:g}";
            text.SetTextColor(Color.Black);
            text.TextSize = 16;
            return view;
        }

        public void UpdateData(List<Reminder> reminders)
        {
            _reminders = reminders;
            NotifyDataSetChanged();
        }
    }
}