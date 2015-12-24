CREATE TABLE IF NOT EXISTS user (
  id int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  name varchar(20) NOT NULL COMMENT '名字',
  success int(10) NULL DEFAULT 0 COMMENT '目标完成数量',
  failure int(10) NULL DEFAULT 0 COMMENT '失败数量',
  praise int(10) NULL DEFAULT 0 COMMENT '被赞数量',
  despise int(10) NULL DEFAULT 0 COMMENT '被鄙视数量',
  date_of_birthdate date DEFAULT NULL COMMENT '生日',
  gender varchar(1) DEFAULT 'm' COMMENT '性别',
  creationDate date NOT NULL COMMENT '创建日期',
  PRIMARY KEY(id)
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=10000 COMMENT '用户表';

CREATE TABLE IF NOT EXISTS task (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '任务id',
	ownerId int(10) NOT NULL COMMENT '创建人id',
	name varchar(30) NOT NULL COMMENT '任务名称',
	praise int(10) NULL DEFAULT 0 COMMENT '被赞数量',
    despise int(10) NULL DEFAULT 0 COMMENT '被鄙视数量',
	creationDate date NOT NULL COMMENT '创建日期',
	expired boolean NOT NULL DEFAULT false COMMENT'任务是否过期',
	completed boolean NOT NULL DEFAULT false COMMENT '是否完成',
	completionDate date DEFAULT NULL COMMENT '完成日期',
	PRIMARY KEY(id, ownerId),
	FOREIGN KEY(ownerId) REFERENCES user(id) 
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=10000 COMMENT '任务表';

CREATE TABLE IF NOT EXISTS public_group (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '群组id',
	name varchar(30) NOT NULL COMMENT '群组名称',
	ownerId int(10) NOT NULL COMMENT '创建人id',
	creationDate date NOT NULL COMMENT '创建日期',
	PRIMARY KEY(id),
	FOREIGN KEY(ownerId) REFERENCES user(id) 
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=10000 COMMENT '公共群组表';

CREATE TABLE IF NOT EXISTS private_group (
	id int(10) NOT NULL AUTO_INCREMENT COMMENT '群组id',
	name varchar(30) NOT NULL COMMENT '群组名称',
	userId1 int(10) NOT NULL COMMENT '用户1 id',
	userId2 int(10) NOT NULL COMMENT '用户2 id',
	ownerId int(10) NOT NULL COMMENT '创建人id',
	creationDate date NOT NULL COMMENT '创建日期',
	PRIMARY KEY(id),
	FOREIGN KEY(userId1) REFERENCES user(id),
	FOREIGN KEY(userId2) REFERENCES user(id),
	FOREIGN KEY(ownerId) REFERENCES user(id) 
) DEFAULT CHARSET=utf8 AUTO_INCREMENT=10000 COMMENT '私人群组表';