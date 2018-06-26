DROP TABLE EDUOFF;

CREATE TABLE EDUOFF(
COURSE_ID VARCHAR2(500) PRIMARY KEY NOT NULL, -- 강의ID
COURSE_NM VARCHAR2(500), --강의명
COURSE_GUBUN VARCHAR2(20), --강의구분
COURSE_REQUEST_STR_DT VARCHAR2(500),  --신청시작일
COURSE_REQUEST_END_DT VARCHAR2(500),  --신청종료일
COURSE_STR_DT VARCHAR2(500),  --교육시작일
COURSE_END_DT VARCHAR2(500),  --교육종료일
COURSE_TARGET VARCHAR2(100), --학습대상
CAPACITY VARCHAR2(500),   --정원
COURSE_APPLY_URL VARCHAR2(2000) --수강신청 URL
);

SELECT * FROM EDUOFF;




INSERT INTO EDUOFF
VALUES('ad1','벨리댄스','오프라인','20180525','20180525','20180601','20180630','성인','20','https://bit.ly/2JXkCVt');

INSERT INTO EDUOFF
VALUES('2','스마트폰 기본알기','오프라인','20180525','20180525','20180601','20180630','성인','20','https://bit.ly/2MBFdk0');

INSERT INTO EDUOFF
VALUES('ad3','강좌명 : 단체급식조리원 양성과정','오프라인','20180525','20180525','20180601','20180630','성인','20','https://bit.ly/2JTkK8w');

INSERT INTO EDUOFF
VALUES('4','인문정신으로 읽는 대중음악','오프라인','20180525','20180525','20180601','20180630','성인','20','https://bit.ly/2tikCIy');

INSERT INTO EDUOFF
VALUES('5','통통인문학 교과서가 보이는 노래','오프라인','20180525','20180525','20180601','20180630','성인','20','https://bit.ly/2M3tNEf');

INSERT INTO EDUOFF
VALUES('6','노원맑은소리 가곡교실','오프라인','20180525','20180525','20180601','20180630','성인','20','https://bit.ly/2leAp7E/');


INSERT INTO EDUOFF
VALUES('a235421025222','단전호흡','오프라인','20180423','20180615','20180501','20180630','성인','40','https://bit.ly/2lowsxh');

INSERT INTO EDUOFF
VALUES('a235422225222','건강체조교실(라인댄스) ','오프라인','20180423','20180615','20180501','20180630','성인','30','https://bit.ly/2K5IUg4');

INSERT INTO EDUOFF
VALUES('a235421025523','에어로빅 ','오프라인','20180423','20180615','20180501','20180630','성인','20','https://bit.ly/2yFCVxp');

INSERT INTO EDUOFF
VALUES('a235427725222','요가 ','오프라인','20180423','20180615','20180501','20180630','성인','20','https://bit.ly/2Ibbdbj');

INSERT INTO EDUOFF
VALUES('a235421025295','서예교실 ','오프라인','20180423','20180615','20180501','20180620','성인','10','https://bit.ly/2K6Sdwb');

INSERT INTO EDUOFF
VALUES('a235424646222','[공예,플로리스트] ★개강확정★[4주]천연소이캔들만들기(수시접수 가능)','오프라인','20180425','20180620','20180601','20180630','성인','30','https://bit.ly/2ywEai1');

INSERT INTO EDUOFF
VALUES('a235421055222','강좌명 : 나만의 비누/천연화장품만들기','오프라인','20180423','20180620','20180601','20180622','성인','15','https://bit.ly/2K808tl');

--
INSERT INTO EDUOFF
VALUES('b234421112222','여성의 눈으로 보는 서울역사기행','오프라인','20180405','20180621','20180417','20180628','성인','12','https://bit.ly/2Md1UK9');

INSERT INTO EDUOFF
VALUES('a230021025222','강좌명 : 리빙퀼트(주말) [ A52 ]','오프라인','20180423','20180615','20180501','20180620','성인','10','https://bit.ly/2tqW3ZT');

INSERT INTO EDUOFF
VALUES('a235421225222',' 강좌명 : 도시텃밭&생활원예지도사 [ A20 ]','오프라인','20180423','20180615','20180501','20180620','성인','10','https://bit.ly/2yxlRtk');

