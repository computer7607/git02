select * from GM_AWARD_FILE where GAME_CODE = '0312' ;
select * from GM_GAME_BUSI_STATUS where GAME_CODE = '0312' ;
select * from GM_PRIZE_LEVEL_FILE t where game_code = '0312' ;
--�����ϸ���� 
select * from WM_TRADE_IN_SUMMARY t where t.game_code='0312' ;
--��Ϸӡˢ���� 
select * from GM_GAME_PRINT_BATCH t where t.game_code='0312';
--���
select * from WM_INVENTORY t where t.game_code='0312';
--�����ˮ 
select count(*) from WM_INVENTORY_FLOW t where t.game_code='0312';
--������ʷ����;
select count(*)from WM_CONTAINER_HIS t where t.game_code='0312';
--���������ϸ 
select count(*) from WM_TRADE_IN_CONTAINER t where t.game_code='0312';
select  * from WM_TRADE_IN_CONTAINER t where t.game_code='0312';
 --����
select count(*) from WM_CONTAINER t where t.game_code='0312';
--�����ļ���ϸ
select * from PM_SEAL_DOC t where t.game_code='0312';
--������
select * from PM_PURCHASE_ORDER  t WHERE t.game_code='0312';
--����
select * from PM_PRODUCE_ORDER t WHERE t.game_code='0312';
--�ʼ쵥
select * from PM_QUALITY_DOC t where t.game_code='0312';
--��浥
select * from PM_SEAL_DOC t where t.game_code='0312';
--delete from PM_SEAL_DOC t where t.game_code='0312';

--�ɹ�����
select * from PM_PURCHASE_ORDER t where t.game_code='0312';
--��Ϸ
select * from GM_GAME t where t.game_code='0312';
--���Ҳֿ⵽�������ϸ
select * from WM_TRADE_IN_DETAIL t where t.game_code='0312';

--��Ϸ
select * from GM_GAME t where t.game_code='0312';
select * from gm_import_file_his t where t.game_code='0312';
select * from gm_transport_file t where t.game_code='0312';

select * from gm_transport_file_detail t where t.game_code='0312';
select count(unique(award_seq_no)) from gm_transport_file_detail t where t.game_code='0312';
select * from gm_game_prize_level where game_code = '0312'


---------------------------------------------------------------------------------------------------------------------------
--����ɾ��һ����Ϸ��һ�����β���
--1.
select * from gm_import_file_his t where t.game_code = 0312
delete from gm_import_file_his t where t.game_code = 0312 and t.trans_no = '03'--300000000037279224,300000000037929250,300000000036629198

--2.
select * from gm_transport_file t where t.game_code='0312';
delete from gm_transport_file t where t.game_code='0312' and t.trans_no = '03'

--3.
25000�ǵ�������
select transport_file_id,count(*) from gm_transport_file_detail t where t.game_code='0312' group by transport_file_id;

select t.row_id,t.* from gm_transport_file_detail t where t.game_code='0312';
delete from gm_transport_file_detail t where t.game_code='0312' and t.transport_file_id = '300002092407442211';

--35��Ϸ����ʧ��ɾ��
--1.��ѯ�Ƿ�Ϊ1��������
select count(*)
  from gm_game_award_detail t
 where t.supgamecode = '350312'
 and t.gmawardfileid = '300379215812984243';
 
--2.ɾ��1��������
delete from gm_game_award_detail t
 where t.supgamecode = '350312'
 and t.gmawardfileid = '300379215812984243';
--3.ȷ��ִ�н���Ƿ�Ӱ����1��������
--4.�ύ
commit;
--5.�ٴ�ȷ���Ƿ��Ѿ�ɾ����Ϊ0��Ϊ�Ѿ�ɾ��
select count(*)
  from gm_game_award_detail t
 where t.supgamecode = '350312'
 and t.gmawardfileid = '300379215812984243';

--35��Ϸ����ɹ���ɾ��
--1.**�ҽ��ļ�**--
select t.row_id,t.trans_no,t.award_file_name,t.created_date from GM_AWARD_FILE t where t.game_code = '0408'

select t.gmawardfileid��count(*)
  from gm_game_award_detail t
 where t.supgamecode = '350408'
group by t.gmawardfileid;--GM_AWARD_FILE.row_id ==gm_game_award_detail.gmawardfileid
--2.**�����ļ�**--
select * from gm_transport_file t where t.game_code='0408';
select * from gm_transport_file_detail t where t.game_code='0408';--gm_transport_file.row_id = gm_transport_file_detail.TRANSPORT_FILE_ID
--3.**�ļ�������ʷ**--
select t.row_id,t.trans_no,t.import_type_code,t.import_type_name,t.import_file_name from gm_import_file_his t where t.game_code='0408';
----------------------------------

