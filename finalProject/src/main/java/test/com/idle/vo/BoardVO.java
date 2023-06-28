package test.com.idle.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BoardVO {
	
	private int board_num;
	private String board_title;
	private String board_content;
	private String writer;
	private int board_report;
	private Timestamp board_date;
	private int view_count;
	private String category;
	private String deal_region;
	private int price;
	private String board_savename1;
	private String board_savename2;
	private String board_savename3;
	private int board_status;
	private int board_type;

}
