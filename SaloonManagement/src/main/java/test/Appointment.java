package test;

import java.sql.Date;
import java.sql.Time;

public class Appointment 
{

	    private String salonName;
	    private String serviceName;
	    private Date date;
	    private Time time;
	    private String status;

	  
	    public Appointment() {}

	    
	    public String getSalonName() {
	        return salonName;
	    }

	    public void setSalonName(String salonName) {
	        this.salonName = salonName;
	    }

	    public String getServiceName() {
	        return serviceName;
	    }

	    public void setServiceName(String serviceName) {
	        this.serviceName = serviceName;
	    }

	    public Date getDate() {
	        return date;
	    }

	    public void setDate(Date date) {
	        this.date = date;
	    }

	    public Time getTime() {
	        return time;
	    }

	    public void setTime(Time time) {
	        this.time = time;
	    }

	    public String getStatus() {
	        return status;
	    }

	    public void setStatus(String status) {
	        this.status = status;
	    }
	}


