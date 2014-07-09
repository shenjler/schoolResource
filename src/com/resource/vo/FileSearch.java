package com.resource.vo;

public class FileSearch {
	private int file_id;	//文件id
	private String file_display_name;	//文件名-网页上显示
	private String course_name;	//课程名
	private String college_name;	//学院名
	
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int fileId) {
		file_id = fileId;
	}
	public String getFile_display_name() {
		return file_display_name;
	}
	public void setFile_display_name(String fileDisplayName) {
		file_display_name = fileDisplayName;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String courseName) {
		course_name = courseName;
	}
	public String getCollege_name() {
		return college_name;
	}
	public void setCollege_name(String collegeName) {
		college_name = collegeName;
	}
	
}
