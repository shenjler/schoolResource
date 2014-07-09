package com.resource.dao;

import java.util.List;

import com.resource.vo.FileSearch;


public interface FileSearchDAO {
	
	public List<FileSearch> queryByCollege(int currpage,int everpage,int college_id) throws Exception ;//��ѧԺ��ѯ�ļ�
	public int findCollegeFileCount(int college_id) throws Exception ;
	public List<FileSearch> queryByCourse(int currpage,int everpage,int college_id,int course_id) throws Exception ;
	public int findCourseFileCount(int college_id,int course_id) throws Exception ;
	public int findFileSearchCount(String search) throws Exception ;
	public List<FileSearch> queryByLike(int currpage,int everpage,String search) throws Exception;
}
