create table hb_table (
	board_no			number 			primary key	
	,member_id		varchar2(20) 		not null
	,board_title		varchar2(200) 		not null
	,board_context		varchar2(2000)		not null
	,board_indate		date		default	sysdate
	,board_hits		number 			default 0	
	,originalfile		varchar2(200)	
	,savedfile			varchar2(100)
	,constraint hb_fk foreign key(member_id)
		references homerare_table(member_id) on delete cascade
);

create sequence hb_seq;