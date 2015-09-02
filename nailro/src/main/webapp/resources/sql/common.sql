
create table member (
    id nvarchar(10) not null,
    name nvarchar(30),  
    pass nvarchar(50), 
    age int,  
    gender int,  
    phone nvarchar(15),  
    homephone nvarchar(15), 
    email nvarchar(50),  
    joindate datetime,  
    merit nvarchar(10),  
    address nvarchar(250)
);


alter table member
    add
        constraint pk_member
        primary key(
            id 
        );


create table station (
    station_code nvarchar(10) not null, 
    station_name nvarchar(20),  
    distance int
);


alter table station
    add
        constraint pk_station
        primary key (
            station_code 
        );

create table train (
    train_code nvarchar(10) not null, 
    train_name nvarchar(20),  
    maker_id nvarchar(10), 
    seat_count int 
);


alter table train
    add
        constraint pk_train
        primary key (
            train_code 
        );


create table maker (
    maker_id nvarchar(10) not null, 
    maker_name nvarchar(20)
);


alter table maker
    add
        constraint pk_maker
        primary key(
            maker_id
        );


create table run_train (
    run_train_code nvarchar(10) not null,  
    run_timecode nvarchar(10) not null,  
    railline_code nvarchar(10) not null,  
    train_code nvarchar(10), 
	run_train_date datetime 
 );
 


alter table run_train
    add
        constraint pk_run_train
        primary key (
            run_train_code
        );

create table area (
    area_code nvarchar(10) not null,
    area_name nvarchar(10) 
);

alter table area
    add
        constraint pk_area
        primary key (
            area_code
        );

create table pkg_goods (
    pkg_code nvarchar(10) not null,  
    area_code nvarchar(10) not null, 
    pkg_name nvarchar(50), 
    pkg_terma datetime, 
    pkg_termb datetime, 
    pkg_tel nvarchar(15),  
    saler_code nvarchar(10), 
    mt_code nvarchar(10),  
    pkg_keep_code nvarchar(10),  
    pkg_price int,  
    pkg_about nvarchar(255),
        grade int,  
        path varchar(50)
);


alter table pkg_goods
    add
        constraint pk_pkg_goods
        primary key (
            pkg_code 
        );
    

create table saler (
    saler_code nvarchar(10) not null, 
    saler_phone nvarchar(15),  
    saler_name nvarchar(15) 
);


alter table saler
    add
        constraint pk_saler
        primary key (
            saler_code
        );


create table pkg_mt (
    mt_code nvarchar(10) not null, 
    mt_address nvarchar(250), 
    mt_name nvarchar(30), 
    mt_phone nvarchar(15),  
    mt_info nvarchar(50),  
    mt_about nvarchar(50),  
    mt_price int 
);


alter table pkg_mt
    add
        constraint pk_pkg_mt
        primary key (
            mt_code
        );


create table pkg_reservation (
pkg_keep_code int auto_increment primary key, 
    reseve_code int not null, 
    pkg_msg nvarchar(50),  
    pkg_sms int,  
    id nvarchar(10),  
    pkg_res_date datetime, 
    pkg_code nvarchar(10),
    pay int
);

 



create table train_mem_reserv (
    reserv_code nvarchar(10) not null, 
    id nvarchar(10)
);


alter table train_mem_reserv
    add
        constraint pk_train_mem_reserv
        primary key(
            reserv_code 
        );


create table train_nomem_reserv (
    nm_reserv_code nvarchar(10) not null, 
    phone nvarchar(15),  
    pass nvarchar(50) 
);


alter table train_nomem_reserv
    add
        constraint pk_train_nomem_reserv
        primary key (
            nm_reserv_code 
        );

create table bbs (
bbs_no int auto_increment primary key, 
    id nvarchar(10), 
    bbs_title nvarchar(90),  
    bbs_content nvarchar(600),  
    bbs_date datetime,  
    bbs_path nvarchar(100),  
    bbs_cnt int 
);





create table reple (
  bbs_no int,  
  reple_no int auto_increment primary key, 
  id nvarchar(10), 
  reple_date datetime, 
  reple_content nvarchar(600) 
);


alter table reple
    add
        constraint fk_mem_to_reple
        foreign key (
            id
        )
        references member (
            id
        );

alter table reple
    add
        constraint fk_bbs_to_reple
        foreign key (
            bbs_no
        )
        references bbs (
            bbs_no
        );

