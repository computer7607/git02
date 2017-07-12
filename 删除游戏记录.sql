select * from GM_AWARD_FILE where GAME_CODE = '0312' ;
select * from GM_GAME_BUSI_STATUS where GAME_CODE = '0312' ;
select * from GM_PRIZE_LEVEL_FILE t where game_code = '0312' ;
--入库明细汇总 
select * from WM_TRADE_IN_SUMMARY t where t.game_code='0312' ;
--游戏印刷批次 
select * from GM_GAME_PRINT_BATCH t where t.game_code='0312';
--库存
select * from WM_INVENTORY t where t.game_code='0312';
--库存流水 
select count(*) from WM_INVENTORY_FLOW t where t.game_code='0312';
--容器历史跟踪;
select count(*)from WM_CONTAINER_HIS t where t.game_code='0312';
--入库容器明细 
select count(*) from WM_TRADE_IN_CONTAINER t where t.game_code='0312';
select  * from WM_TRADE_IN_CONTAINER t where t.game_code='0312';
 --容器
select count(*) from WM_CONTAINER t where t.game_code='0312';
--运输文件明细
select * from PM_SEAL_DOC t where t.game_code='0312';
--工作单
select * from PM_PURCHASE_ORDER  t WHERE t.game_code='0312';
--任务单
select * from PM_PRODUCE_ORDER t WHERE t.game_code='0312';
--质检单
select * from PM_QUALITY_DOC t where t.game_code='0312';
--封存单
select * from PM_SEAL_DOC t where t.game_code='0312';
--delete from PM_SEAL_DOC t where t.game_code='0312';

--采购订单
select * from PM_PURCHASE_ORDER t where t.game_code='0312';
--游戏
select * from GM_GAME t where t.game_code='0312';
--国家仓库到货入库明细
select * from WM_TRADE_IN_DETAIL t where t.game_code='0312';

--游戏
select * from GM_GAME t where t.game_code='0312';
select * from gm_import_file_his t where t.game_code='0312';
select * from gm_transport_file t where t.game_code='0312';

select * from gm_transport_file_detail t where t.game_code='0312';
select count(unique(award_seq_no)) from gm_transport_file_detail t where t.game_code='0312';
select * from gm_game_prize_level where game_code = '0312'


---------------------------------------------------------------------------------------------------------------------------
--单独删除一个游戏的一个批次步骤
--1.
select * from gm_import_file_his t where t.game_code = 0312
delete from gm_import_file_his t where t.game_code = 0312 and t.trans_no = '03'--300000000037279224,300000000037929250,300000000036629198

--2.
select * from gm_transport_file t where t.game_code='0312';
delete from gm_transport_file t where t.game_code='0312' and t.trans_no = '03'

--3.
25000是第三批次
select transport_file_id,count(*) from gm_transport_file_detail t where t.game_code='0312' group by transport_file_id;

select t.row_id,t.* from gm_transport_file_detail t where t.game_code='0312';
delete from gm_transport_file_detail t where t.game_code='0312' and t.transport_file_id = '300002092407442211';

--35游戏导入失败删除
--1.查询是否为1万条数据
select count(*)
  from gm_game_award_detail t
 where t.supgamecode = '350312'
 and t.gmawardfileid = '300379215812984243';
 
--2.删除1万条数据
delete from gm_game_award_detail t
 where t.supgamecode = '350312'
 and t.gmawardfileid = '300379215812984243';
--3.确认执行结果是否影响了1万条数据
--4.提交
commit;
--5.再次确认是否已经删除，为0则为已经删除
select count(*)
  from gm_game_award_detail t
 where t.supgamecode = '350312'
 and t.gmawardfileid = '300379215812984243';

--35游戏导入成功后删除
--1.**兑奖文件**--
select t.row_id,t.trans_no,t.award_file_name,t.created_date from GM_AWARD_FILE t where t.game_code = '0408'

select t.gmawardfileid，count(*)
  from gm_game_award_detail t
 where t.supgamecode = '350408'
group by t.gmawardfileid;--GM_AWARD_FILE.row_id ==gm_game_award_detail.gmawardfileid
--2.**运输文件**--
select * from gm_transport_file t where t.game_code='0408';
select * from gm_transport_file_detail t where t.game_code='0408';--gm_transport_file.row_id = gm_transport_file_detail.TRANSPORT_FILE_ID
--3.**文件导入历史**--
select t.row_id,t.trans_no,t.import_type_code,t.import_type_name,t.import_file_name from gm_import_file_his t where t.game_code='0408';
----------------------------------

