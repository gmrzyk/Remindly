package crc64b3fe9a5ce9ab0f42;


public class AddReminderActivity
	extends android.app.Activity
	implements
		mono.android.IGCUserPeer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onCreate:(Landroid/os/Bundle;)V:GetOnCreate_Landroid_os_Bundle_Handler\n" +
			"";
		mono.android.Runtime.register ("Remindly.AddReminderActivity, Remindly", AddReminderActivity.class, __md_methods);
	}


	public AddReminderActivity ()
	{
		super ();
		if (getClass () == AddReminderActivity.class) {
			mono.android.TypeManager.Activate ("Remindly.AddReminderActivity, Remindly", "", this, new java.lang.Object[] {  });
		}
	}


	public void onCreate (android.os.Bundle p0)
	{
		n_onCreate (p0);
	}

	private native void n_onCreate (android.os.Bundle p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}
