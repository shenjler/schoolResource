package com.resource.dao;

import java.util.List;

import com.resource.vo.*;

public interface CcgcDAO {
	
	public Ccgc queryCcgc(Ccgc ccgc) throws Exception;//根据年级、学院、专业、课程找到对应的ccgc
	
	public String queryCollegeName(int college_id) throws Exception;//根据学院id找到对应的学院name
	public String queryCourseName(int course_id) throws Exception;//
	
	public List<Ccgc> queryGrade(int college_id) throws Exception;//根据学院找到对应的年级
	
	public List<Ccgc> queryClass(int college_id,int grade_id) throws Exception;//根据学院、年级找到对应的班级
	
	public List<Ccgc> queryCourse(int college_id,int grade_id,int class_id) throws Exception;//根据学院学院、年级、班级找到对应的课程


}
