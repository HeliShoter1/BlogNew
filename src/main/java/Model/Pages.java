package Model;

import java.sql.Date;

public class Pages {
	private int id;
	private String title;
	private String description;
	private String content;
	private int view;
	private Date date;
	private String img;
	
	public Pages(int id, String title, String description, String content,int view, Date date, String img) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.content = content;
		this.view = view;
		this.date = date;
		this.img = img;
	}
	
	public int getId() {
		return this.id;
	}
	
	public int getView() {
		return this.view;
	}
	
	public String getTitle() {
		return this.title;
	}
	
	public String getDescription() {
		return this.description;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public Date getDate() {
		return this.date;
	}
	
	public String getImg() {
		return this.img;
	}
	
	public void setID(int id) {
		this.id = id;
	}
	
	public void setView(int view) {
		this.view = view;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public void setImg(String img) {
		this.img = img;
	}

	@Override
    public String toString() {
        return "{"
        		+ "\"Id\":\"" + this.id + 
       		 "\", \"Title\":\"" + this.title + 
       		 "\", \"description\":\"" + this.description + 
       		 "\", \"content\":\"" + this.content +  
       		 "\"}" ; 
    }
}
