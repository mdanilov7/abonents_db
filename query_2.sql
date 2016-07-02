select ST_ABONENTS.C_NAME as "ABONENT_NAME", 
       count(*) as "CNT"
from QRY_QUEUE, ST_ABONENTS, QRY_TYPE
where to_char(C_IN_TIME, 'HH24') >= 9  and
      to_char(C_IN_TIME, 'HH24') <= 18 and
      QRY_QUEUE.C_QRY_TYPE = QRY_TYPE.ID and 
      QRY_TYPE.C_AB_REF = ST_ABONENTS.ID
group by ST_ABONENTS.C_NAME;