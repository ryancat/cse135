package degree;

public class Degree{
	private String location;
	private String university;
	private String discipline;
	private String year, month;
	private String gpa;
	private String title;

	/*
	 * default Degree constructor
	 */
	public Degree(){
		location = "";
		university = "";
		discipline = "";
		year = "";
		month = "";
		gpa = "";
		title = "";
	}

	/*
	 * Degree constructor with arguments
	 */
	public Degree(String location, String university, String discipline,
	String year, String month, String gpa, String title){
		this.location = location;
		this.university = university;
		this.discipline = discipline;
		this.year = year;
		this.month = month;
		this.gpa = gpa;
		this.title = title;
	}
	
	/*
	 * The member functions
	 */
	public String getLocation(){
		return location;
	}

	public void setLocation(String location){
		this.location = location;
	}

	public String getUniversity(){
		return university;
	}
	
	public void setUniversity(String university){
		this.university = university;
	}

	public String getDiscipline(){
		return discipline;
	}

	public void setDiscipline(String discipline){
	       this.discipline = discipline;
	}

	public String getYear(){
                
		return year;
	}

	public void setYear(String year){
                if(year.equals(null) || year.equals("")){
                  this.year = "empty";
                }
                else{
		this.year = year;
                }
	}
	
	public String getMonth(){
		return month;
	}

	public void setMonth(String month){
		if(month.equals(null) || month.equals("")){
		this.month = "empty";
		} else {
		this.month = month;
		}
	}

	public String getGpa(){
		return gpa;
	}
	
	public void setGpa(String gpa){
		if(gpa.equals(null) || gpa.equals("")){
		this.gpa = "empty";
		} else {
		this.gpa = gpa;
		}
	}

	public String getTitle(){
		return title;
	}

	public void setTitle(String title){
		this.title = title;
	}
}
