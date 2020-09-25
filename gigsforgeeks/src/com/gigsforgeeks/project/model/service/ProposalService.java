package com.gigsforgeeks.project.model.service;

import static com.gigsforgeeks.common.JDBCTemplate.commit;
import static com.gigsforgeeks.common.JDBCTemplate.getConnection;
import static com.gigsforgeeks.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.gigsforgeeks.project.model.dao.ProposalDAO;
import com.gigsforgeeks.project.model.vo.Proposal;

public class ProposalService {
	
	/**
	 * 사용자에게서 전달받은 입찰견적서 제안내용  
	 * 
	 * @param proposalInfo		   사용자가 입력한 제안내용
	 * @param proposalPrice		   사용자가 입력한 제안가격
	 * @param proposalStart		   사용자가 입력한 작업시작날짜
	 * @param proposalEnd		  사용자가 입력한 작업마감날짜
	 * @return					  처리된 행수
	 */
	public int insertProposal(Proposal proposal) {
		
		Connection conn = getConnection();
		
		int result = new ProposalDAO().insertProposal(conn, proposal);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}

}
