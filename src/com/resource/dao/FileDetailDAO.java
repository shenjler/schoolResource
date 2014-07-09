package com.resource.dao;

import com.resource.vo.FileDetail;

public interface FileDetailDAO {

	public FileDetail queryByFileId(int file_id) throws Exception ;
}