INSERT INTO EDUOFF
VALUES('a235421025253','제과기능사 속성반','오프라인','20180423','20180615','20180501','20180620','성인','10','https://bit.ly/2MLPUR6');

INSERT INTO EDUOFF
VALUES('a235421055253','중식조리기능사 자격증취득 실기집중반
','오프라인','20180423','20180615','20180501','20180620','성인','10','https://bit.ly/2K7ePzP');

INSERT INTO EDUOFF
VALUES('a234221025253','다이어트 줌바 댄스','오프라인','20180423','20180610','20180501','20180620','성인','10','https://bit.ly/2tvZuyK');

INSERT INTO EDUOFF
VALUES('b235421025222','단전호흡','오프라인','20180423','20180615','20180503','20180620','성인','10','https://bit.ly/2K7C3CT');

INSERT INTO EDUOFF
VALUES('a235421025201','통증해소 운동교실(삼양관)','오프라인','20180423','20180613','20180505','20180620','성인','10','https://bit.ly/2llMmbI');

INSERT INTO EDUOFF
VALUES('a235421025287','노래교실(삼양관)','오프라인','20180423','20180615','20180504','20180620','성인','10','https://bit.ly/2JTTg6J');

INSERT INTO EDUOFF
VALUES('a235421025224','탁구교실(주간-삼양관)','오프라인','20180423','20180604','20180501','20180620','성인','10','https://bit.ly/2Ia03n7');

INSERT INTO EDUOFF
VALUES('a235421025321','정리수납컨설팅 - 영등포여성인력개발센터','오프라인','20180425','20180615','20180501','20180620','성인','10','https://bit.ly/2JTTg6J');

INSERT INTO EDUOFF
VALUES('a235421025002','사교댄스','오프라인','20180423','20180615','20180501','20180620','성인','24','https://bit.ly/2M7TF1U');

INSERT INTO EDUOFF
VALUES('a235421025512','우쿨렐레(초급반) ','오프라인','20180423','20180615','20180501','20180620','성인','20','https://bit.ly/2llgrYO');

INSERT INTO EDUOFF
VALUES('a235422225622','하모니카교실','오프라인','20180423','20180615','20180501','20180620','성인','30','https://bit.ly/2lnB9aw');

INSERT INTO EDUOFF
VALUES('a235421024564','중국어교실','오프라인','20180423','20180615','20180501','20180620','성인','15','https://bit.ly/2lmjLmx');

INSERT INTO EDUOFF
VALUES('a235421024522','남성요리교실','오프라인','20180423','20180615','20180501','20180620','성인','12','https://bit.ly/2Ibfhbe');

INSERT INTO EDUOFF
VALUES('a235421024511','통기타교실(I)','오프라인','20180423','20180615','20180501','20180620','성인','10','https://bit.ly/2KbR3CI');

INSERT INTO EDUOFF
VALUES('a255421024511','동양철학','오프라인','20180423','20180615','20180501','20180620','성인','8','https://bit.ly/2trGfGd');

INSERT INTO EDUOFF
VALUES('a235421024516','팝송영어B (오후반)','오프라인','20180423','20180615','20180501','20180620','성인','18','https://bit.ly/2MIhj6d');

INSERT INTO EDUOFF
VALUES('a235421026311','체형교정운동(snpe)','오프라인','20180423','20180615','20180501','20180620','성인','24','https://bit.ly/2KbPHYW');

INSERT INTO EDUOFF
VALUES('a234421024511','하이미술교실A (7세~3학년 A)','오프라인','20180423','20180615','20180501','20180620','성인','20','https://bit.ly/2JVq4fv');

INSERT INTO EDUOFF
VALUES('a222421024511','가락장구와 경기민요','오프라인','20180423','20180615','20180501','20180620','성인','25','https://bit.ly/2ytl78z');

INSERT INTO EDUOFF
VALUES('a2354210245s1','실버체육','오프라인','20180423','20180615','20180501','20180620','성인','20','https://bit.ly/2K3jf7H');

INSERT INTO EDUOFF
VALUES('a235421024519','천상의 소리 오카리나','오프라인','20180423','20180615','20180501','20180620','성인','20','https://bit.ly/2MJ3m8l');




