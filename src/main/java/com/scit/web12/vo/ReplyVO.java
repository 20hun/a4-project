package com.scit.web12.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int comment_no;
	private int balloon_no;
	private String member_id;
	private String reply_comment;
	private String reply_indate;
}
