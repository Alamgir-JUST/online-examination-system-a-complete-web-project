package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.mquesadd;
import com.util.DBConnection;

public class QuesaddDao {
	
	public String questionadd(mquesadd questionaddBean) throws ClassNotFoundException {
		
		String quesno = questionaddBean.getQno();
		String examid = questionaddBean.getExamid();
		String qlabel = questionaddBean.getQlabel();
		String ques = questionaddBean.getQues();
		String ans1 = questionaddBean.getAns1();
		String ans2 = questionaddBean.getAns2();
		String ans3 = questionaddBean.getAns3();
		String ans4 = questionaddBean.getAns4();
		String cans = questionaddBean.getCans();
		
		ArrayList<String> mylist = new ArrayList<String>();
		mylist.add(ans1);
		mylist.add(ans2);
		mylist.add(ans3);
		mylist.add(ans4);
		
		
		Connection conn = null;
		 PreparedStatement pst = null;
		 PreparedStatement pst2 = null;

		 try {
			conn = DBConnection.createConnection();
			String query = "insert into tbl_question(QuesNo,Ques,ExamId,QLabel) values (?,?,?,?)";
			pst = conn.prepareStatement(query);
			pst.setString(1, quesno);
			pst.setString(2, ques);
			pst.setString(3, examid);
			pst.setString(4, qlabel);
			
			int x2=0;
			
			for(String xx:mylist) {
				String query1 = "insert into tbl_answer(QuesNo,RightAns,Ans) values (?,?,?)";
				pst2 = conn.prepareStatement(query1);
				pst2.setString(1, quesno);
				pst2.setString(2, cans);
				pst2.setString(3, xx);
				x2 = pst2.executeUpdate();
			}		
			int x = pst.executeUpdate();
					
			if(x!=0) {
				return "SUCCESS";
			}
			if(x2!=0) {
				return "SUCCESS";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return "Something went wrong there!!!!!!!!!!!";
	  // On failure, send a message from here.
	}
}
