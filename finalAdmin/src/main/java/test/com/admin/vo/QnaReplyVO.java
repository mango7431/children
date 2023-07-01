package test.com.admin.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaReplyVO {

	public int qnareply_num;
	public int qna_num;
	public String qnareply_title;
	public String qnareply_content;
	public Timestamp qnareply_date;
	
}
