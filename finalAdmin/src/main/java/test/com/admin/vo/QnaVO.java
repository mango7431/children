package test.com.admin.vo;

import lombok.Data;

@Data
public class QnaVO {
	public int qna_num;
	public String qna_title;
	public String qna_content;
	public String writer;
	public String qna_date;
	public int qna_status;
	public String qna_category;
}