create table run_station (
    railline_code nvarchar(10) not null,  
    station_10 nvarchar(10), 
    station_9 nvarchar(10),  
    station_8 nvarchar(10), 
    station_7 nvarchar(10),  
    station_6 nvarchar(10), 
    station_5 nvarchar(10), 
    station_4 nvarchar(10), 
    station_3 nvarchar(10),  
    station_2 nvarchar(10), 
    railline_name nvarchar(20), 
    station_1 nvarchar(10) 
);


alter table run_station
    add
        constraint pk_run_station
        primary key  (
            railline_code
        );


create table credit_company_info (
    crd_code nvarchar(10) not null, 
    crd_name nvarchar(30)
);


alter table credit_company_info
    add
        constraint pk_crd_com_info
        primary key (
            crd_code
        );


create table notice (
bbs_no int auto_increment primary key, 
    bbs_title nvarchar(90), 
    bbs_content nvarchar(600), 
    bbs_date datetime,  
    bbs_path nvarchar(100),  
    bbs_cnt int 
);




create table reserve (
reseve_code int auto_increment primary key, 
    start_time datetime not null,  
    run_train_code nvarchar(10) not null, 
    seat_num nvarchar(10) not null,  
    reserv_code nvarchar(10), 
    crd_code nvarchar(10), 
    check_time datetime,  
    credit_card_num nvarchar(100),  
    card_rimit_date datetime,
    pkg_sms int,  
    id nvarchar(10),  
    pkg_res_date datetime, 
    nm_reserv_code nvarchar(10), 
    start_station nvarchar(10), 
    end_station nvarchar(10), 
        pay int(10)
);






create table admin (
    admin_id nvarchar(10) not null,
    admin_pass nvarchar(10) 
);


alter table admin
    add
        constraint pk_admin
        primary key (
            admin_id 
        );


create table run_stn_time (
    run_timecode nvarchar(10) not null, 
    railline_code nvarchar(10) not null,  
    stn_2_time datetime,  
    stn_5_time datetime, 
    stn_6_time datetime,  
    stn_7_time datetime,  
    stn_8_time datetime,  
    stn_9_time datetime,  
    stn_10_time datetime,  
    stn_3_time datetime, 
    stn_4_time datetime, 
    stn_1_time datetime
);


alter table run_stn_time
    add
        constraint pk_run_stn_time
        primary key  (
            run_timecode
        );

create table seat (
    run_train_code nvarchar(10) not null, 
    seat_num nvarchar(10) not null,  
    start_time datetime not null,  
    end_time datetime 
);


alter table seat
    add
        constraint pk_seat
        primary key  (
            run_train_code , 
            seat_num , 
            start_time 
        );



create table chart (
    month nvarchar(10) not null,  
    cnt int,  
    income int 
);


alter table chart
    add
        constraint pk_chart
        primary key  (
            month 
        );


alter table train
    add
        constraint fk_mk_to_tr
        foreign key (
            maker_id
        )
        references maker (
            maker_id
        );


alter table run_train
    add
        constraint fk_tr_to_r_tr
        foreign key (
            train_code
        )
        references train (
            train_code
        );


alter table run_train
    add
        constraint fk_r_stn_t_r_tr
        foreign key (
            run_timecode
        )
        references run_stn_time (
            run_timecode
        );


alter table run_train
    add
        constraint fk_r_stn_r_tr
        foreign key (
            railline_code
        )
        references run_station (
            railline_code
        );


alter table pkg_goods
    add
        constraint fk_pkg_mt_p_gds
        foreign key (
            mt_code
        )
        references pkg_mt (
            mt_code
        );


alter table pkg_goods
    add
        constraint fk_ar_to_pkg_gds
        foreign key (
            area_code
        )
        references area (
            area_code
        );

alter table pkg_reservation
    add
        constraint fk_reservation_code
        foreign key(
            pkg_code
        )
        references pkg_goods(
            pkg_code
        );


alter table pkg_reservation
    add
        constraint fk_mem_pkg_reserv
        foreign key (
            id
        )
        references member (
            id
        );


alter table pkg_reservation
    add
        constraint fk_reserv_pkg_reserv
        foreign key (
            reseve_code
        )
        references reserve (
            reseve_code
        );


alter table train_mem_reserv
    add
        constraint fk_mem_tr_mem_reserv
        foreign key (
            id
        )
        references member (
            id
        );


alter table bbs
    add
        constraint fk_mem_to_bbs
        foreign key (
            id
        )
        references member (
            id
        );

alter table reple
    add
        constraint fk_mem_to_reple1
        foreign key (
            id
        )
        references member (
            id
        );

alter table reple
    add
        constraint fk_bbs_to_reple1
        foreign key (
            bbs_no
        )
        references bbs (
            bbs_no
        );

