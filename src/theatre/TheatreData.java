package theatre;

public class TheatreData
{
	public String name;
	public String location;
	public String time;
	public String show_date;
	
	public TheatreData(String show_date,String time,String name,String location)
	{
		this.name=name;
		this.location=location;
		this.time=time;
		this.show_date=show_date;
	}
	
	public String getShow_date() {
		return show_date;
	}

	public void setShow_date(String show_date) {
		this.show_date = show_date;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	
	
}
