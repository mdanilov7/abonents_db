select ST_ABONENTS.C_NAME as "ABONENT_NAME",
       count (*) as "CNT"
from ST_ABONENTS, QRY_QUEUE, QRY_TYPE
where QRY_QUEUE.C_QRY_TYPE = QRY_TYPE.ID and 
      QRY_TYPE.C_AB_REF = ST_ABONENTS.ID and 
      QRY_QUEUE.C_ST=0
group by ST_ABONENTS.C_NAME
having count (*) < 20;