package com.gigsforgeeks.service.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.*;

import java.sql.Connection;

import com.gigsforgeeks.service.model.dao.EnquiryDao;
import com.gigsforgeeks.service.model.vo.Enquiry;

public class EnquiryService {

	
	public int insertEnquiry(Enquiry enq) {
		
		Connection conn = getConnection();
		
		int result = new EnquiryDao().insertEnquiry(conn, enq);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
}
