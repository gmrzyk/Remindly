using System;

namespace Remindly.Data
{
    public class Reminder
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Notes { get; set; }
        public DateTime ReminderDate { get; set; }
    }
}