alter table run_station
    add
        constraint fk_stn_r_stn
        foreign key (
            station_1
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn2
        foreign key (
            station_2
        )
        references station (
            station_code
        );

alter table run_station
    add
        constraint fk_stn_r_stn3
        foreign key (
            station_3
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn4
        foreign key (
            station_4
        )
        references station (
            station_code
        );
    

alter table run_station
    add
        constraint fk_stn_r_stn5
        foreign key (
            station_5
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn6
        foreign key (
            station_6
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn7
        foreign key (
            station_7
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn8
        foreign key (
            station_8
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn9
        foreign key (
            station_9
        )
        references station (
            station_code
        );


alter table run_station
    add
        constraint fk_stn_r_stn10
        foreign key (
            station_10
        )
        references station (
            station_code
        );


alter table reserve
    add
        constraint fk_crd_comp_info_res
        foreign key (
            crd_code
        )
        references credit_company_info (
            crd_code
        );


alter table reserve
    add
        constraint fk_tr_nomem_res_res
        foreign key (
            nm_reserv_code
        )
        references train_nomem_reserv (
            nm_reserv_code
        );


alter table reserve
    add
        constraint fk_tr_mem_res_res
        foreign key (
            reserv_code
        )
        references train_mem_reserv (
            reserv_code
        );


alter table reserve
    add
        constraint fk_seat_to_reserve
        foreign key (
            run_train_code, 
            seat_num, 
            start_time
        )
        references seat (
            run_train_code, 
            seat_num, 
            start_time
        );


alter table saler
    add
        constraint fk_saler_to_sale
        foreign key (
            saler_code
        )
        references saler (
            saler_code
        );


alter table run_stn_time
    add
        constraint fk_r_stn_r_stn_time
        foreign key (
            railline_code
        )
        references run_station (
            railline_code
        );


alter table seat
    add
        constraint fk_r_tr_to_seat1
        foreign key (
            run_train_code
        )
        references run_train (
            run_train_code
        );
        
   
create or replace view v_profit as
select distinct r.reseve_code ,t.train_name , r.pay , r.start_time
from reserve r join  seat s  on r.run_train_code = s.run_train_code 
join run_train rr on s.run_train_code = rr.run_train_code join train t on
 rr.train_code = t.train_code;



create or replace view v_train as 
select
m.maker_name maker_name,
train.train_code train_code,
train.train_name train_name,
train.maker_id maker_id,
train.seat_count seat_count
from
train
inner join maker m on train.maker_id = m.maker_id;



create or replace view v_run_trainlist1  as
select rt.run_train_date ,rt.train_code  , rs.station_1, rs.station_2, rs.station_3 , rs.station_4 ,rs.station_5 , rs.station_6 ,rs.station_7 , rs.station_8 ,rs.station_9,rs.station_10
from  run_train rt  join    run_station rs            
on rt.railline_code = rs.railline_code  join run_stn_time rst on  rs.railline_code = rst.railline_code;



insert into member(id,pass)values('m1','123');
insert into member(id,pass)values('m2','123');
insert into member(id,pass)values('m3','123');
insert into member(id,pass)values('m4','123');
insert into member(id,pass)values('m5','123');
insert into member(id,pass)values('m01','123');
insert into member(id,pass)values('m02','123');
insert into member(id,pass)values('m03','123');
insert into member(id,pass)values('m04','123');
insert into member(id,pass)values('m05','123');
insert into member(id,pass)values('admin','123');

insert into area(area_code,area_name)
values('ac02','서울');
insert into area(area_code,area_name)
values('ac051','부산');
insert into area(area_code,area_name)
values('ac053','대구');
insert into area(area_code,area_name)
values('ac032','인천');
insert into area(area_code,area_name)
values('ac062','광주');
insert into area(area_code,area_name)
values('ac052','울산');
insert into area(area_code,area_name)
values('ac044','세종');
insert into area(area_code,area_name)
values('ac031','경기');
insert into area(area_code,area_name)
values('ac055','경남');




insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc01','경기도','신라호텔','031-978-4564','신설','풀수영장',100000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc02','경남','신라호텔1','031-978-4564','신설','풀수영장',800000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc03','세종','신라호텔2','031-978-4564','신설','풀수영장',900000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc04','울산','신라호텔3','031-978-4564','신설','풀수영장',100000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc05','광주','신라호텔4','031-978-4564','신설','풀수영장',1500000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc06','서울','신라호텔5','031-978-4564','신설','풀수영장',1010000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc07','인천','신라호텔6','031-978-4564','신설','풀수영장',1001000);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc08','부산','신라호텔7','031-978-4564','신설','풀수영장',1000100);
insert into pkg_mt(mt_code,mt_address,mt_name,mt_phone,mt_info,mt_about,mt_price)
values('mc09','대구','신라호텔8','031-978-4564','신설','풀수영장',1004000);




insert into saler(saler_code,saler_phone,saler_name)
values('sal01','010-5487-4531','홍길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal02','010-5487-4131','김길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal03','010-5457-4531','박길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal04','010-4287-4531','금길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal05','010-5487-4531','정길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal06','010-5487-4131','호길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal07','010-5457-4531','일길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal08','010-4287-4531','윤길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal09','010-5457-4531','쌈길동');
insert into saler(saler_code,saler_phone,saler_name)
values('sal10','010-4287-4531','사길동');




insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc01','낭만여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal01','mc01',11000,'없음',3,'ac031','travel.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc02','우정여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal01','mc02',11000,'없음',5,'ac052','travel2.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc03','커플여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal02','mc03',11000,'없음',7,'ac031','travel3.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc04','힐링여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal02','mc05',11000,'없음',9,'ac031','travel4.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc05','나홀로여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal03','mc06',11000,'없음',1,'ac031','travel5.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc06','이별여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal06','mc07',11000,'없음',0,'ac02','travel6.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc07','결혼여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal07','mc08',11000,'없음',8,'ac062','travel.jpg');
insert into pkg_goods(pkg_code,pkg_name,pkg_terma,pkg_termb,pkg_tel,saler_code,mt_code,pkg_price,pkg_about,grade,area_code,path)
values('pc08','겨울여행',str_to_date('2015-07-15','%Y-%m-%d'),str_to_date('2015-07-20','%y-%m-%d'),'031-978-4564','sal08','mc09',11000,'없음',5,'ac031','travel2.jpg');



insert into maker values('a10','대우');
insert into maker values('b10','두산');
insert into maker values('c10','섬성');
insert into maker values('d10','엘지');


insert into train values('aa10','무궁화','a10',80);
insert into train values('bb10','새마을','b10',70);
insert into train values('cc10','ktx','c10',60);
insert into train values('aa20','무궁화','a10',80);
insert into train values('bb20','새마을','b10',70);
insert into train values('cc20','ktx','c10',60);
insert into train values('aa300','무궁화','a10',80);
insert into train values('bb30','새마을','b10',70);
insert into train values('cc30','ktx','c10',60);


insert into station values('st10','서울역',0);
insert into station values('st20','부산역',300);
insert into station values('st30','대전역',100);
insert into station values('st40','대구역',250);
insert into station values('st50','광주역',0);
insert into station values('st60','목포역',300);
insert into station values('st70','전주역',100);
insert into station values('st80','강릉역',250);
insert into station values('st90','동대구역',250);
insert into station values('st11','수원역',250);
insert into station values('st12','영등포역',50);
insert into station values('st13','천안역',150);
insert into station values('st14','영동역',190);
insert into station values('st15','김천역',210);



insert into run_station(railline_code,railline_name,station_1,station_2,station_3,station_4,station_5,station_6,station_7,station_8,station_9,station_10)
values('rc01','서울-부산','st10','st11','st30','st90','st40','st70','st80','st50','st60','st20');
insert into run_station(railline_code,railline_name,station_1,station_2,station_3,station_4,station_5,station_6,station_7,station_8,station_9,station_10)
values('rc02','서울-대구','st10','st11','st30','st13','st40','st70','st80','st50','st60','st90');
insert into run_station(railline_code,railline_name,station_1,station_2,station_3,station_4,station_5,station_6,station_7,station_8,station_9)
values('rc03','서울-목포','st10','st11','st30','st13','st40','st70','st80','st50','st60');

desc run_station;

insert into run_stn_time(run_timecode,railline_code,stn_1_time,stn_2_time,stn_3_time,stn_4_time,stn_5_time,stn_6_time,stn_7_time,stn_8_time,stn_9_time,stn_10_time)
values('10:00','rc01',
'2015-07-16 10:10:00',
'2015-07-16 10:20:00',
'2015-07-16 10:30:00',
'2015-07-16 10:40:00',
'2015-07-16 10:50:00',
'2015-07-16 11:00:00',
'2015-07-16 11:10:00',
'2015-07-16 11:20:00',
'2015-07-16 11:30:00',
'2015-07-16 11:40:00');


insert into run_stn_time(run_timecode,railline_code,stn_1_time,stn_2_time,stn_3_time,stn_4_time,stn_5_time,stn_6_time,stn_7_time,stn_8_time,stn_9_time,stn_10_time)
values('12:00','rc02','0000-00-00 12:10:00','0000-00-00 12:20:00','0000-00-00 12:30:00','0000-00-00 12:40:00','0000-00-00 12:50:00','0000-00-00 13:00:00','0000-00-00 13:10:00','0000-00-00 13:20:00','0000-00-00 13:30:00','0000-00-00 13:40:00');

insert into run_stn_time(run_timecode,railline_code,stn_1_time,stn_2_time,stn_3_time,stn_4_time,stn_5_time,stn_6_time,stn_7_time,stn_8_time,stn_9_time,stn_10_time)
values('13:00','rc03',
'0000-00-00 13:10:00',
'0000-00-00 13:20:00',
'0000-00-00 13:30:00',
'0000-00-00 13:40:00',
'0000-00-00 13:50:00',
'0000-00-00 14:00:00',
'0000-00-00 14:10:00',
'0000-00-00 14:20:00',
'0000-00-00 14:30:00',
'0000-00-00 14:40:00');

commit;

select * from run_stn_time;


insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc01','10:00','rc01','aa10',str_to_date('2015-07-19','%Y-%m-%d'));
insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc02','10:00','rc01','bb10',str_to_date('2015-07-19','%Y-%m-%d'));
insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc03','10:00','rc01','cc10',str_to_date('2015-07-19','%Y-%m-%d'));
insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc04','10:00','rc01','aa20',str_to_date('2015-07-20','%Y-%m-%d'));
insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc05','12:00','rc02','bb20',str_to_date('2015-07-20','%Y-%m-%d'));
insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc06','13:00','rc03','cc20',str_to_date('2015-07-20','%Y-%m-%d'));

insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc07','13:00','rc03','cc20',str_to_date('2015-08-22','%Y-%m-%d'));
insert into run_train(run_train_code,run_timecode,railline_code,train_code,run_train_date)
values('rtc08','13:00','rc03','cc30',str_to_date('2015-07-22','%Y-%m-%d'));




insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc01','01','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc01','02','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc02','03','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc02','04','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','05','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','06','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','07','2015-07-16 10:10:00',
'2015-07-16 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','08','2015-07-17 10:10:00',
'2015-07-17 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','09','02015-07-17 10:10:00',
'2015-07-17 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','10','2015-07-17 10:10:00',
'2015-07-17 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','11','2015-07-17 10:10:00',
'2015-07-17 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc03','12','2015-07-17 10:10:00',
'2015-07-17 11:40:00');



insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc04','01','2015-07-20 10:10:00',
'2015-07-20 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc04','02','2015-07-20 10:10:00',
'2015-07-20 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc04','03','2015-07-20 10:10:00',
'2015-07-20 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc05','01','2015-07-20 12:10:00',
'2015-07-20 11:40:00');
insert into seat(run_train_code,seat_num,start_time,end_time)
values('rtc06','01','2015-07-20 13:10:00',
'2015-07-20 11:40:00');




insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay,id)
values('2015-07-20 10:10:00','rtc04','01','서울역','부산역',23000,'m01');
insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay,id)
values('2015-07-20 10:10:00','rtc04','02','서울역','부산역',23000,'m02');
insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay,id)
values('2015-07-20 10:10:00','rtc04','03','서울역','부산역',23000,'m03');
insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay,id)
values('2015-07-20 12:10:00','rtc05','01','서울역','대구역',23000,'m04');
insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay,id)
values('2015-07-20 13:10:00','rtc06','01','서울역','목포역',23000,'m05');

insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay)
values('2015-07-16 10:10:00','rtc01','01','서울역','목포역',23000);
insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay)
values('2015-07-16 10:10:00','rtc01','02','서울역','목포역',23000);
insert into reserve(start_time,run_train_code,seat_num,start_station,end_station,pay)
values('2015-07-16 10:10:00','rtc02','03','서울역','목포역',23000);





insert into pkg_reservation(pkg_msg,pkg_sms,id,reseve_code,pkg_res_date)
values('요구사항없음',0,'m01','6',now());
insert into pkg_reservation(pkg_msg,pkg_sms,id,reseve_code,pkg_res_date)
values('요구사항없음',0,'m02','7',now());
insert into pkg_reservation(pkg_msg,pkg_sms,id,reseve_code,pkg_res_date)
values('요구사항없음',0,'m03','8',now());



