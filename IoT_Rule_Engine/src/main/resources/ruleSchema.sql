create table rule_database (
	id identity,
	name varchar(20) not null,
	rule_type varchar(20) not null,
	classroom varchar(20) not null,
	cond_low_temp int not null,
	cond_high_temp int not null,
	cond_status varchar(20) not null,
	cond_lock varchar(20) not null,
	is_rule_check boolean not null,
	act_projector boolean not null,
	act_light boolean not null,
	act_ac boolean not null,
	act_ac_temp int not null,
	act_cctv boolean not null,
	trans_temp boolean not null,
	trans_cctv boolean not null
);
