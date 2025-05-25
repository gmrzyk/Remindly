using Android.App;
using Android.Content;
using Android.OS;
using Android.Widget;

namespace Remindly
{
    [Activity(Label = "Remindly", MainLauncher = true)]
    public class MainActivity : Activity
    {
        protected override void OnCreate(Bundle savedInstanceState)
        {
            base.OnCreate(savedInstanceState);
            SetContentView(Resource.Layout.activity_main);

            FindViewById<Button>(Resource.Id.btnAdd).Click += (s, e) =>
            {
                StartActivity(typeof(AddReminderActivity));
            };

            FindViewById<Button>(Resource.Id.btnList).Click += (s, e) =>
            {
                StartActivity(typeof(ReminderListActivity));
            };
        }
    }
}