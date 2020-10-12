package com.scit.web12.vo;

import lombok.Data;

@Data
public class BoardVO {
	private int board_no;
	private String board_title;
	private String board_content;
	private String member_id;
	private String board_indate;
	private int board_view;
	private int board_like;
	private String lat;
	private String lon;
	private String originalfile;
	private String savedfile;
	private int like_check;
}
