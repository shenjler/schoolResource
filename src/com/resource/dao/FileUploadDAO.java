package com.resource.dao;

import java.util.List;

import com.resource.vo.*;


public interface FileUploadDAO {

	
	public int addFile(FileUpload fileUpload) throws Exception ;//�ϴ��ļ�
	public int queryFileId() throws Exception ;
	public List<FileUpload> queryByTime() throws Exception ;//��ѯ�������ϴ���
	public List<FileUpload> queryByNum() throws Exception ;//��ѯ���������ء�
	public FileUpload queryById(int file_id) throws Exception ;
	public int deleteFile(int file_id) throws Exception ;
}
