using Android.App;
using Android.OS;
using Android.Widget;
using Remindly.Data;
using System.Linq;

namespace Remindly
{
    [Activity(Label = "Lista przypomnień")]
    public class ReminderListActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_reminder_list);

            var listView = FindViewById<ListView>(Resource.Id.reminderListView);

            using (var db = new AppDbContext())
            {
                db.Database.EnsureCreated();
                var reminders = db.Reminders.ToList();
                listView.Adapter = new ArrayAdapter(this,
                    Android.Resource.Layout.SimpleListItem1,
                    reminders.Select(r => $"{r.Title} - {r.ReminderDate:g}").ToArray());
            }
        }
    }
}